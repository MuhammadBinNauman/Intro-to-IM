//The program uses a set of images to make a animation 
// The program also had a intended use of moving a image across the screen

//Muhammad Bin Nauman
//due: 7/7/2020 at 1PM

PImage space;                      // loading the image of the background
int maximage = 8;                  // max images for the array of images
int maximage_2 = 6;                // 
int imageindex = 0;                // tracking the index of the image
int imageindex_2 = 0;
PImage[] earth = new PImage[maximage];        // making a array of images
PImage [] explosion = new PImage[maximage_2];


class move_ship                              // class that would move a object image across the screen
{
  float pos_x;
  float pos_y;
  float speed;
  PImage ship;

  move_ship(float x, float y)              //constructor for the initial position of the image
  {
    pos_x = x;
    pos_y = y;
    speed = 5;
    ship = loadImage("playership.png");
  }
  void update()                          // updating the position of the image
  {
    pos_y -= speed;
    if (pos_y < 100)
    {
      pos_y = 600;
    }
    println(pos_y);
  }
  void display()                        // displaying the image at its new position
  {
    image(ship, pos_x, pos_y);
  }
}

move_ship x_wing;

void setup()
{
  frameRate(144);
  x_wing = new move_ship(130,400);
  size(800, 500);
  space = loadImage("space.png");            // assigning the image to a variable
  background(space);                        // making the background the image

  for (int i = 0; i < earth.length; i++)          // a loop to assign all the images to a array of images
  {
    int j = i+1;
    earth[i] = loadImage("earth"+ j + ".jpg");
  }
  for (int j = 0; j < 6; j++)                    // a loop to assign all the images to a array of images

  {
    int k = j+1;
    explosion[j] = loadImage("explode"+ k + ".jpg");
  }
}

void draw()            
{
  background(space);
  image(earth[imageindex], 550, 250);                    // the location of the first array of images 
  image(explosion[imageindex_2], 100,0);                  // the location of the second array of images 
  x_wing.update();
  x_wing.display();

  if (frameCount%15 == 0)                    // after a certain time passes go to the next image in both arrays array
  {
    imageindex +=1;
    imageindex_2 +=1;
    println(imageindex_2);
    println(maximage_2);
    if (imageindex == maximage)          // if last image reached in the array then go to the first image
    {
      imageindex = 0;
    }
    if (imageindex_2 == maximage_2)     // similar process
    {
      imageindex_2 = 0;
    }
  }
}
