class ScreenSize {

  int wide, heigh;
  Level myLevel;

  ScreenSize() {
    myLevel = new Level("levels/0.txt", 0);
    wide = width/myLevel.tilesWide;
    heigh = height/myLevel.tilesHigh;
  }
}