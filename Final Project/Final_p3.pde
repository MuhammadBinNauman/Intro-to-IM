//****************************************************************************************************
// it is a rythem based game where the player must correcly press buttons at the right time. the 
//buttons corrospond to colored nodes that go across the screen until they reach a mark where the 
//appropriate button is presses. on the breadboard you have 4 distinct colored buttons that corrospond
//to similar colored nodes that come on the screen.when the nodes reach the rectangle at the end of the
//screen the playermust push the appropriatly colored button in accordance to the timing of the node 
//reaching the rectangle.when the right button is pressed at the right time 1 is added to the score
// if the wrong button is pressed than the score is reduced by 1
// if you gain enough score than a star will appear on the top right of the screen. upto 3 stars
// the game would end after the music has finished its first loop
//after the game has ended the total score and score gained is displayed
// and a rating is given depending on the score
//***************************************************************************************************

//Controls: the 4 buttons on the breadboard 
//Muhammad Bin Nauman 
// Due june 24 1PM

import ddf.minim.*;                                            // loading in the library for sounds
import ddf.minim.effects.*;                                    // loading library for the music wave effects 
import processing.video.*;                                     // loading library for the background video
import processing.serial.*;                                    // all arduino to give info to processing 

Movie movie;
Minim minim;                                                  // initilazing the music and video 
AudioPlayer BGM;

PImage [] star = new PImage[6];                            // array for the star images
notes[] spawner = new notes[500];                         // array of note spawner

float red_value = 0;                                      
float green_value = 0;                                    
float blue_value = 0;                                     // values for the state of each of the 4 buttons on the breadboard (1 or 0)
float yellow_value = 0;

int image_index = 0;                                     // variable to allow cycling of images 
int score;                                               // the score the player will gain
int spawn_increase = 100;                                // the delay between the spawning of the next note
int spawn_count = 0;                                     // how many notes have been spawned from the array
int decrease = 1;                                         // decrease the timing of spawn increase
boolean end = false;                                    // boolean to tell if the game has ended

Serial myPort;

void setup() 
{
  size(800, 500);
  background(0);
  rectMode(CENTER);

  movie = new Movie(this, "BGV4.mp4");              // loading in the background video (BGV) 
  movie.loop();                                      // playing and looping the video 

  myPort = new Serial(this, Serial.list()[2], 9600);    // selecting the right port for the inputs form the breadboard
  myPort.bufferUntil('\n');

  minim = new Minim(this);
  BGM = minim.loadFile("MSM.mp3", 2048);                          // loading in the music file 
  BGM.loop();                                                     // playing the music file

  for (int j = 0; j < 6; j++)                                     // a loop to assign all the images to a array of images for when the player collides with the enemy
  {
    int k = j+1;
    star[j] = loadImage("star"+ k + ".png");
  }

  for (int i = 0; i < spawner.length; i++)                      // a loop to assign all the notes their own position on the x axis and lane on the y axis 
  {
    spawner[i] = new notes(random(1000, 1500), 1000, int(random(1, 6)), false );
  }
}

marker marker_line = new marker();                             // making an instance of the marker class
button_press button_check = new button_press(1, 1, 1, 1);      // making an instance of the button check class

void movieEvent(Movie m) 
{
  m.read();                                              
}

void serialEvent(Serial myPort) 
{
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);                                // taking the input values from arduino as a string and slicing them and putting them in strings as indivdual variables for each button
    float[] button_press = float(split(inString, ","));
    if (button_press.length >= 4) {
      red_value = button_press[0];
      yellow_value = button_press[1];
      green_value = button_press[2];
      blue_value = button_press[3];
    }
  }
}

void endgame()                            // the game would end after a certain amount of notes have been spawned
{
  if (spawn_count == 251)
  {
    fill(0, 255, 255);
    textSize(60);
    text("Efficiency", 260, 250); 
    fill(255);                                // display the endgame text that will tell the score/totalscore and depending on the score what is their rating
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
      text("Good", 340, 455);                // the different ratings players will recieve depending on how well they did
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
  image(movie, 0, 0, width, height);              // overlaying the video over the background

  if (score > 99)
  {
    image(star[image_index], 650, 0);
  }
  if (score > 149)
  {
    image(star[image_index], 700, 0);          // after reaching a certain score animated stars will appear on the top left side. the better score the more stars
  }
  if (score > 199)
  {
    image(star[image_index], 750, 0);
  }
  if (image_index<5 )
  {
    image_index++;
  } else
  {                                            // going to the next image in the star animation
    image_index=0;
  }

  marker_line.update();
  marker_line.display();                      // updating and displaying the rectangle where the notes will pass through
  button_check.update();                      // updating and dislpaying the actions realted to the buttons being pressed
  button_check.display();
  if (end == false)
  {
    for (int i = 0; i <= spawn_count; i++)                          // spawn in notes according to the number allowed on screen by the spawn_count function
    {    
      spawner[i].update();                                          // update the positions of the notes
      spawner[i].display();                                         // display the new updated locations of the notes
    }

    for (int i = 0; i < BGM.bufferSize() - 1; i++)
    {
      line(i, 50  + BGM.left.get(i)*50, i+1, 50  + BGM.left.get(i+1)*50);    // using the music library "buffersize" will draw the waveform 
      line(i, 450  + BGM.left.get(i)*50, i+1, 450  + BGM.left.get(i+1)*50);  // the values returned by left.get() and right.get() will be between -1 and 1,
                                                                             //so we need to scale them up to see the waveform
    }

    if (frameCount %spawn_increase == 0)
    {
      spawn_count +=1;
      spawn_increase -= decrease;
      if (spawn_increase == 26)                                // decrease the amount of frames between spawning new note and stop when a certain number is reached 
      {
        decrease = 0;
      }
    }
  }
  endgame();                                                  // if the endgame condition is met diplay final score and info
}
