// The Player will controll a ship that will go through a asteroid field that will increase in density as the time passes
// The player must avoid collision from the asteroids while also collecting optional bonus points until a caertain time 
// has passed. after that the game will be won and the final score will be displayed

// Muhammad Bin Nauman mbn304
// Due: 10 June 1AM

// No outside source other than what has been provided by the professor.

// Instruction: control the ship with the mouse and dodge the asteroids GOOD LUCK!!!

import ddf.minim.*;                                            // loading in the library for sounds
Minim minim;
AudioPlayer BGM;                                               // declare a varible that plays the music (BGM = Back ground music)

int maximage = 8;                                              // max images for the array of images
int imageindex = 0;                                            // tracking the index of the image
PImage [] explosion = new PImage[maximage];                    // array of images for when the ship touches the enemies
PImage space, player_ship;                                     // declaring all the images needed

enemies[] spawner = new enemies[1000];                         // array of enemy spawner
bonus [] points = new bonus[4];                                // array of bonus points spawner

int spawn_count = 0;
int spawn_extra = 0;
int spawn_increase = 100;                                     
int decrease = 1;                                              // all the varibles responsible for spawning in objects and endgame functions 
int last_score = 0;
float big_drop = 4000;

int extra = 0;                                                 // variable to add extra points

boolean end = false;                                           // variable for ending the game 

class enemies
{
  float pos_x;                                                  // the X axis location of the enemies
  float pos_y;                                                  // the Y axis location of the enemies
  float speed_x;                                                // the speed at which they will transverse the screen
  int hit_count;                                                // varible to check whether the ship touched a enemy
  enemies(float xpos, float ypos)                               // contructor for the axis position and the movement
  {
    pos_x = xpos;
    pos_y = ypos;
    speed_x = 4;
    hit_count = 0;
  }

  void update()                                                  //moves the enemies at a constant speed to the left of the screen
  {      
    pos_x -= speed_x;

    for (int i = 0; i < spawner.length; i++ )                    // checks if the ship has collided with enemies and if yes prevents further collisions 
    {
      if ((spawner[i].pos_x - mouseX <= 45 && spawner[i].pos_x - mouseX >= -25) && (spawner[i].pos_y - mouseY <= 45 && spawner[i].pos_y - mouseY >= -45)) // distence function
      {
        if (hit_count < 2)
        {
          last_score = frameCount/10;                            // stop the score from being added when collision happens
          hit_count ++;
        }
      }
    }
  }
  void display()                                                 // display the enemies as white circles (space rocks)
  {
    fill(128, 132, 135);
    ellipse(pos_x, pos_y, 25, 25);
  }
}

class bonus                                                      // class to spawn multicolor squares that will give the player extra points for colliding into
{
  float pos_x;
  float pos_y;                                                   // The x and y axis of the bonus points
  float speed_x;
  float r;
  float g;                                                       // variables to give them random colors
  float b;
  bonus(float xpos, float ypos)
  {
    pos_x = xpos;
    pos_y = ypos;                                                //constructor to give them initial values
    speed_x = 5;
  }
  void update()
  {
      pos_x -= speed_x;                                          // moves the bonus points from right to left across the screen

    for (int i = 0; i < points.length; i++ )                    // assigns the spawner to random values on the y and x axis offscreen
    {
      if ((points[i].pos_x - mouseX <= 45 && points[i].pos_x - mouseX >= -25) && (points[i].pos_y - mouseY <= 45 && points[i].pos_y - mouseY >= -45)) 
      {
        extra += 200;                                          // same collision function as the enemies but instead gives bonus points 
        points[i].pos_x = -100;
      }
    }
    r = random(255);
    g = random(255);                                          // randomly change the color
    b = random(255);
  }
  void display()
  {
    fill(r, g, b);
    rect(pos_x, pos_y, 12.5, 12.5);                           // display bonus points as a colorful rectangle
  }
}

