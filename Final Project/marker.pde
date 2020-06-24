class marker               // class that will make the rectangle through which all the notes will pass through and will tell the player when to press the button
{
  int red;
  int green;              // variable to give each the middle of the rectange its own color depending on the note that passed through it
  int blue;
  marker()
  {
  }
  void update()
  {
    for (int i = 0; i < spawner.length; i++)                // going through all the notes
    {
      if (spawner[i].pos_x <= 75 && spawner[i].pos_x >= 70)  // if the note touches the rectangle 
      {
        if (spawner[i].row_note == 1)
        {
          red = 255;
          green = 0;
          blue = 0;
        }
        if (spawner[i].row_note == 2)
        {
          red = 255;                                  // give it the same color as the noted themselves
          green = 255;
          blue = 0;
        }
        if (spawner[i].row_note == 3)
        {
          red = 0;
          green = 255;
          blue = 0;
        }
        if (spawner[i].row_note == 4)
        {
          red = 0;
          green = 0;
          blue = 255;
        }
      }
    }
  }
  void display()
  {
    for (int i = 1; i<5; i++)
    {
      stroke(255);
      line(0, 100*i, 900, 100*i );          // display white lines on the path the notes will take 
    }
    stroke(102, 199, 100);
    strokeWeight(3);
    fill(red, green, blue);                // display the rectangle witb a boarder and color equal to the note that has passed through it 
    rect(75, 250, 25, 380);
    strokeWeight(1);
  }
}
