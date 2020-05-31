size(800,800);

// Hair at the back of the neck
fill(43,29,20);
triangle(400,400,200,550,600,550);

// the face
fill(238,206,179);
ellipse(width/2, height/2, 375,400);

// the eyes
fill(255,255,255);
ellipse(330,400, 100, 70);
ellipse(470,400, 100, 70);
fill(43,29,20);
ellipse(330, 400, 50, 35);
ellipse(470, 400, 50, 35);

// the hair
arc(400,250,250,150, -PI, 0);
arc(330,275,220,125, -4, -PI/4);
arc(460,275,220,125, -2.5, PI/4);
rect(225,300,25,150);
rect(555,300,25,150);

// nose
fill(238,206,179);
triangle(400,450,375,475,425,475);

//Ears
arc(215,400,65,90, -1.40, PI/2);
fill(0,0,0);
arc(215,400,30,45, -1.4, PI/2, CHORD);
fill(238,206,179);
arc(570,400,65,90, -1.40, PI/2);
fill(0,0,0);
arc(570,400,30,45, -1.4, PI/2, CHORD);

//mouth
fill(255,255,255);
float x = PI;
arc(400,500,75,75,0,x, CHORD);
fill(0,0,0);
line(370,520,430,520);

//eye brows
fill(43,29,20);
arc(280,350,175,175,-.05, 0.2);
arc(530,353,175,175,-3.3, -3.05);
