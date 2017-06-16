class Explosion {
  Bombs mybomb;
  float sizeOfExplosionx, sizeOfExplosiony;
  color explosionColor= #F5DB11;
  float x, y, bx, by, scale;

  Explosion(float _x, float _y, float _scale ) {
    mybomb = new Bombs();
    bx = mybomb.bombSizex;
    by=mybomb.bombSizey;
    sizeOfExplosionx = by * _scale;
    sizeOfExplosiony = bx * _scale;
    x = _x;
    y= _y;
  }

  void display() {
    noStroke();
    fill(#F5DB11);
    rectMode(CENTER);
    rect(x, y, bx, sizeOfExplosionx,100);
    rect(x, y, sizeOfExplosiony, by,100);
  }
}