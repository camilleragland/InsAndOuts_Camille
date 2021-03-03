//Camille Victoria Ragland - Nature
//the screen changes every second

//variables for our timer
int currentTime=0; 
int timer1= 1000; //setting up variable for a 2 second timer
int timer2=2000; 
int timer3=3000;
int timer4=4000;

PImage bird;
PImage butterfly;
PImage cactus;
PImage flower;


void setup() {
background (0);
size(1080,1080);
bird = loadImage("bird.jpg");
butterfly = loadImage("butterfly.jpg");
cactus = loadImage("cactus.jpg");
flower = loadImage("flower.jpg");
textAlign(CENTER); //aligns text
textSize(88); //sets size of text
fill(255);



}

void draw() {
  currentTime=millis();  //update currentTime in draw so that it is continuously updating


  if (currentTime>timer4) {
      background (0);
      text("world", width/2-30, height/2 - 400); //displays text with x, y coordinates
     image (bird, width/2-300, height/2-300,500,500); 
    println("timer 4 is triggered");
    
  } else if (currentTime>timer3) {
      background (0);
       text("the", width/2-30, height/2 - 400); //displays text with x, y coordinates
     image (butterfly, width/2-300, height/2-300,500,500); 
    println("timer 3 is triggered");
  }
  else if (currentTime>timer2) {
      background (0);
      text("at", width/2-30, height/2 - 400); //displays text with x, y coordinates
     image (cactus, width/2-300, height/2-300,500,500); 
    println("timer 3 is triggered");
  }
  else if (currentTime>timer1) {
      background (0);  
     text("look", width/2-30, height/2 - 400); //displays text with x, y coordinates
     image (flower, width/2-300, height/2-300,500,500); 
    println("timer 3 is triggered");
  }
  println(currentTime);
}
