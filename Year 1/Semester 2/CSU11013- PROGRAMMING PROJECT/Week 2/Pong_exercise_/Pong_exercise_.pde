// sources: 
// https://www.openprocessing.org/sketch/76847
// https://www.instructables.com/Pong-With-Processing/

import processing.sound.*;
SoundFile file;
Player thePlayer;         //calling in function
Ball theBall;             // calling in function

int iLine = 0;            // initialisation for  divider line
int iScore = 0;           // initialisation for player score
int iCpuScore = 0;        // initialisation for CPU score

void settings()
{
  size(SCREENX,SCREENY);   // size of run box
}

void setup()  // Makes a new instance of the ball, player and CPU using the passed parameters
{                                        
  file = new SoundFile(this, "Tron Legacy - Son Of Flynn (Remix) - Extended!.mp3");
  file.play();
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  thePlayer = new Player(SCREENY-MARGIN-CPUPADHEIGHT);
  theBall = new Ball();
  ellipseMode(RADIUS);
  
}

void draw()
{
  background(0);                  // run box background black
  fill(255,255,255);              // colour of divider line white
  rect(iLine,120,500,3);          // length, size and position of divider line
  
  textSize(20);                   // size of the CPU score
  text(iCpuScore,10,30);          // CPU score location
  
  textSize(20);                   // size of the player score
  text(iScore, 10, 150);          // location of CPU score
  
  if(theBall.pause==false)        // if the game is paused stop the player, CPU and the movement of the ball
  {
  thePlayer.move(mouseX);
  thePlayer.cpu(theBall);
  theBall.move();
  }
  
  theBall.collide(thePlayer);     // collision function
  
  thePlayer.draw();               // player creation
  theBall.draw();                 // ball creation
}

void mousePressed()
{
  theBall.pause=false;      // press mouse to pause game

  if(iScore >= 3)           // if player score is greater than or equal to 3 reset player and CPU score
  {
    iScore = 0;
    iCpuScore = 0;
  }
  if(iCpuScore >= 3)        // if CPU score is greater than or equal to 3 reset Player and CPU score
  {
    iScore = 0;
    iCpuScore = 0;
  }
}
