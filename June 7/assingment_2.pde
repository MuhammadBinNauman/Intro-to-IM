//The program reads words from a csv file and combines the words every row and display them
//The text is displayed in random colors and after a set interval the current color of the text 
//is given to the circle around the text and after a certain time the color of the text is given
//to the background

//Muhammad Bin Nauman
//due: 7/6/2020 at 1PM
//reference: https://github.com/aaronsherwood/introduction_interactive_media/blob/master/processingExamples/textExamples/tableSaveLoad/tableSaveLoad.pde

Table words;        // create a table
marquee[] lines;    // create a array that will store the words from the file 


void words_data()
{
  words = loadTable("hello.csv", "header");        // loading the table where the first line is considered a header
  lines = new marquee[words.getRowCount()];        // making the dimensions of the array

  for (int i = 0; i < words.getRowCount(); i++)      // transversing the array according to the number of rows
  {
    TableRow row = words.getRow(i);
    String x = row.getString("x");
    String y = row.getString("y");                // assigning each varible a words from a cell in the current row
    String z = row.getString("z");
    String sentence = x + " " + y + " " + z;       // adding the words from one row to create a sentence
    lines[i] = new marquee (sentence);            // adding the sentence to the array
  }
}



class marquee            // class that will display the text, shapes and color
{
  String alphabets;
  int r;
  int g;                // storing RGB values
  int b;
  int count;
  int temp1_r, temp1_g, temp1_b;    // more temporary varibles to store RGB
  int temp2_r, temp2_g, temp2_b;
  marquee(String TheWord)
  {
    alphabets = TheWord;
    count = 0;
    r = int(random(255));
    g = int(random(255));        // giving the RGB varibles random RGB values
    b = int(random(255));
  }

  void update()
  {
    r +=5;
    g +=5;                      // the rate of color change 
    b +=5;
    if (r == 255 || r > 255)
    {
      r = int(random(255));
    }
    if (g == 255 || g > 255)
    {
      g = int(random(255));    // in all three of the loops if the color white is reached then a random color is assigned to the respective RGB variable
    }
    if (b == 255 || b > 255)
    {
      b = int(random(255));
    }
    if (frameCount%45 == 0)
    {
      temp1_r = r;
      temp1_g = g;          // after a certain time has passes the current RGB vlaue of the text is stored
      temp1_b = b;
    }
    if (frameCount%120 == 0)
    {
      temp2_r = r;
      temp2_g = g;        // after a certain time has passes the current RGB vlaue of the text is stored
      temp2_b = b;
    }
  }

  void display()
  {
    textSize(20);
    background(temp2_r, temp2_g, temp2_b);    // give the background one of the temporary stored RGB values
    fill(temp1_r, temp1_g, temp1_b);          // give the circle one of the temporary stored RGB values
    ellipse(250, 250, 250, 250);
    fill(r, g, b);                            // give the text the current RGB value
    text(alphabets, 250, 250);                // placement of the text
  }
}

void setup()
{
  textAlign(CENTER, CENTER);        // the text will always be in the center 
  size(500, 500);
  frameRate(30);
  words_data();                    // load the function that reads the words from the csv file
}

int i = 0;
void draw()
{
  lines[i].update();            // update the text,background and shapes
  lines[i].display();            // display the text, background and shapes 
  if (frameCount%60 == 0)
  {
    i +=1;
    if (i == lines.length)      // go to the next sentence after a certain period of time
    {
      i = 0;
    }
  }
}
