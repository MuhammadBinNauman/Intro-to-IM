## Production Assignment

#### Discription

the program uses two buttons, a light senor, a potentiometer and speaker to create sounds. the potentiometer will control the volume of the speaker by acting as a variable resistor connected to the speaker. the light sensor will give values that will corrospond to the frequency of the sound played by the speaker the two buttons will decide if the sound would be played if they are pressed(both buttons play different sounds)

Muhammad Bin Nauman mbn304

Due: 17 June 1AM

#### Circuit Schematic

![](sketch.jpg)


#### Digital Circuit

![](pic1.jpg)
![](pic2.jpg)

added two buttons with two wires each. one for ground and the other connected to the pins on the redboard as inputs.
added a speaker with one wire that is connected to the digital pin on the redboard
added a potentiometer that controlled the resistence and connected two ground wires to it. one ground wire to the negative pin of the breadboard and the other to the speaker.
added random frequencies to the buttons when pressed and would send the info to the speaker to play and have the volume be controlled by the potentiometer.

#### Analog Circuit

![](pic3.jpg)
![](pic4.jpg)

added a light sensor and conected one end to a 10K resistor that would be inturn be connected to a ground wire.
added a power wire to the other leg of the light sensor and a wire that would read the analog reading from the light sensor.
the reading from the sensor would be converted into sound frequency values when one of the buttons is pressed.

#### Video

video of the two stages are avalible as mov1 and mov2 in the folder

#### Difficulty

The pins on the board are not that will conected to the redboard so had to fiddle with the wires until a proper connection was made

The buttons were inconsistent with the detection. solved by using INPUT_PULLUP while assigning pins. this avoids false positives and keeps the charge high.
