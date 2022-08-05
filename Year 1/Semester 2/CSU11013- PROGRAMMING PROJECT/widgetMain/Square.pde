class Square
{
  int x = 0;   // Initialisation of x axis
  int y = 0;   // Initialisation of y axis
  int z = 0;   // Initialisation of length
  color squareC = 255;  // Colour of square

  Square(int xConstruct, int yConstruct, int zConstruct)  // Constructor
  {
    x = xConstruct; 
    y = yConstruct;
    z = zConstruct;
  }

  void draw()
  {
    stroke(0);  // Colour of square outline
    strokeWeight(10);  // size of square outline
    fill(squareC);  // colour of square
    rect(x, y, z, z);  // size and location of square
  }
}
