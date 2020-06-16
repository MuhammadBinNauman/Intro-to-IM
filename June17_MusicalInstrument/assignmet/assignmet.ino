//the program uses two buttons, a light senor, a potentometer and speaker to create sounds
//the potentometer will control the volume of the speaker by acting as a variable resistor connected to the speaker
//the light sensor will give values that will corrospond to the frequency of the sound played by the speaker
//the two buttons will decide if the sound would be played if they are pressed(both buttons play different sounds)

// Muhammad Bin Nauman
// due 17 june 1PM

int button_pin1 = 4;  // the pin of the redboard that connects to one of the button
int button_pin2 = 7;  // same but for the other button 

int speaker_pin = 2;   // the pin of the speaker that connects to the redboard
int light_sensor = 0;   // make a varibale that will tell the value of the brightness collected from the light sensor

void setup() {
  pinMode(button_pin1, INPUT_PULLUP); // set the pin as a input pullup to avoid false positive and to tell if the button is pressed or not
  pinMode(button_pin2, INPUT_PULLUP); // same for the second button
  pinMode(speaker_pin, OUTPUT);       // set the pin of the speaker as output
  
  Serial.begin(9200);
}

void loop() {

  light_sensor = analogRead(A0);      // read the value of light 

  Serial.println(light_sensor);       // display the value of light in its range 

  if (digitalRead(button_pin1) == LOW) {   //if the button is pressed play a frequency equal to the value of the light sensor
    tone(speaker_pin, light_sensor);                   
  }
  else if (digitalRead(button_pin2) == LOW) { //if the button is pressed play a frequency equal to half of the vlaue of the light sensor
    tone(speaker_pin, light_sensor/2);                    
  }
  else {
    noTone(speaker_pin);   if no button is pressed than turn off the speaker            
  }
}
