class Ball {
float x = 0;                // initialisation of the x location of the ball
float y = 0;                // initialisation of the y location of the ball
float speedx = 0;           // initialisation of the speed of the ball x
float speedy = 0;           // initialisation of the speed of the ball y
int radius = 0;             // initialisation of the size of the ball
boolean pause= false;       // pause function initialisation

color ballColor = color(255,116,0);    // colour of the ball is orange

Ball() 
{
  x = random(SCREENX/4, SCREENY/2);         // random spawn locatiom of the ball x- axis 
  y = random(SCREENY/4, SCREENY/2);         // random spawn location of the ball y-axis 
  speedx = random(2,3);                     // speed of ball 2,3 x
  speedy = random(2,3);                     // speed of ball 2,3 y
  radius = 5;                               // radius/size of the ball 5
}

void move()
{
 if(pause==false)      // if the game pauses stop the speed and direction of the ball x and y
 {
 x=x+speedx; 
 y=y+speedy;
 }
}

void draw()
{
  if(pause==false)    // if the game pauses ball disappears off screen          
  {
  fill(ballColor);
  ellipse(int(x), int(y), radius, radius);
  }

  if(y>SCREENY)       // if ball is outside the y-axis of the screen game pauses, CPU score increases by 1, ball randomly spawns quatterly way on the screen
  {
    pause = true;
    iCpuScore = iCpuScore + 1;
    x = random(SCREENX/4);
    y = random(SCREENY/4);
  }
  
  else if (y<0)      //  if ball is outside the x-axis of the screen game pauses, player score increases by 1, ball randomly spawns quatterly way on the screen
  {
    pause = true;
    iScore = iScore + 1;
    x = random(SCREENX/4);
    y = random(SCREENY/4);
  }
  
  if(iScore >= 3)   // if player score is greater than or equal to 3, green text pops up saying you win
  {
    background(0);
    fill(94,255,51);
    text("You Win",210,125);
  }
  
  else if(iCpuScore >= 3)   // if CPU is greater than or equal to 3, red text pops up saying you lose
  {
    background(0);
    fill(240,1,1);
    text("You Lose",210,125);
  }
 
  
}

void collide(Player tp)     // collide formula
{
  if(x-radius <= 0)
  {
  speedx = -speedx;
  }
  
  else if (x+radius >= SCREENX)
  {
    speedx=-speedx;
  }
  
  if(y+radius >= tp.ypos &&
  y-radius<tp.ypos+PADDLEHEIGHT&&
  x >= tp.xpos && x <= tp.xpos+PADDLEWIDTH)
  {
    println("collided!");
    speedy=-speedy;
  }
   
  if(y+radius >= tp.yCpu &&
  y-radius<tp.yCpu+CPUPADHEIGHT&&
  x >= tp.xCpu && x <= tp.xCpu+CPUPADWIDTH)
  {
    println("collided!");
    speedy=-speedy;
  }
}
}
