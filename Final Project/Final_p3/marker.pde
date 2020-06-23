class marker
{
  int red;
  int green;
  int blue;
  marker()
  {
    int red = 255 ;
    int green = 255;
    int blue = 255;
  }
  void update()
  {
    for (int i = 0; i < spawner.length; i++)
    {
      if (spawner[i].pos_x <= 75 && spawner[i].pos_x >= 70)
      {
        if (spawner[i].row_note == 1)
        {
          red = 255;
          green = 0;
          blue = 0;
        }
        if (spawner[i].row_note == 2)
        {
          red = 255;
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
      line(0, 100*i, 900, 100*i );
    }
    stroke(102, 199, 100);
    strokeWeight(3);
    fill(red, green, blue);
    rect(75, 250, 25, 380);
    strokeWeight(1);
  }
}
