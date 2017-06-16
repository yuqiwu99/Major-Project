class Potion_explosionSpeed extends Potions {
  boolean hasBeenPicked;

  Potion_explosionSpeed() {
    super(#2B93E0, 37, 31,"time.png");
    hasBeenPicked = false;
  }

  void display() {
    if (hasBeenPicked == false) {  
      super.display();
    }
  }

  void collideWithBomber(Bomber aBomber) {
    if (int (aBomber.x_coordinate)==int(super.x_coordinate) && int(aBomber.y_coordinate) == int(super.y_coordinate ) ) {
      if (aBomber.explosionTime >= 2) {
        aBomber.explosionTime -= 0.5;
        hasBeenPicked = true;
      }
    }
  }
}