//The program displays a simplified version of the solar system with 
//all the planets moving at different speeds around the sun

//Muhammad Bin Nauman mbn304
//due: 7/6/2020 at 1PM
//referance: https://www.youtube.com/watch?v=o9sgjuh-CBM

class planets
{
  float planet_x;
  float planet_y;
  float planet_height;
  float planet_width;                      // class planet that takes the arguments of color, placement, size and speed
  float r;
  float g;
  float b;
  float speed;

  planets(float x, float y, float w, float h, int red, int green, int blue, float move)
  {
    planet_x = x;
    planet_y = y;
    planet_height = h;                    // constructor that defines all the varibles mentioned above
    planet_width = w;
    r = red;
    g = green;
    b = blue;
    speed = move;
  }

  void update()
  {
    translate(960, 540);
    rotate(PI/10 + speed);            // rotate the entire screen from the center axis at a constant speed
    speed += 0.01;
  }

  void display()
  {
    if (planet_height < 100)
    {
      noFill();
      stroke(255);                                        // displays a white circle around the path of each planet
      arc(0, 0, planet_x*2, planet_x*2, 0, 2*PI);
    }
    fill(r, g, b);
    ellipse(planet_x, planet_y, planet_height, planet_width);      // displays a planet with its own color, size and distence from the center of the screen
    noFill();
    stroke(255);
    ellipse(planet_x, planet_y, planet_height, planet_width);      // displays a white border around each planet
  }
}

planets sun = new planets (0, 0, 100, 100, 252, 212, 64, 0);
planets mercury = new planets (55, 0, 25, 25, 140, 127, 133, random(1, 100) );
planets venus = new planets (130, 0, 25, 25, 255, 181, 104, random(1, 100));
planets earth = new planets (205, 0, 25, 25, 52, 66, 119, random(1, 50));
planets mars = new planets (280, 0, 25, 25, 147, 72, 56, random(1, 50));
planets jupiter = new planets (350, 0, 75, 75, 188, 175, 178, random(1, 25));          // making instances of all the planets with custom arguments 
planets saturn = new planets (430, 0, 75, 75, 205, 160, 86, random(1, 25));
planets uranus = new planets (505, 0, 50, 50, 213, 251, 252, random(1, 12.5));
planets neptune = new planets (580, 0, 50, 50, 91, 93, 223, random(1, 12.5));

void setup()

{
  size(1920, 1080);          // size of the screen    
  frameRate(60);              // Frames per second to be displayed
}

void draw()
{
  background(0);

  push();
  sun.update();
  sun.display();            // drawing each planet with its own transformations 
  pop();

  push();
  earth.update();
  earth.display();
  fill(255);
  ellipse(205, 20, 7, 7); // creates a moon with the earth
  pop();

  push();
  mercury.update();
  mercury.display();
  pop(); 

  push();
  venus.update();
  venus.display();
  pop(); 

  push();
  mars.update();
  mars.display();
  pop(); 

  push();
  jupiter.update();
  jupiter.display();
  fill(200,40,40);
  ellipse(350, 20, 13,20);    // makes the red spot on jupiter
  pop(); 

  push();
  saturn.update();
  arc(430, 0, 100, 20, 0, 2*PI);    // adding a bit of detail to the ring around saturn
  saturn.display();
  arc(430, 0, 100, 20, 0, 2*PI);  // makes the ring around saturn
  pop(); 

  push();
  uranus.update();
  uranus.display();
  pop(); 

  push();
  neptune.update();
  neptune.display();
  pop();
}
