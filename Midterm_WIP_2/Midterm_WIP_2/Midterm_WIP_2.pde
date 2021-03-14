PImage catBlink;
PImage[] blink = new PImage [8];  
int frame = 0;
boolean forward; 

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

PImage[] items = new PImage [5];  
int itemSelect = 0;
boolean selection;

PImage catHand;
int handStop = 1580;
int handPos = mouseX;


int fall = 0;
float itemX = random (1400);
int score = 0;
boolean point = false;

PFont font;

void setup() {
  fullScreen();
  frameRate(10);
  imageMode(CENTER); //draws images from center point
  font = createFont("font.TTF", 60,true);
  
  catBlink = loadImage( "catblink_0.png");
  catHand = loadImage("cat_hand.png");
  
  for (int i = 0; i < blink.length; i++){
    blink[i] = loadImage ("catblink_" + i + ".png");
  }
  
  for (int i = 0; i < items.length; i++){
    items[i] = loadImage ("item_" + i + ".png");
  }
}

void draw() {
  catTimer();
}

void catTimer(){
background(255, 160, 122);

  fill(0);
  textSize(32);
  textFont(font);
  text(score, 500, 100);
  
  catHand();
  imageMode(CENTER);
  image(catBlink, 1670, 830, 500, 500);
  currentTime=millis();  //update currentTime in draw so that it is continuously updating
  if (currentTime-savedTime > timer) { 
 catblink();
 savedTime=currentTime; //assign value of currentTime to savedTime
   }

}

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

void fall (){
if(itemX > (mouseX - 200) && itemX < (mouseX +200) && fall == 700){
    fall = 0;
    itemX = random(1400);
    point = true;
    
    minusPoint();
    point();
    
    }
  else if (fall < 1200){
    fall = fall + 175;
  }
  else{
  fall = 0;
  itemX = random(1400);
  }
}

void point (){
if(point == true){
    score = score + 1;
    println(score);
    
    } 
}

void minusPoint (){
if(point == true && itemSelect == 2){
    score = score - 2;
    println(score);
    
    } 
}
