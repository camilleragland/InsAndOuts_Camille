
PImage[] blink = new PImage [8];  // creates new PImage array called anim with 13 positions

int frame = 0;
boolean forward; 

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 
PImage catblink;

void setup() {
  fullScreen();
  frameRate(10);
  catblink = loadImage( "catblink_0.png");
  for (int i = 0; i < blink.length; i++){
    blink[i] = loadImage ("catblink_" + i + ".png");
  }
}

void draw() {
  catTimer();
}

void catTimer(){
background(0);
  imageMode(CENTER);
  image(catblink, 1670, 830, 500, 500);
  currentTime=millis();  //update currentTime in draw so that it is continuously updating
  if (currentTime-savedTime > timer) { 
 catblink();
 savedTime=currentTime; //assign value of currentTime to savedTime
   }

}

void catblink(){
  
background(0);
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
