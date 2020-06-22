// the program uses the light sensor to simulate day and night. the colors of all the objects will change depending on the amount of light recieved on the light sensor
// the potentiometer allow you to move the player from left to right on the screen and will also change the players color
// the light sensor will also change the color of the player

// controls: change the value of the potentiometer to move the player and chage the lighting conditions around you to change the time of the day

// Muhammad Bin Nauman
// Due: 21 June 1PM

import processing.serial.*;

float red = 0;        // the pin of the light sensor that is attached to the red value
float green = 0;      // the pin of the light sensor that is attached to the green value
float blue = 0;       // the pin of the light sensor that is attached to the blue value
float move = 0;       // the pin of the pototicometer that moves the circle across the screen
float player_color = 0;  // the pin of the pototicometer that changes the color of the circle when it moves
stars[] spawner = new stars[100];  // spawner that will add random stars to the screen

Serial myPort;      // the port that the arduino will use

class stars    // will display the stars when the light sensor passes a certain value the stars will also change brightness
{
  float pos_x;        // the x axis position on the board
  float pos_y;        // the y axis position on the board
  float brightness;   // the color of the stars
  float bright_increase; // this will constatanly increase the white levels of the stars

  stars(float x, float y)
  {
    pos_x = x;
    pos_y = y;
    bright_increase = 1;
  }

  void update()
  {
    brightness += bright_increase ;      // increase the white levels until
    if (brightness >254)
    {
      bright_increase = -bright_increase;    // brightness exceeds a certain level
    }
    if (brightness < 1)                      // decrease the brightness until
    {
      bright_increase = - bright_increase;  // it goes lower than a certain value 
    }
  }
  void display()
  {
    fill(brightness);
    ellipse(pos_x, pos_y, 10, 10);    // display as stars of various levels of brightness
  }
}


void setup() {
  size(500, 500);
  myPort = new Serial(this, Serial.list()[2], 9600);              // selecting a appopriate port
  myPort.bufferUntil('\n');                                        // don't generate a serialEvent() unless you get a newline character:

  for (int i = 0; i < spawner.length; i++ )                       // assigns the star spawner to random values on the y and x axis
  {
    spawner[i] = new stars(random(0, 500), random(0, 250));    
  }
}

void draw() {
  background(0, 255 - (255 - blue), blue+20);   // set the background color with the reading from the light sensor
  println(red, green, blue, move);

  if (blue < 50)                              // if the light falls a certain value than spawn the stars
  {
    for (int i = 0; i< spawner.length; i++)
    {
      spawner[i].update();                  // update the color of the stars
      spawner[i].display();                // display the stars
    }
  }
  fill(red + (255 + red), green + (255 + green), 500 - red - green);
  ellipse(250, 250 - red, 50, 50);                                  // the sun will be displayed as a circle that will be yellow then bright and white when dark according to the light sensor
  fill(red);
  rectMode(CENTER);
  rect(250, 400, 500, 200);                                        // the ground will darken its color when the light sensor has less light and be bright when the light senor will have more light 
  fill(red, player_color, blue);
  ellipse(move, 400, 25, 25);                                      // the player on the ground moves according to the potentiometer and also changes color according to the potentiometer and the light sensor
  fill(0, green, 0);
  triangle(100, 300, 150, 300, 125, 250);                          // same thing as the ground but with green trees
  triangle(300, 300, 350, 300, 325, 250);
}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');      // get the ASCII string

  if (inString != null) {
    inString = trim(inString);                          // trim off any whitespace:
    float[] colors = float(split(inString, ","));      // split the string on the commas and convert the resulting substrings into an integer array
    if (colors.length >= 3) {                          //if the array has at least three elements, you know you got the whole thing.  Put the numbers in the color variables
      red = map(colors[0], 0, 1023, 0, 255);
      green = map(colors[1], 0, 1023, 0, 255);        // map them to the range 0-255 or 50-450
      blue = map(colors[2], 0, 1023, 0, 255);
      move = map(colors[3], 0, 1023, 50, 450);
      player_color = map(colors[4], 0, 1023, 0, 255);
    }
  }
}
