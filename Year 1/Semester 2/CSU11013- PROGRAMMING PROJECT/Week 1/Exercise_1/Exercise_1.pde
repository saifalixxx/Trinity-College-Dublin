int iBox1 = 0;                   // lime box
int iBox2 = 0;                   // purple box
int iBox3 = 0;                  // red box

void setup()
{
  size(500,500);              // run box size
  noStroke();                 // no outer line
}

void draw()
{                            // LIME BOX
  background(46,46,46);      // background colour neutral  
  fill(66,255,51);           // colour of box is lime
  rect(iBox1,20,50,50);      // size of the lime box and starting location x
  if(iBox1++>=499)           // movement of box to the right
  {
    iBox1=0;
  } 
                             // PURPLE BOX
  fill(138,51,255);          // colour of box is purple
  rect(440,iBox2,50,50);     // size of the purple box and starting location y
  if(iBox2++>=499)           // movement of box downwards
  {
    iBox2=0;
  }
                             // RED BOX
  fill(255,0,0);             // colour of box is red
  rect(iBox3,20,50,50);      // size of the red box and starting location x
  if(iBox3--<=0)             // movement of box to the left
  {
    iBox3=499;
  }
}
  
