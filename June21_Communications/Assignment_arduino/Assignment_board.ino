const int red_pin = A0;		  // light sensor to control red color
const int green_pin = A1;	  // light sensor to control green color
const int blue_pin = A2;		// light sensor to control blue color
const int move_pin = A3;    // potentiometer to control the players postion
const int player_color = A4;// potentiometer to change the color of the player

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(red_pin));
  Serial.print(",");
  Serial.print(analogRead(green_pin));
  Serial.print(",");
  Serial.print(analogRead(blue_pin));                   // display all the values of the pin seperated by a comma
  Serial.print(",");
  Serial.print(analogRead(move_pin));
  Serial.print(",");
  Serial.println(analogRead(player_color));
}
