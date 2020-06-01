



void setup()
{
  size(1000,1000);
  background(random(75,255));
  frameRate(15);
}

// varible to increase the height everyframe
float height_increase = 0;



void draw()
{
  rotate(random(-0.3,.3)); //random rotation
  for (int x = 0; x<= 5; x++) // have a set amount of shapes being made every frame
  {
    
    if (frameCount <= 15) // stop making shapes after a certain time passes
    { 
      noFill();
      rect(random(1000),random(200),random(100),0+height_increase); // making rectangle with random location, width and height
      fill(0);
      ellipse(random(800),random(800),random(100),random(100)); // making circle with random locations on the X and Y axis
    }
    
    while(height_increase < 800) // stop the rectange height from exceeded 800
    {
      height_increase ++;
    }
  }
}
