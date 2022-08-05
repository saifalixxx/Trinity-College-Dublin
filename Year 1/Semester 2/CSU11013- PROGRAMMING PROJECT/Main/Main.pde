Alien theAlienArray[];  // calling Alien class as an array 
PImage myImage;         // initialisation for my alien image
PImage theExplosion;    // initialisation for the explosion image
long frame = 0;         // initialisation of the frame

void setup()
{
  size(400,400);                                   // size of run box
  myImage = loadImage("spacer.GIF");              // loads the alien image
  theExplosion = loadImage("exploding.GIF");      // loads exploding image 
  frameRate(100);                                // changes speed
  theAlienArray = new Alien[10];                 // dupicates the aliens
  space_array (theAlienArray);                   // This array function allows gaps to be made between each alien
}

void draw()
{
  background(255);               // white background
  move_array(theAlienArray);     // calls move array function
  draw_array(theAlienArray);     // calls draw array function
  clock();                       // calls clock function
  explode();                     // calls explosion function
}

void clock()
{
  println(frame);  // print the figures of the frame
  frame++;         // frame increases
}

void explode()
{
  for(int count=0; count<theAlienArray.length;count++)  // for loop counter
  {
    println(theAlienArray[count].explodeFrame);    // print the set frame for each alien
    if(frame==theAlienArray[count].explodeFrame)   // if frame equals to an individual aliens set frame, the alien will explode
    {  
      theAlienArray[count].myImage = theExplosion;    // alien image is converted to explosion image
    }
  }
  
}

void space_array(Alien theAlienArray[])   // array for the gaps between the aliens
{
  for(int count=0; count < theAlienArray.length;count++)
  {
    theAlienArray[count] = new Alien(1+count*30,10,myImage);
  }
}

void move_array(Alien theAlienArray[]) // for every alien it is going to move. array for the movement of the aliens
{
  for(int count=0; count<theAlienArray.length;count++)
  {
    theAlienArray[count].move();  // calls move function to allow all aliens to follow the orders in the move function.
  }
}

void draw_array(Alien theAlienArray[])  // allows the aliens to be created. For each element an alien is created.
{
  for(int count=0; count<theAlienArray.length;count++)
  {
    theAlienArray[count].draw();
  }
}
