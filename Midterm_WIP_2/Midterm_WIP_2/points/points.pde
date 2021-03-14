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
  background (0);
  imageMode(CENTER); //draws images from center point
  font = createFont("font.TTF", 60,true);

  //Assign image to object using loadImage() method
  catHand= loadImage("cat_hand.png");
  
for (int i = 0; i < items.length; i++){
    items[i] = loadImage ("item_" + i + ".png");
  }
}

void draw() {
  background(255, 160, 122); 
  items();
  fill(0);
  textSize(32);
  textFont(font);
  text(score, 500, 100);
  
  //display image with image() method, x and y coordinate of image
  tint(255);
  image (catHand, mouseX, 900,500,500);
  //is the player colliding with the ground?
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
if(itemX > (mouseX - 200) && itemX < (mouseX +200) && fall == 690){
    fall = 0;
    itemX = random(1400);
    point = true;
    
    minusPoint();
    point();
    
    }
  else if (fall < 1200){
    fall = fall + 15;
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
