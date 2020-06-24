class button_press                                  // class that will check if the button is pressed and what button is pressed as well as if the button corrosponding to its note will give score or not
{
  boolean button_is_pressed;                        // checking whether any button us pressed or not
  boolean right_button;                             // boolean to see if the right button is pressed
  int[] color_row = new int[]{ 1, 2, 3, 4};         // each color will corrospond to a row number 
  button_press(float r, float y, float g, float b)
  {
    red_value = r;
    yellow_value = y;                              // initalizing all the values of the variables
    green_value = g;
    blue_value = b;
    button_is_pressed = false;
    score = 0;
    color_row = new int[]{ 1, 2, 3, 4};
  }

  void update()
  {
    if (red_value == 0 || yellow_value == 0 || green_value == 0 ||blue_value == 0)      // if any button is pressed than the boolean value button is pressed becomes true 
    {
      button_is_pressed = true;
    } else
    {
      button_is_pressed = false;                                                        // else it remains false
    }
    for (int i = 0; i < spawner.length; i++)                                            // going through all the notes 
    {
      for (int j = 0; j< color_row.length; j++)                                         // going through all the rows to find out which row the note is on
      {
        if (spawner[i].pos_x <=85 && spawner[i].pos_x>= 65 && button_is_pressed == true && spawner[i].row_note == color_row[j] && spawner[i].deactive == false)// if the note between the rectangle and the button is pressed and its hasent given points already
        {                                                                                                                                                      //then check which row it is at
          if ((j == 0 && red_value == 0)||(j == 1 && yellow_value == 0)||(j == 2 && green_value == 0)||(j == 3 && blue_value == 0))                            // then check if the row corrosponds to the right button
          {
            score+= 1;
            spawner[i].deactive = true;                                                                                        // if all is true all score and deactivate the note so it dosent give more points
          } 
          else if (score > 0)
          {
            score -= 1;
            spawner[i].deactive = true;                                                                                        // if the wrong button is pressed than reduce the score 
          }
        }
      }
    }
  }
  void display()
  {
    fill(0, 150, 255);
    textSize(32);                                                                                                              // display the score at the top left
    text(score, 10, 30);
  }
}
