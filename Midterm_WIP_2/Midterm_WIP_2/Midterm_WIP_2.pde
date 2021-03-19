PImage catBlink;
PImage[] blink = new PImage [8];  
int frame = 0;
boolean forward; 

PImage[] meow = new PImage [13];
int meowFrame = 0;
boolean forwardMeow;

int timer2 = 3000;
int currentMeow = 0;
int savedMeow = 0;

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

PImage[] items = new PImage [5];  
int itemSelect = 0;
boolean selection;

PImage[] angry = new PImage [13];  
int next = 0;
boolean forward2 = false;

PImage catHand;
int handStop = 1580;
int handPos = mouseX;


int fall = 0;
float itemX = random (1400);
int score = 0;
boolean point = false;

PFont font;

//initialization
void setup() {
  fullScreen();
  imageMode(CENTER); //draws images from center point
  font = createFont("font.TTF", 60,true);
  frameRate(60);
  catBlink = loadImage( "catblink_0.png");
  catHand = loadImage("cat_hand.png");
  
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
}

void draw() {
  catTimer();
  meowTimer();
  if(forward2==true){
    angry();
   }
}

//timer for cat blinking
void catTimer(){
background(255, 160, 122);

  fill(0);
  textSize(32);
  textFont(font);
  nf(score);
  text(score, 500, 100);
  
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
 savedMeow=currentMeow; 
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

//point system
void points (){
minusPoint();
if(point == true){
    score = score + 1;
    point = false;
    forward2 = false;
    } 
}

//subtraction of points
void minusPoint (){
if (point == true && itemSelect == 2){
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
