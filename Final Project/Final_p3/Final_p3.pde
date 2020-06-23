import ddf.minim.*;                                            // loading in the library for sounds
import ddf.minim.effects.*;
import processing.video.*;
import processing.serial.*;

Movie movie;
Minim minim;
AudioPlayer BGM;

PImage [] star = new PImage[6];
notes[] spawner = new notes[500];                         // array of enemy spawner

float red_value = 0;        // red value
float green_value = 0;      // green value
float blue_value = 0;       // blue value
float yellow_value = 0;
int image_index = 0;
int score;
int spawn_increase = 100;
int spawn_count = 0;
int decrease = 1; 
boolean end = false;

Serial myPort;

void setup() 
{
  size(800, 500);
  background(0);
  rectMode(CENTER);

  movie = new Movie(this, "BGV4.mp4");
  movie.loop();

  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');

  minim = new Minim(this);
  BGM = minim.loadFile("MSM.mp3", 2048);                          // loading in the music file 
  BGM.loop();

  for (int j = 0; j < 6; j++)                                     // a loop to assign all the images to a array of images for when the player collides with the enemy
  {
    int k = j+1;
    star[j] = loadImage("star"+ k + ".png");
  }

  for (int i = 0; i < spawner.length; i++)
  {
    spawner[i] = new notes(random(1000, 1500), 1000, int(random(1, 6)), false );
  }
}

marker marker_line = new marker();
button_press button_check = new button_press(1, 1, 1, 1);

void movieEvent(Movie m) 
{
  m.read();
}

void serialEvent(Serial myPort) 
{
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);
    float[] button_press = float(split(inString, ","));
    if (button_press.length >= 4) {
      red_value = button_press[0];
      yellow_value = button_press[1];
      green_value = button_press[2];
      blue_value = button_press[3];
    }
  }
}

void endgame()
{
  if (spawn_count == 251)
  {
    fill(0, 255, 255);
    textSize(60);
    text("Efficiency", 260, 250); 
    fill(255);    
    println(score + "  " + spawn_count); 
    text(score+"/"+spawn_count, 325, 375); 
    if (score< 50)
    {
      fill(255, 120, 0);
      text("Bad", 350, 455);
    }
    if (score>49 && score<100)
    {
      fill(255, 255, 0);
      text("Okay", 340, 455);
    }
    if (score>99 && score<150)
    {
      fill(0, 255, 0);
      text("Good", 340, 455);
    }
    if (score>149 && score<200)
    {
      fill(0, 255, 200);
      text("Amazing", 330, 455);
    }
    if (score>199)
    {
      fill(random(255), random(255), 125);
      text("SUPER-HOT", 330, 455);
    }
    end = true;
  }
}

void draw() 
{
  background(0);
  stroke(102, 199, 100);
  image(movie, 0, 0, width, height);

  if (score > 99)
  {
    image(star[image_index], 650, 0);
  }
  if (score > 149)
  {
    image(star[image_index], 700, 0);
  }
  if (score > 199)
  {
    image(star[image_index], 750, 0);
  }
  if (image_index<5 )
  {
    image_index++;
  } else
  {
    image_index=0;
  }

  println(spawn_count + "  " + frameCount + "  " + spawn_increase);
  println(red_value, yellow_value, green_value, blue_value);
  marker_line.update();
  marker_line.display();
  button_check.update();
  button_check.display();
  if (end == false)
  {
    for (int i = 0; i <= spawn_count; i++)                          // spawn in enemies according to the number allowed on screen by the spawn_count function
    {    
      spawner[i].update();                                          // update the positions of the enemies
      spawner[i].display();                                         // display the new updated locations of the enemies
    }

    for (int i = 0; i < BGM.bufferSize() - 1; i++)
    {
      line(i, 50  + BGM.left.get(i)*50, i+1, 50  + BGM.left.get(i+1)*50);
      line(i, 450  + BGM.left.get(i)*50, i+1, 450  + BGM.left.get(i+1)*50);
    }

    if (frameCount %spawn_increase == 0)
    {
      spawn_count +=1;
      spawn_increase -= decrease;
      if (spawn_increase == 26)                                // after a certain increase the ecponential increase will stop 
      {
        decrease = 0;
      }
    }
  }
  endgame();
}
