// the program uses a analog potentiometer to change color of a RGB LED
// by increasing the value of the potentiometer the color of the LED will change
// the program also uses a digital sensor (button) to turn on and off a two LED's
// if the button is not pressed than one of the two LED's is one and if the
// button is pressed than the LED on will turn off and the LED off will turn on


//Muhammad Bin Nauman mbn304

//Due: 16 June 1AM


int pot = A0;   // port of the potentiometer 
int button = 2; // port of the button that will take the reading
int power = 7;  // port of the wire that will give the voltage to the LED depending on the state of the button
int red = 6;    // port of the red bulb of the RGB LED
int green = 5;  // port of the green bulb of the RGB LED
int blue = 3;   // port of the blue bulb of the RGB LED

void setup() {
  // put your setup code here, to run once:


  Serial.begin(9600);

  pinMode(red, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(green, OUTPUT);                     // declaring the LED's as output and the digital button as input
  pinMode(button, INPUT);
  pinMode(power, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  pot = analogRead(A0);                 // reading the value of the potentiometer
  button = digitalRead(2);              // reading whether the button has been pressed or not
  Serial.println(button);               // printing both the values 
  Serial.println(pot);

  if (button == 0)
  {
    digitalWrite(power, HIGH);          // if the button is not pressed than one of the LED's is one 
  }
  if (button == 1)
  {
    digitalWrite(power, LOW);           // if the button is pressed that that LED will turn off
  }

  if (pot < 350)
  {
    analogWrite(red, 1000);
    analogWrite(blue, 0);
    analogWrite(green, 0);
  }
  if (pot >= 350 && pot < 700)
  {
    analogWrite(red, 0);
    analogWrite(blue, 0);                     // depending on the value of the potentiometer the colors will change
    analogWrite(green, 100);
  }
  if (pot >= 700 && pot < 1000)
  {
    analogWrite(red, 0);
    analogWrite(blue, 100);
    analogWrite(green, 0);
  }

}
