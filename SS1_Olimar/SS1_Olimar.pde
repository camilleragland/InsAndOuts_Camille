//Olimar by Camille Victoria Ragland
size(1080,720);
background(255,255,255);

//helmet
strokeWeight(5);
stroke(171,188,176);
fill(206,222,211,78);
ellipse(540,360,750,680);

//Olimar's head
strokeWeight(3);
stroke(201,167,97);
fill(233,202,138);
ellipse(540,360,500,420);

//Olimar's nose
stroke(203,110,56);
fill(233,164,138);
ellipse(540,400,330,220);

//Olimar's eyes
strokeWeight(7);
stroke(0,0,0);
fill(255,255,255);
line(330,270,450,270);
line(630,270,750,270);

//Olimar's mouth
fill(0,0,0);
ellipse(550,530,20,20);

//Olimar's hair
strokeWeight(3);
stroke(64,39,29);
fill(90,57,44);
triangle(400,185,500,150,450,50);
triangle(600,155,500,150,550,50);
triangle(700,200,600,155,650,50);

//Title
String title = "Olimar";
textSize(32);
text(title,100,100);
