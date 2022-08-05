int iBox1 = 0;                // initialisation of boxes
int iBox2 = -199;
int iBox3 = 0;
int iBox4 = 199;

void setup()                 // set up run box
{
  size(200,200);            // size of run box
  noStroke();               // no outer line
}

void draw()          
{                          // WHITE BOX RIGHT
  background(0);           // background colour of run box is black
  fill(253,254,254);       // colour of box white
  rect(iBox1,20,50,50);    // location and size of box x
  if(iBox1++>=398)         // movement of box to the right
  {
    iBox1=-100;
  }
                           // WRAP WHITE BOX RIGHT
  fill(253,254,254);       
  rect(iBox2,20,50,50);   
  if(iBox2++>=199)
  {
    iBox2=-300;
  }
                           // WHITE BOX LEFT
  fill(253,254,254);       // colour of box white
  rect(iBox3,100,50,50);   // location and size of box x
  if(iBox3--<=-49)         // movement of the box to the left
  {
    iBox3=451;
  }
                           // WRAP WHITE BOX LEFT
  fill(253,254,254);       
  rect(iBox4,100,50,50);  
  if(iBox4--<=-249)
  {
    iBox4=251;
  }
}
