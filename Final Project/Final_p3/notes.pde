class notes 
{
  float pos_x;
  float pos_y;
  float speed_x;
  float red_note;
  float yellow_note;
  float green_note;
  float blue_note;
  boolean deactive;
  int row_note;
  notes(float x, float y, int row, boolean not_active)
  {
    pos_x = x;
    pos_y = y;
    speed_x = -5;
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
      pos_y = 200;
    }
    if (row_note == 3)
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
      fill(255, 255, 0);
    }
    if (row_note == 3)
    {
      fill(0, 255, 0);
    }
    if (row_note == 4)
    {
      fill(0, 0, 255);
    }
    ellipse(pos_x, pos_y, 25, 25);
  }
}
