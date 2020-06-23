class button_press
{
  int hit_count;
  boolean button_is_pressed;
  boolean right_button;
  int[] color_row = new int[]{ 1, 2, 3, 4}; 
  button_press(float r, float y, float g, float b)
  {
    red_value = r;
    yellow_value = y;
    green_value = g;
    blue_value = b;
    button_is_pressed = false;
    score = 0;
    color_row = new int[]{ 1, 2, 3, 4};
  }

  void update()
  {
    if (red_value == 0 || yellow_value == 0 || green_value == 0 ||blue_value == 0)
    {
      button_is_pressed = true;
    } else
    {
      button_is_pressed = false;
    }
    for (int i = 0; i < spawner.length; i++)
    {
      for (int j = 0; j< color_row.length; j++)
      {
        if (spawner[i].pos_x <=85 && spawner[i].pos_x>= 65 && button_is_pressed == true && spawner[i].row_note == color_row[j] && spawner[i].deactive == false)
        {
          if ((j == 0 && red_value == 0)||(j == 1 && yellow_value == 0)||(j == 2 && green_value == 0)||(j == 3 && blue_value == 0))
          {
            score+= 1;
            spawner[i].deactive = true;
          } 
          else if (score > 0)
          {
            score -= 1;
            spawner[i].deactive = true;
          }
        }
      }
    }
    println(button_is_pressed + "  " + frameCount + "  " + score);
  }
  void display()
  {
    fill(0, 150, 255);
    textSize(32);
    text(score, 10, 30);
  }
}
