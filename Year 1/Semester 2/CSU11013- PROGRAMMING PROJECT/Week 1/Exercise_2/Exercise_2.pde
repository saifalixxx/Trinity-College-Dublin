int iBox = 0;                // intialisation of box

void setup()                 // run box setup
{
  size(200,200);             // run box size
  noStroke();                // no outer line
}

void draw()
{                           // AQUA BOX
  background(255);          // back ground colour neutral
  fill(51,255,227);         // colour of the box
  rect(iBox, 20, 50,50);    // location of the aqua box and starting location x
  if(iBox++>=199)           // movement of the box to the right
  {
    iBox=0;
  }
}
