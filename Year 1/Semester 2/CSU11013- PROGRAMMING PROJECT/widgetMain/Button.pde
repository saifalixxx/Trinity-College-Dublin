class Widget
{
  int x = 0;        
  int y = 0;     
  int width = 0; 
  int height = 0; 
  String label;   
  int event;     
  color widgetColor, labelColor;
  PFont widgetFont;
  color strokeOutline = 0;

  Widget(int x, int y, int width, int height, String label,    // constructor
    color widgetColor, PFont widgetFont, int event)  
  {
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; 
    this.event=event; 
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }

  void draw()   // Draws the widget
  {
    stroke(strokeOutline);
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+10, y+height-10);
  }
  
  int getEvent(int mX, int mY)   // If statement for the event
  {
    if(mX>x && mX < x+width && mY >y && mY <y+height)
    {
      return event;
    }
    return EVENT_NULL;
  }
}
