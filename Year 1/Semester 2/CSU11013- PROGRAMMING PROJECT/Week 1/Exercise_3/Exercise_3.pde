int iBox = 0;                // initialialisation for pink box
int iBox2 = -199;            // Location set to off screen

void setup()                 // run box set up
{
  size(200,200);             // size of run box
  noStroke();                // no outer line
}

void draw()                  
{                            // PINK BOX
  background(255);           // background is neutral for the run box
  fill(255,51,202);          // colour of box
  rect(iBox,20,50,50);       // pink box location and size x
  if (iBox++>=398)           // wrap movement to the right
  {
    iBox=-100;                
  }
                            // WRAP PINK BOX
  fill(255,51,202);          
  rect(iBox2,20,50,50);
  if(iBox2++>=199)
  {
    iBox2=-300;
  }
}
