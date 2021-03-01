//Rainbow Squares- Camille Victoria Ragland
//Click to change the 

//code in setup block runs once
//remember order of statement in code blocks
float grow =  0.1;
float r = random(256);
float g = random(256);
float b = random(256);

void setup(){
size(800,800);
//putting background here makes only one background so all line shows
background(0);
}

void draw(){
//putting background here makes a new bckground so only one line shows
//creates a rectangle using grow variable for width and height
noFill();
stroke(r,g,b);
rect(pmouseX,pmouseY,grow,grow);
grow = grow + .2;

//when mouse is clicked it changes color


}
void mousePressed()
{
  //only makes light colors 
 r = random(150,266);
 g = random(150,266);
 b = random(150,266);
 
noFill();
stroke(r,g,b);
rect(pmouseX,pmouseY,grow,grow);
grow = grow + .2;
 }
 
