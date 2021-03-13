
//Create a PImage object to store image
PImage cathand;  //Creates a PImage object called cupcake
int handStop = 1580;
int handPos = mouseX;

PImage fish;
int fall = 0;
float fishX = random (1580);


void setup() {
  fullScreen();
  background (0);
  imageMode(CENTER); //draws images from center point
  

  //Assign image to object using loadImage() method
  cathand= loadImage("cat_hand.png");
  fish = loadImage("fish.png");
}  

void draw() {
  background(0);  
  fish();

  //display image with image() method, x and y coordinate of image
  tint(255);
  image (cathand, mouseX, 900,500,500);
  //is the player colliding with the ground?
  if ( mouseX  > handStop) {
    tint(0);
   image(cathand,mouseX, 900,500,500);
   tint(255);
  }
}

void fish(){

image(fish, fishX ,fall, 300,300);
  if(fishX > (mouseX - 200) && fishX < (mouseX +200) && fall == 690){
    fall = 0;
    fishX = random(1580);
    println("FishX:" + fishX);
    println("handPos:" + mouseX);
    }
  else if (fall < 1200){
    fall = fall + 15;
    println("FishX:" + fishX);
    println("handPos:" + mouseX);
  }
  else{
  fall = 0;
  fishX = random(1580);
  }
}
