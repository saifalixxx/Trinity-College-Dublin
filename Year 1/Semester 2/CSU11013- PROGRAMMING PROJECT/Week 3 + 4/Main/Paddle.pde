class Player
{
  int xpos = 0;       // x position of paddle
  int ypos = 0;       // y position of paddle
  int i = 0;          // counter initialisation
  int inBullet = 0;   // bullet limiter

  color paddlecolor = color(243, 69, 22);   // colour of paddle 

  Player(int screen_y)    // constructor
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }

  void move(int x)  // This is how the paddle moves 
  {
    if (x>SCREENX-PADDLEWIDTH) 
      xpos= SCREENX - PADDLEWIDTH;
    else xpos = x;
  }

  void draw()
  {
    fill(paddlecolor);   // paddle colour                           
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);  // the paddle shape is a rectangle
  }

  void fireBullet()  // the bullet is fired here
  {
    if (mousePressed && inBullet == 0)  
    {
      theBullet [i] = new Bullet(thePlayer.xpos+PADDLEWIDTH/2, SCREENY);  // position of bullet spawn
      i++;          // the bullet moves 
      inBullet =1;  // bullet limit is one at a time
    }
  }
}
