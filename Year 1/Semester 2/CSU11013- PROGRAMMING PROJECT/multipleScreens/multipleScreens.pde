ArrayList widgetButton;
PFont stdFont;  // Font Initialsiation
Screen screenOne, screenTwo, currentScreen;
int switchScreen = 0;
final int EVENT_BUTTON1=1;   // Making  First widget
final int EVENT_BUTTON2=2;   // Making second widget
final int EVENT_BUTTON3=3;   // Making  First widget
final int EVENT_BUTTON4=4;   // Making  First widget
Widget button1,forward, button2, backward;

final int EVENT_NULL=0;   // Initialisation of event
int event; // Event initialisation

void setup() 
{
  Widget widget1, widget2, widget3;
  size(400, 400);
  stdFont=loadFont("Serif.vlw"); 
  textFont(stdFont);
  button1=new Widget(150, 100, 100, 40, "Button 1", color(255, 0, 247), stdFont, EVENT_BUTTON1);
  forward=new Widget(150, 200, 100, 40, "Forward", color(42, 253, 0), stdFont, EVENT_BUTTON2);
  button2=new Widget(150, 100, 100, 40, "Button 2", color(38, 220, 255), stdFont, EVENT_BUTTON3);
  backward=new Widget(150, 200, 120, 40, "Backward", color(253, 4, 0), stdFont, EVENT_BUTTON4);

  screenOne = new Screen(color(253, 4, 0));
  screenTwo = new Screen(color(42, 253, 0));
  currentScreen = screenOne;

  widgetButton = new ArrayList();
  screenOne.addWidget(button1); 
  screenOne.addWidget(forward);
  screenTwo.addWidget(button2); 
  screenTwo.addWidget(backward);
}

void draw() 
{
  currentScreen.draw();
}

void mouseMoved()
{
  for (int i = 0; i<widgetButton.size(); i++)   // Input handaling
  {
    Widget aWidget = (Widget) widgetButton.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event)
    {
    case EVENT_BUTTON1:
    case EVENT_BUTTON2:
      aWidget.strokeOutline = (color(255));
      break;
    case EVENT_NULL:
      aWidget.strokeOutline = (color(0));
    }
  }
}

  void mousePressed() 
  {
    int event;
    event = currentScreen.getEvent();
    switch(event) 
    {
    case EVENT_BUTTON1:
      println("current screen = screen 1");
      break;
    case EVENT_BUTTON2:
    currentScreen = screenTwo;
      break;
    case EVENT_BUTTON3:
      println("current screen = screen 2");
        break;
    case EVENT_BUTTON4:
    currentScreen = screenOne;
    }
  }
