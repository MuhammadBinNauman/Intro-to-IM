int red_button = 7;
int yellow_button = 8;
int green_button = 12;
int blue_button = 13;


void setup()
{
  Serial.begin(9600);
  pinMode(red_button, INPUT_PULLUP);
  pinMode(yellow_button, INPUT_PULLUP);
  pinMode(green_button, INPUT_PULLUP);
  pinMode(blue_button, INPUT_PULLUP);
}

void loop() {
  Serial.print(digitalRead(red_button));
  Serial.print(",");
  Serial.print(digitalRead(yellow_button));
  Serial.print(",");
  Serial.print(digitalRead(green_button));
  Serial.print(",");
  Serial.println(digitalRead(blue_button));
}
