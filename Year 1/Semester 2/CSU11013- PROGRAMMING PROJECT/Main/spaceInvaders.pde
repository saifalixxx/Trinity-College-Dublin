class Alien {        // Alien class
PImage myImage;      // initialisation for alien image
int x = 0;           // initialisation for the x position of the alien
int y = 0;           // initialisation for the y position of the alien
int dx = 1;          // initialisation for x speed set to 1
int dy = 1;          // initialisation for y speed set to 1
int explodeFrame;    // initialisation of the explode frame


Alien(int xConstruct,int yConstruct, PImage theImage)  // constructor allows everything to be initialised and sets up the alien image
{
  x = xConstruct ;
  y = yConstruct ;
  explodeFrame = (int)random(0,3000);    // the explode frame is set to random number between 0-3000
  myImage = theImage;
}

void draw()
{
  image(myImage,x,y);  // setting location of the alien image
}
 
void move()    // alien movement is controlled here
{
  x = dx+x;   // this mathematical equation allows the alien to move
   
  if(x == 370||x==0)   // if the alien hits 370 or 0 around the x-axis then it should stop and move down
  {
    dx = 0;
    y++;
  }

  if(y == 50||y==150||y==250||y==350)  // when the alien goes down to the y-axis and hits any of these location numbers the alien moves left
  {
    dy=0;
    x--;
  }

  if(y==100||y==200||y==300)  // when the alien goes down to the y-axis and hits any of these location numbers the alien moves right 
  {
    dy=0;
    x++;
  }
}
}
