class Button {
  //data
  float x, y;
  float theWidth, theHeight;
  float fontSize;
  color backgroundColor, fontColor, hoverBackgroundColor, hoverFont;
  String label;
  boolean hasBeenClicked;
  PFont font;

  //constructor(s)
  Button(float _x, float _y, String _label, color _backgroundColor, color _hoverBackgroundColor
    , float _theWidth, float _theHeight) {
    x = _x;
    y = _y;
    theWidth = _theWidth;
    theHeight = _theHeight;
    backgroundColor = _backgroundColor;
    fontColor = color(0);
    hoverBackgroundColor = _hoverBackgroundColor;
    hoverFont =color(255);
    label = _label;
    fontSize = theWidth * 0.15;
    font = createFont("Bauhaus93-48.vlw",32);
    hasBeenClicked = false;
  }



  //behaviour
  void display() {
    if ( isMouseHovering() ) {
      focusedDisplay();
    } else {
      unfocusedDisplay();
    }
  }

  void checkForClick() {
    if (mousePressed && isMouseHovering()) {
      hasBeenClicked = true;
    }
  }

  boolean isClicked() {
    return hasBeenClicked;
  }

  boolean isMouseHovering() {
    if ( (mouseX > x - theWidth/2) && (mouseX < x + theWidth/2) &&
      (mouseY > y - theHeight/2) && (mouseY < y + theHeight/2)) {
      return true;
    } else {
      return false;
    }
  }

  void unfocusedDisplay() {
    rectMode(CENTER);
    fill(backgroundColor);
    rect(x, y, theWidth, theHeight,100);
    fill(fontColor);
    textSize(fontSize);
    textFont(font);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }

  void focusedDisplay() {
    rectMode(CENTER);
    fill(hoverBackgroundColor);
    rect(x, y, theWidth, theHeight,100);
    fill(hoverFont);
    textFont(font);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
}