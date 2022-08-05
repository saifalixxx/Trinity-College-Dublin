class Screen
{
  ArrayList widgetButton; // widget calling
  color backDrop;  // colour of screen

  Screen (color backDrop)
  {
    this.backDrop = backDrop;
    widgetButton = new ArrayList();
  }

  void draw()
  {
    background(backDrop);
    for (int count = 0; count < widgetButton.size(); count++)
    {
      Widget aWidget = (Widget) widgetButton.get(count);
      aWidget.draw();
    }
  }

  void addWidget(Widget widget) // add to widget list
  {
    widgetButton.add(widget);
  }

  int getEvent() // assigning a number to it and assigning it as a parameter.
  { // If your mouse is around the area it will return the event
    int inEvent = 0;
    for (int count = 0; count < widgetButton.size(); count++)
    {
      Widget aWidget = (Widget) widgetButton.get(count);
      inEvent = aWidget.getEvent(mouseX, mouseY);

      if (inEvent != EVENT_NULL)
      {
        break;
      }
    }
    return inEvent; // return number, it shows button has clicked
  }
}
