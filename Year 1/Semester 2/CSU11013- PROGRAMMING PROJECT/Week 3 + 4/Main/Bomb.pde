class Bomb
{
  float x = 0;            // initialisation of x position of bomb
  float y = 0;            // initialisation of y position of bomb
  int speedy = 0;         // initialisation of speed of bomb
  int radius = 0;         // initialisation of the size of the bomb
  int inRestart = 0;      // initialisation of reset
  boolean outsideScreen = false;   // initialisation for going outside the screen
  boolean collision = false;       // initialisation for collisian detection

  color bombColor = color(0);  // bomb colour

  Bomb(int xConstruct, int yConstruct)  // constructor
  {  
    x = xConstruct;
    y = yConstruct;
    radius = 5;
  }

  void move()
  {
    y +=5;     // speed of bomb
  }

  void draw()
  {
    fill(bombColor);   // fill colour of bomb
    ellipse(x, y, 5, 5);  // draw bomb and size
  }

  boolean offScreen()  // this checks if the bomb goes off screen
  {
    if(y > SCREENY)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  void collide(Player dead)  // collision formula
  {
    if (y+radius>=dead.ypos &&
      y-radius<dead.ypos+PADDLEHEIGHT &&
      x >= dead.xpos && x <= dead.xpos + PADDLEWIDTH)
    {
      collision =true;  //if collision happens then boolean is set to true
    }
  }
}
