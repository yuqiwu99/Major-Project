class GameOver {


  GameOver() {
    background(255);
  }
  void dispaly(String s,color c) {
    fill(c);
    textSize(100);
    text(s, width/2, height/2);
    fill(255);
    text("YW", 47* myScreenSize.wide/2, 31*myScreenSize.heigh/2);
  }
}