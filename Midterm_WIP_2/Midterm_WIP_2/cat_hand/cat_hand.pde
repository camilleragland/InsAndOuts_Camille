
//Create a PImage object to store image
PImage cathand;  //Creates a PImage object called cupcake
int handStop = 1580;
int handPos = mouseX;


void setup() {
  fullScreen();
  background (0);
  imageMode(CENTER); //draws images from center point

  //Assign image to object using loadImage() method
  cathand= loadImage("cat_hand.png");
}  

void draw() {
  background(0);  

  //display image with image() method, x and y coordinate of image
  tint(255);
  image (cathand, mouseX, 900,500,500);
  //is the player colliding with the ground?
  if ( mouseX  > handStop) {
    tint(0);
   image(cathand,mouseX, 900,500,500);
  }
}
