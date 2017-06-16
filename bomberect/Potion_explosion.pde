class Potion_explosion extends Potions {
  boolean hasBeenPicked;

  Potion_explosion() {

    super(#FAE019, 41, 5,"explosion.png");
    hasBeenPicked = false;
  }

  void display() {

    if (hasBeenPicked == false) {    
      super.display();
    }
  }



  void collideWithBomber(Bomber aBomber) {
    if (int (aBomber.x_coordinate)==int(super.x_coordinate) && int(aBomber.y_coordinate) == int(super.y_coordinate )) {
      if (aBomber.explosionSize <=6) {
        aBomber.explosionSize += 0.5;
        hasBeenPicked = true;
      }
    }
  }
}