float Xspeed = 4; // the speed of the squares coming from the right
int count = 0;
models[] enemies = new models[1000];       // array of enemies
models[] enemies_adder = new models[1000]; // array of enemies that will be added into the game 

class models
{
  float pos_x;            // the X axis of the enemies
  float pos_y;            // the Y axis of the enemies
  float speed_x; 

  models(float xpos, float ypos) // contructor for the axis position and the movement
  {
    pos_x = xpos;
    pos_y = ypos;
    speed_x = Xspeed;
  }
  
  void enemies_update()        //moves the enemies at a constant speed to the left of the screen
  {      
    pos_x -= speed_x;
  }
  
  void collision ()            // check to see if the mouse controlled player and enemies have collided
  {
    if (pos_x == mouseX && pos_y == mouseY)
    {
      println("you lost");
    }
  }
  
  void enemies_display()           // display the enemies as red squares
  {
    fill(255, 50, 0);
    rect(pos_x, pos_y, 12.5, 12.5);
  }
}

models player_model = new models(400, 400);       // initilize display the player at a spefic point

void setup()
{
  size(1500, 800);
  background(0);
  frameRate(100);
  for (int i = 0; i < enemies.length; i++ )                    // assigns the enemies to random values on the y and x axis offscreen
  {
    enemies[i] = new models(random(1600, 1700), random(800));
    enemies_adder[i] = new models(0, random(800));
  }
}

void draw()
{
  background(0);
  fill(0, 0, 200);
  rectMode(RADIUS);                      // rectangles will be made from the center rather than the side
  rect(mouseX, mouseY, 12.5, 12.5);      // the player is a blue rectangle controlled by the mouse
  fill(255, 50, 0);
  if (frameCount%5 == 0)                // spawn a new enemy after every 5 frames
  {
    enemies_adder[count] = enemies[count];    // add the random enemies form on generated array to the other display array so that they can be added without problem to display and update functions 
    count++;
  }
  for (int i = 0; i < enemies_adder.length; i++)    // transverse the display array
  {    
    enemies_adder[i].enemies_update();              // update the positions of the enemies
    enemies_adder[i].enemies_display();              // display the new updated locations of the enemies
    if (enemies_adder[i].pos_x == mouseX && enemies_adder[i].pos_y == mouseY) // check to see if there is collision and print gameover if condition is meet
    {
      println("you lose");
    }
  }
}
