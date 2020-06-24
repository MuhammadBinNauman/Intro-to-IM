class notes                                         // the class will define the color, speed and location of all the notes that will spawn
{
  float pos_x;
  float pos_y;                                      // the position of the notes on the X and Y axis
  float speed_x;                                    // the speed of the notes when they will move across the screen
  boolean deactive;                                 // tell if the note should give points or not to avoid the same note giving more points 
  int row_note;                                     // which row should the row belong to 
  notes(float x, float y, int row, boolean not_active)
  {
    pos_x = x;
    pos_y = y;
    speed_x = -5;                                  // initilazing the variables 
    row_note = row;
    deactive = not_active;
  }

  void update()
  {
    if (row_note == 1)
    {
      pos_y = 100;
    }
    if (row_note == 2)
    {
      pos_y = 200;                              // depending on the random value (1-4) given to each node. the node will give a new position 
    }
    if (row_note == 3)                          // the position will be fixed
    {
      pos_y = 300;
    }
    if (row_note == 4)
    {
      pos_y = 400;
    }
    pos_x += speed_x;
  }

  void display()
  {
    if (row_note == 1)
    {
      fill(255, 0, 0);
    }
    if (row_note == 2)
    {
      fill(255, 255, 0);                     // give the notes a color depending on the row they will be spawning on
    }
    if (row_note == 3)
    {
      fill(0, 255, 0);
    }
    if (row_note == 4)
    {
      fill(0, 0, 255);
    }
    ellipse(pos_x, pos_y, 25, 25);        // display the nodes as circles
  }
}
