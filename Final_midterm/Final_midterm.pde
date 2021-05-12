import processing.sound.*;

String state = "pregame";
PImage start;
PImage startClick;
PImage yes;
PImage yesClick;
PImage no;
PImage noClick;
PImage backgroundImage;
PImage crying;


SoundFile meowSound;
SoundFile angrySound;
SoundFile pointSound;
SoundFile background;
SoundFile title;


PImage catBlink;
PImage[] blink = new PImage [8];  
int frame = 0;
boolean forward; 

PImage[] meow = new PImage [9];
int meowFrame = 0;
boolean forwardMeow;

int timer2 = 6000;
int currentMeow = 0;
int savedMeow = 0;

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

int endTime = 0;
int finishedTime = 0;

PImage[] items = new PImage [5];  
int itemSelect = 0;
boolean selection;

PImage[] angry = new PImage [13];  
int next = 0;
boolean forward2 = false;

PImage[] hand = new PImage [1];
int handFrame = 0;
boolean caught;
PImage catHand;
int handStop = 1580;
int handPos = mouseX;

PImage life1;
PImage life2;
PImage life3;
int life = 3;


int fall = 0;
float itemX = random (1400);
int score = 0;
boolean point = false;

PFont font;

//initialization
void setup() {
  fullScreen();
  imageMode(CENTER); //draws images from center point
  font = createFont("font.TTF", 100,true);
  
  frameRate(60);
  catBlink = loadImage( "catblink_0.png");
  start = loadImage( "start_0.png");
  startClick = loadImage("start_1.png");
  catHand = loadImage("cat_hand_0.png");
  life1 = loadImage( "life.png");
  life2 = loadImage( "life.png");
  life3 = loadImage( "life.png");
  backgroundImage = loadImage("background.png");
  
  yes = loadImage( "yes_0.png");
  yesClick = loadImage( "yes_1.png");
  no = loadImage( "no_0.png");
  noClick = loadImage( "no_1.png");
  
  crying = loadImage( "crying.jpg");
  
  meowSound = new SoundFile(this, "meow.wav");
  angrySound = new SoundFile(this, "angry.wav");
  pointSound = new SoundFile(this, "point.wav");
  background = new SoundFile(this, "background.wav");
  title = new SoundFile (this, "title.wav");
    background.amp(0.2);
    meowSound.amp(0.3);
    angrySound.amp(0.3);
    pointSound.amp(0.1);
    title.amp(0.2);

  
  for (int i = 0; i < blink.length; i++){
    blink[i] = loadImage ("catblink_" + i + ".png");
  }
  
   for (int i = 0; i < meow.length; i++){
    meow[i] = loadImage ("meow_" + i + ".png");
  }
  
  for (int i = 0; i < items.length; i++){
    items[i] = loadImage ("item_" + i + ".png");
  }
  
  for (int i = 0; i < angry.length; i++){
    angry[i] = loadImage ("angry_" + i + ".png");
  }
  
  for (int i = 0; i < hand.length; i++){
    hand[i] = loadImage ("cat_hand_" + i + ".png");
  }
  titleMusic();
}

void draw() {
  if (state=="pregame") {
    gameMusicStop();
    background(255, 160, 122);
    title();
    
  } else if (state=="game") {
    titleMusicStop();
    catTimer();
    meowTimer();
    if(forward2==true){
      angry();
     }

    imageMode(CENTER);
    image(life1, 100, 100, 300, 300);
    image(life2, 250, 100, 300, 300);
    image(life3, 400, 100, 300, 300);
    if (fall > 1200 && itemSelect != 2){
      life --;
      loseLife();
      }
      if (life == 0){
            score = 0;
            state = "game over";
            gameMusicStop();
         }
  } else if (state=="game over") {
     
    background(255, 160, 122);
    life1 = loadImage( "life.png");
    life2 = loadImage( "life.png");
    life3 = loadImage( "life.png");
    life = 3;
   end();
    println(state);
    gameMusicStop();
}
  println(state);

}

//timer for cat blinking
void catTimer(){
background(255, 160, 122);

  fill(0);
  textSize(100);
  textFont(font);
  nf(score);
  text(score, 500, 125);
  
  catHand();
  imageMode(CENTER);
  image(catBlink, 1670, 830, 500, 500);
  currentTime=millis();  //update currentTime in draw so that it is continuously updating
  if (currentTime-savedTime > timer) { 
 catblink();
 savedTime=currentTime;
   } 
 }
   
   
 //timer for meow  
void meowTimer(){ 
  imageMode(CENTER);
  currentMeow = millis();
  if (currentMeow - savedMeow > timer2) { 
 catMeow();
 savedMeow = currentMeow; 
   }
}


//meow array
void catMeow(){
imageMode(CENTER);
image(meow[meowFrame], 1670, 830, 500, 500);
  forwardMeow = false;
  if (forwardMeow == true){
    
    if (meowFrame == meow.length-1){
      meowFrame = 0;
    }
    else{
      meowFrame++;
    } 
  }
  else {
    if (meowFrame == 0){
      meowFrame = meow.length-1;
    }
    else {
      meowSound.play();
      meowFrame--;
    }
  }
}

