PImage catBlink;
PImage[] blink = new PImage [8];  
int frame = 0;
boolean forward; 

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 


PImage catHand;
int handStop = 1580;
int handPos = mouseX;

PImage fish;
int fall = 0;
float fishX = random (1400);

void setup() {
  fullScreen();
  frameRate(10);
  
  catBlink = loadImage( "catblink_0.png");
  catHand = loadImage("cat_hand.png");
  fish = loadImage("fish.png");
  
  for (int i = 0; i < blink.length; i++){
    blink[i] = loadImage ("catblink_" + i + ".png");
  }
}

void draw() {
  catTimer();
}

void catTimer(){
background(0);
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

  forward = true;
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
  fish();
image (catHand, mouseX, 900,500,500);
catblink();
 if ( mouseX  > handStop) {
    tint(0);
   image(catHand,mouseX, 900,500,500);
   tint(255);
  }
 
}

void fish(){

image(fish, fishX ,fall, 300,300);
  if(fishX > (mouseX - 200) && fishX < (mouseX +200) && fall == 700){
    fall = 0;
    fishX = random(1400);
    }
  else if (fall < 1200){
    fall = fall + 70;
  }
  else{
  fall = 0;
  fishX = random(1400);
  }
}
