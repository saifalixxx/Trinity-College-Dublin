class Bullet 
{
  Player thePLayer;   // calling player function
  float x = 0;        // bullet position x
  float y = 0;        // bullet position y
  float speedx = 0;   // bullet speed x
  float speedy = 0;   // bullet speed y
  int radius = 0;     // initialisation for the radius of the bullet

  color bulletColor = color(243, 69, 22);  // colour of bullet

  Bullet(int xConstruct, int yConstruct)  // constructor
  {       
    x=xConstruct;
    y=yConstruct;
    radius = 5;
  }

  void move()  
  {
    y-= 10;   // bullet speed
  }

  void draw()
  {
    fill(bulletColor);  // bullet colour
    ellipse(int(x), int(y), radius, radius); // bullet shape circle
  }

  void collide(Alien taa[], PImage explosion)  // alien collide function with bullet
  {
    for (int count=0; count<taa.length; count++)
    {
      if (y+radius >= taa [count].y &&
        y-radius<taa[count].y + 25 &&
        x >= taa[count].x && x <= taa[count].x+30)
      {
        taa[count].explode(explosion);
        taa[count].alienAlive = false; // makes sure my only the aliens alive drop the bombs
      }
    }
    
    if (taa[0].alienAlive==false)
    {
      background(0);
      fill(255);
      textSize(30);
      text("You  Win", 120, 200);
      stop();
    }
  }
}
