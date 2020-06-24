int red_button = 7;
int yellow_button = 8;
int green_button = 12;            // the digital pin each of the 4 buttons is connected to
int blue_button = 13;


void setup()
{
  Serial.begin(9600);   
  pinMode(red_button, INPUT_PULLUP);
  pinMode(yellow_button, INPUT_PULLUP);           // all buttons will be input 
  pinMode(green_button, INPUT_PULLUP);            // when the button is not pressed it will give a value of 1 and when pressed it will give a value of 0
  pinMode(blue_button, INPUT_PULLUP);
}

void loop() {
  Serial.print(digitalRead(red_button));
  Serial.print(",");
  Serial.print(digitalRead(yellow_button));         // display on the serial moniter the valus of each of the button in a format that will allow it to be made sliced and stored in a array for processing
  Serial.print(",");
  Serial.print(digitalRead(green_button));
  Serial.print(",");
  Serial.println(digitalRead(blue_button));
}
