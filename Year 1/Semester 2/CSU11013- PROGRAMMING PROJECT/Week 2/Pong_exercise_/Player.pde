class Player
{
  int xpos = 0;       // initialisation player paddle x position
  int ypos = 0;       // initialisation player paddle y position 
  
  int xCpu = 0;       // initialisation CPU paddle x position
  int yCpu = 0;       // initialisation CPU paddle y position
  
  color paddlecolor = color(255,255,255);  // player paddle colour white
  color cpuColor = color(255,255,255);     // CPU paddle colour white
  
  Player(int screen_y)    // movement of the paddle
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  
  void move(int x)
  {
    if(x>SCREENX-PADDLEWIDTH) 
    xpos= SCREENX - PADDLEWIDTH;
    else xpos = x;
  }
  
  void cpu(Ball followBall)
  {
    if(xCpu < followBall.x - PADDLEWIDTH/2)   // speed of CPU paddle
    {
      xCpu += 3;
    }
    
    else if(xCpu > followBall.x - PADDLEWIDTH/2) // speed of CPU paddle
    {
      xCpu -= 3;
    }   
  }
  
  void draw()
  {
    fill(paddlecolor);                            
    rect(xpos,ypos,PADDLEWIDTH,PADDLEHEIGHT);    // draw player paddle
    
    fill(cpuColor);
    rect(xCpu,yCpu,CPUPADWIDTH,CPUPADHEIGHT);    // draw CPU paddle
  }
}
