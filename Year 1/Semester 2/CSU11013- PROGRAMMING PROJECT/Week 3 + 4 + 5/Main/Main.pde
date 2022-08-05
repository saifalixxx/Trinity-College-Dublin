Alien theAlienArray[];  // calling Alien class as an array 
Bullet theBullet [];    // calling bullet class as an array
Player thePlayer;       // calling the player function
Bomb theBomb;           // calling bomb function
PImage myImage;         // initialisation for my alien image
PImage theExplosion;    // initialisation for the explosion image
boolean checkDead = true;

void setup()
{
  size(400, 400);                                  // size of run box
  myImage = loadImage("spacer.GIF");              // loads the alien image
  theExplosion = loadImage("exploding.GIF");      // loads exploding image 
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT); // Provides the location of the paddle
  ellipseMode(RADIUS);
  theAlienArray = new Alien[10];                 // dupicates the aliens
  theBullet = new Bullet[5000];                  // ammo for bullets
  theBomb = new Bomb(SCREENX/2, 0);
  space_array (theAlienArray);                   // This array function allows gaps to be made between each alien
}

void draw()
{
  background(255);               // white background
  move_array(theAlienArray);     // calls move array function
  draw_array(theAlienArray);     // calls draw array function
  bullet_Repeat(theBullet);      // call repeating bullet array
  thePlayer.move(mouseX);        // the paddle moves by moving the mouse along the x direction
  thePlayer.draw();              // the paddle is drawn
  thePlayer.fireBullet();        // the bullet is fired
  theBomb.draw();                // draws bomb
  theBomb.move();                // allows movement of bomb
  theBomb.collide(thePlayer);    // bomb collides with paddle

  if (theBomb.collision ==true)  // if the bomb collides then pop up this message
  {
    background(0);
    fill(240, 1, 1);
    textSize(30);
    text("Game Over", 120, 200);
    stop();
  }
}

void mouseReleased()     // when the mouse is released there will be no more bullets
{
  thePlayer.inBullet=0;
  println("test");
}


void space_array(Alien theAlienArray[])   // array for the gaps between the aliens
{
  for (int count=0; count < theAlienArray.length; count++)
  {
    theAlienArray[count] = new Alien(1+count*30, 0, myImage);
  }
}

void move_array(Alien theAlienArray[]) // for every alien it is going to move. array for the movement of the aliens
{
  for (int count=0; count<theAlienArray.length; count++)
  {
    theAlienArray[count].move();  // calls move function to allow all aliens to follow the orders in the move function.
  }
}

void draw_array(Alien theAlienArray[])  // allows the aliens to be created. For each element an alien is created.
{
  for (int count=0; count<theAlienArray.length; count++)
  {
    theAlienArray[count].draw();  
    theAlienArray[int (random(0, 10))].shootBomb();  // Spawn the location of bomb in the alien and randomly repeat the aliens to frop the bomb
  }
}

void bullet_Repeat (Bullet theBullet[])  // allows repeating bullets to be created as an array
{
  for (int count=0; count<thePlayer.i; count++)
  {
    theBullet[count].draw();
    theBullet[count].move();
    theBullet[count].collide(theAlienArray, theExplosion);
  }
}
