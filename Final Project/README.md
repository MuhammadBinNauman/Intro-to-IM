## Final Project: Rhythm Game

### Description 

It is a Rhythm based game where the player must correcly press buttons at the right time. the buttons corrospond to colored nodes that go across the screen until they reach a mark where the appropriate button is presses. on the breadboard you have 4 distinct colored buttons that corrospond to similar colored nodes that come on the screen.when the nodes reach the rectangle at the end of the screen the playermust push the appropriatly colored button in accordance to the timing of the node  reaching the rectangle.when the right button is pressed at the right time 1 is added to the score if the wrong button is pressed than the score is reduced by 1 if you gain enough score than a star will appear on the top right of the screen. upto 3 stars the game would end after the music has finished its first loop after the game has ended the total score and score gained is displayed and a rating is given depending on the score

### Circuit

![](sketch1.jpg)
![](sketch2.jpg)

The circuit is simple it has 4 buttons each connected to ground and each connected to its own digital pins

### Layer 1
![](pic1.png)

### Layer 2
![](pic2.png)

### Layer 3
![](pic3.png)

### Layer 4
![](pic4.png)

### Layer 5
![](pic5.png)

### Layer 6
![](pic6.png)

### Layer 7
![](pic7.png)

### Layer 8
![](pic8.png)

### Video

There is a video as Mov1 and Mov2(the finished stage) avalible to see a demonstration

### Sources

for the music waves I refered to the builtin example for minin sound library. Example->Contributed libraries-> Minin-> AudioPlayer->loop

for the background video I refered to the example provided by minim.effects library at http://code.compartmental.net/tools/minim/quickstart/

for the video itself its a .mov video from https://pixabay.com/videos/search/looping/?pagi=1

### Difficulties

I had a lot of problems with the notes and button presses a lot of it was trail and error of all the possible solution I could think of
until one worked. most the problems was just accumalted small errors

I had problems with processing reading the values from arduino but the professor helped me understand how the code of slicing worked and where my problem was.
