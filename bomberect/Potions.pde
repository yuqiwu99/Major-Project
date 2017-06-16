class Potions {
  PImage p;
  ScreenSize myS;
  float x_coordinate, y_coordinate, scalex, scaley;
  int m = int (random(1, 10));
  color pColor;

  Potions(color p_color, int x, int y, String s) {
    myS = new ScreenSize();
    scalex =  myS.wide;
    scaley =  myS.heigh;

    x_coordinate = x*scalex/2;
    y_coordinate = y*scaley/2;
    pColor = p_color;
    
    p = loadImage(s);
  }

  void display() {
    fill(pColor);
   
    image(p,x_coordinate, y_coordinate, scalex *0.75, scaley*0.75);

  }
}