class Tile {
  //data
  float x, y;
  float w, h;
  char tileType;
  boolean isAccessible;

  //constructor
  Tile(float _x, float _y, float _w, float _h, char _tileType) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    tileType = _tileType;

    rectMode(CENTER);
  }
  //functions
  void display() {
    rectMode(CORNER);
    if (tileType == '#') {
      stroke(0);
      fill(255);
      rect(x, y, w, h);
      isAccessible = false;
    } else if (tileType == 'B') {
      stroke(0);
      fill(125);
      rect(x, y, w, h);
      isAccessible = false;
    } else {
      noStroke();
      fill(0);
      rect(x, y, w, h);
      isAccessible = true;
    }
  }
}