//blinking array
void catblink(){
imageMode(CENTER);
image(blink[frame], 1670, 830, 500, 500);
  forward = false;
  if (forward == true){
    if (frame == blink.length-1){
      frame = 0;
    }
    else{
      frame++;
    } 
  }
  else {
    if (frame == 0){
      frame = blink.length-1;
    }
    else {
      frame--;
    }
  }
}

//hand movement
void catHand(){
  items();
  
image (catHand, mouseX, 900,500,500);
catblink();

 if ( mouseX  > handStop) {
    tint(0);
   image(catHand,mouseX, 900,500,500);
   tint(255);
  }
}

//items array
void items(){
image(items[itemSelect], itemX ,fall, 300,300);
if(fall <= 0){
boolean selection = true;

if (selection == true){
  
    if (itemSelect == items.length-1){
      itemSelect = 0;
    }
    else{
      itemSelect = int(random(5));
    } 
  }
  else {
    if (itemSelect == 0){
      itemSelect = items.length-1;
    }
    else {
      itemSelect--;
    }
  }
 
}
 fall();
}

//falling motion of items
void fall (){
  
if(itemX > (mouseX - 200) && itemX < (mouseX +200) && fall == 700){
    fall = 0;
    itemX = random(1400);
    point = true;
    points();
    handCatch();
    
    }
    
  else if (fall < 1200){
    fall = fall + 70;
  }
  else{
  fall = 0;
  itemX = random(1400);
  forward2 = false;
  }
   
   
}

void handCatch(){
//caught = false;
  if (caught == true){
    if (handFrame == hand.length-1){
      handFrame = 0;
    }
    else{
      handFrame++;
    } 
  }
  else {
    if (handFrame == 0){
      handFrame = hand.length-1;
    }
    else {
      handFrame--;
    }
  }

}

//point system
void points (){
minusPoint();
if(point == true){
    pointSound.cue(1);
    pointSound.play();
    score = score + 1;
    point = false;
    forward2 = false;
    } 
}

//subtraction of points
void minusPoint (){
if (point == true && itemSelect == 2){
    life --;
    loseLife();
    score = score - 4;
    point = false;
    forward2 = true;
      if(score <= 0){
      score = 0;
      }
    } 

}

//angry cat emote
void angry(){
imageMode(CENTER);
image(angry[next], 1670, 830, 500, 500);
  
  if (forward2 == true){
    
    if (next == angry.length-1){
      next = 0;
      angrySound.cue(5);
      angrySound.play();
    }
    else{
      next ++;
      
    }
  }
  else {
    
    if (next == 0){
      
      next = angry.length-1;
    }
    else {
     
      next --;
    }
   
  }
  
   println(next);
}

//lose heart/life
void loseLife(){
  if( life ==2){
  life3 = loadImage( "dead.png");
  }
    if(life == 1){
    life2 = loadImage( "dead.png");
    }
      if(life == 0){
      life1 = loadImage( "dead.png");
      }
}

void title(){
 
 fill(255);
 textSize(300);
 textFont(font);
 textAlign(CENTER,CENTER);
 text("Cat Catch!", width/2, 200);
 
 imageMode(CENTER);
 image(catBlink, 1670, 830, 500, 500);

 
 currentTime=millis();
 if (currentTime-savedTime > timer) {
   catblink();
   savedTime=currentTime;
  } 
   
 image(start, width/2, 800, 400, 400);
   if ((mouseX < 1100 && mouseX > 790) && (mouseY < 850 && mouseY > 750)){
   image(startClick, width/2, 800, 400, 400);
   }
   //titleMusic();
}

// ending screen
void end(){
 background(0);
 fill(255);
 textSize(300);
 textFont(font);
 textAlign(CENTER,CENTER);
 text("Oh no! You lost!", width/2, 100);
 text("Wanna play again", width/2, 200);
 text("Click yes or press ESC if no", width/2, 300);
 
  image(crying, width/2, 650, 500, 500);
  image(yes, width/2, 1000, 400, 400 );
   if ((mouseX < 1100 && mouseX > 790) && (mouseY < 1050 && mouseY > 950)){
        image(yesClick, width/2, 1000, 400, 400);   }
}

void titleMusic(){
title.play();
if (state != "game" && state != "game over"){
title.loop();
}

}
//stops game music
void titleMusicStop(){
title.stop();
}

//has game music
void gameMusic(){
background.play();
if (state != "pregame" && state != "game over"){
background.loop();
}

}
//stops game music
void gameMusicStop(){
background.stop();
}

//mouseclicked
void mouseClicked() {
  if (state== "pregame" && (mouseX < 1100 && mouseX > 790) && (mouseY < 850 && mouseY > 750)) {
    state="game";
   gameMusic();
  } else if (state=="game over" && (mouseX < 1100 && mouseX > 790) && (mouseY < 1050 && mouseY > 950)) {
    state = "pregame";
    titleMusic();
  }
}
