## Midterm Project: Asteroids

#### Discription

The Player will controll a ship that will go through a asteroid field that will increase in density as the time passes The player must avoid collision from the asteroids while also collecting optional bonus points until a caertain time has passed. after that the game will be won and the final score will be displayed

Inspirarion: any old space game 
Outside source: Minim sound library 

Muhammad Bin Nauman mbn304

Due: 10 June 1AM

Instruction: control the ship with the mouse and dodge the asteroids.

#### Sketch

![](sketch.jpg)

Made the entire concept of the game and what will it have along with some bonus features that sadly didnt make it because of annoying bug fixes.

#### Layer 1

![](pic1.png)

Displayed a square that is controlled by a mouse 

#### Layer 2

![](pic2.png)

Created a array that would spawn enemies in as red squares at random locations 

#### Layer 3

![](pic3.png)

added background image and player image as well as made a function that controlled the amount of enemies to spawn into the screen and a difficulty scaler 

#### Layer 4

![](pic4.png)

added a endgame condition. stoped the game from crashing at the end because of overloading objects. added text with the game is won 
 
 #### Layer 5

![](pic5.png)

got collision working and added game over endgame.

#### Layer 6

![](pic6.png)

added some collision animation and fixed small bugs. ex(enemy spawner/ endgame/ score/ collision again)

#### Layer 7

![](pic7.png)

added a new class bonus points that will give extra points when collected

#### Difficulty

Collision: collsions were not working as the hitbox was too small. used distence formula to calculate the collsion as the solution

Endgame: putting endgame function in draw function crashed the game. dont put a while loop in draw its a good chance it will crash. made a boolean variable as the endgame indicator and used it as a IF statemt in the draw function

Sound: for some reason sound didnt work with the library. used another library "Minim" to make the sound work. why it didnt work your guess is as good as mine.


