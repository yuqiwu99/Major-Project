class Bombs {
  Timer bombTimer, t;
  float x, y;
  int bombSizex, bombSizey;
  color bombColor;
  boolean exploded;

  float time;



  ScreenSize myScreenSize;

  Bombs() {
    myScreenSize = new ScreenSize();
    bombTimer = new Timer (3);
    t = new Timer(3);
    bombSizex = myScreenSize.wide;
    bombSizey = myScreenSize.heigh;
  }

  Bombs(float x_bomber, float y_bomber, color bomb_color, int explosionTimer) {
    myScreenSize = new ScreenSize();
    bombTimer = new Timer (explosionTimer);
    t = new Timer(3);
    x = x_bomber;
    y = y_bomber;
    bombSizex = myScreenSize.wide;
    bombSizey = myScreenSize.heigh;
    bombColor = bomb_color;
  }

  void display() {
    if (! t.isDone()) {
      drawBasicBomb();
      t.reset();
    }
    explosion();
  }

  void drawBasicBomb() {
    fill(bombColor);

    ellipse(x, y, bombSizex, bombSizey);
  }

  void explosion() {
    if (bombTimer.isDone()) {
      exploded = true;
      bombTimer.reset();
    } else {
      exploded = false;
    }
  }
}