void endgame()
{
  if (frameCount >= 10000 && last_score == 0)
  {
    fill(random(255), random(255), random(255));
    textSize(60);
    text("YOU WIN !!!", 750, 400);                          // after the player survives for a long enough time the game would be won
    fill(0, 200, 0);                                        // text to congrat the player will display and the final score will be shown
    text(1050 + extra, 850, 450);                           // adds all the bonus points that the player got
    end = true;                                            // will end the spawning of more enemies 
  }
  if (last_score > 0)
  {
    textSize(60);
    fill(255, 50, 50);                                    // if the player collides with the enemy the last score calculated by the enemy class will be displayed
    text("GAME OVER", 750, 400);                          // SAD game over and final score will be displayed
    fill(0, 200, 0);                                      
    text(last_score + extra, 850, 450);                  // adds all the bonus points that the player got
    end = true;                                          // will end the spawning of more enemies
  }
}

void setup()
{
  size(1500, 800);                                        // the size of the window for the game 
  background(0);
  frameRate(100);                                          // the framerate HINT: game to hard reduce the framerate 
  space = loadImage("space.png");                          //loading in the image of the background 
  player_ship = loadImage("ship.png");                     // loading in the image for the player ship
  imageMode(CENTER);                                       // image will be displayed in the center of the axis picked

  minim = new Minim(this);
  BGM = minim.loadFile("BGM.mp3", 2048);                    // loading in the music file 
  BGM.loop();                                               // playing the music when the game starts 

  for (int j = 0; j < 8; j++)                                     // a loop to assign all the images to a array of images for when the player collides with the enemy
  {
    int k = j+1;
    explosion[j] = loadImage("explode"+ k + ".png");
  }

  for (int i = 0; i < spawner.length; i++ )                       // assigns the enemy spawner to random values on the y and x axis offscreen
  {
    spawner[i] = new enemies(random(1600, 1700), random(750));
  }
  
  for(int i = 0; i < points.length; i++)                          // doing the same as above but with bonus points 
  {
    points[i] = new bonus((random(1600, 1700)), random(750));
  }
}

void draw()
{
  background(space);                                              // display the background image 
  stroke(255);
  fill(0, 0, 200);
  rectMode(RADIUS);                                               // rectangles will be made from the center rather than the side

  if (last_score > 0)                                            // if the player collides with enemy then the playership explodes 
  {
    image(explosion[imageindex], mouseX, mouseY);                // transversing the array for the explosions 
    if (imageindex < maximage-1)
    {
      imageindex ++;
    }
  } else
  {
    image(player_ship, mouseX, mouseY, 80, 80);                   // the player ship will follow the mouse 
  }

  fill(0, 255, 50);
  textSize(32);
  text(frameCount/10 + extra, 10, 30);                            // display the score the player has with the bonus points added
  fill(255, 50, 0);

  for (int i = 0; i <= spawn_count; i++)                          // spawn in enemies according to the number allowed on screen by the spawn_count function
  {    
    spawner[i].update();                                          // update the positions of the enemies
    spawner[i].display();                                         // display the new updated locations of the enemies
  }
  for (int i = 0; i <= spawn_extra -1 ; i++)                      // spawn in the bonus points 
  {    
    points[i].update();                                          // update the positions of the bonus points 
    points[i].display();                                         // display the new updated locations of the bonus points 
  } 
  
  if (frameCount%2000 == 0 && spawn_extra < 4 && end == false)
  {
    spawn_extra += 1;                                          // loop to spawn in a bonus point after a certain time has passed
  }
  if (end == false)                                            // stop more enemies from spawning if the player collides or has survived for long enough
  {
    if (frameCount%spawn_increase == 0)                        // after a certain time has passed increase the number of enemies to spawn this will increase exponentially 
    {
      spawn_count +=1;
      spawn_increase -= decrease;
      if (spawn_increase == 26)                                // after a certain increase the ecponential increase will stop 
      {
        decrease = 0;
      }
    }
    if (frameCount == big_drop)                                // after that at certain time the number to spawns will increase
    {
      if (spawn_increase == 6)
      {
        spawn_increase = 11;
      }
      spawn_increase -= 5;                                     // increaseing the amount of enemies spawning 
      big_drop +=1000;                                         // timer for the spawn increase
    }
  } 
  endgame();                                                  // check to see if any endgame conditions has been meet 
}
