ArrayList widgetList;   // Making widget an ArrayList
PFont stdFont;  // Font Initialsiation
Square screenSquare;   // Calling square class
final int EVENT_BUTTON1=1;   // Making  First widget
final int EVENT_BUTTON2=2;   // Making second widget
final int EVENT_BUTTON3=3;   // Making third widget
final int EVENT_NULL=0;   // Initialisation of event
int event; // Event initialisation

void setup() 
{
  Widget widget1, widget2, widget3;
  size(400, 400);
  stdFont=loadFont("Font.vlw"); 
  textFont(stdFont);
  widget1=new Widget(10, 100, 100, 40, "RED", color(253, 4, 0), stdFont, EVENT_BUTTON1);
  widget2=new Widget(10, 200, 100, 40, "GREEN", color(42, 253, 0), stdFont, EVENT_BUTTON2);
  widget3=new Widget(10, 300, 100, 40, "BLUE", color(0, 84, 253), stdFont, EVENT_BUTTON3);
  screenSquare = new Square(130, 95, 250);
  widgetList = new ArrayList();
  widgetList.add(widget1); 
  widgetList.add(widget2);
  widgetList.add(widget3);
}
void draw() 
{
  screenSquare.draw();    // Draw our square 
  for (int i = 0; i<widgetList.size(); i++) 
  {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
}

void mousePressed() 
{
  int event;
  for (int i = 0; i<widgetList.size(); i++)   // Input handaling
  {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) 
    {
    case EVENT_BUTTON1:
      screenSquare.squareC = color(253, 4, 0);
      break;
    case EVENT_BUTTON2:
      screenSquare.squareC = color(42, 253, 0);
      break;
    case EVENT_BUTTON3:
      screenSquare.squareC = color(0, 84, 253);
      break;
    }
  }
}

void mouseMoved()
{
 for (int i = 0; i<widgetList.size(); i++)   // Input handaling
  {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event)
    {
      case EVENT_BUTTON1:
      case EVENT_BUTTON2:
      case EVENT_BUTTON3:
      aWidget.strokeOutline = (color(255));
      break;
      case EVENT_NULL:
      aWidget.strokeOutline = (color(0));

    }
}
}
