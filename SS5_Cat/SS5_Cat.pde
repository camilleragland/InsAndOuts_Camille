//Camille Victoria Ragland
//No user interaction

PImage[] blink = new PImage [8];  // creates new PImage array called anim with 13 positions

int frame = 0;
boolean forward; 

int timer= 2000; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 
PImage catblink;

void setup() {
  size(1100, 400); 
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
  image(catblink, width/2, height/2, width, height);
  currentTime=millis();  //update currentTime in draw so that it is continuously updating
  if (currentTime-savedTime > timer) { 
 catblink();
 savedTime=currentTime; //assign value of currentTime to savedTime
   }

}

void catblink(){
  
background(0);
imageMode(CENTER);
image(blink[frame], width/2, height/2, width, height);

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
