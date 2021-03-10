//Camille Victoria Ragland - Nature
//click on the screen and it will change randomly
//got help from chapter 15-9 loading images into an array of textbook

PImage bird;
PImage butterfly;
PImage cactus;
PImage flower;

int maxImages = 4;
int imageIndex = 0;

PImage[] images = new PImage[maxImages];


void setup(){
size (1080,1080);
background(255);
imageMode(CENTER);
textAlign(CENTER);
textSize(55);

images[0] = loadImage("bird.jpg");
images[1] = loadImage("butterfly.jpg");
images[2] = loadImage("cactus.jpg");
images[3] = loadImage("flower.jpg");

String[] filenames = {"bird.jpg","butterfly.jpg","cactus.jpg",
                      "flower.jpg"};
                      
  for (int i = 0; i < filenames.length; i++){
    images[i] = loadImage(filenames[i]);
     }


}


void draw (){
  background(255);
  
  image(images[imageIndex], 0, 0);
}

void mousePressed() {

  imageIndex = int(random(images.length));
}
