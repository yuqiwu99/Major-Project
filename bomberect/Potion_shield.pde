class Potion_shield extends Potions {
  boolean hasBeenPicked;

  Potion_shield() {
    super(#D014DB, 13, 3,"shield.png");
    hasBeenPicked = false;
  }

  void display() {
    if (hasBeenPicked == false) {
      super.display();
    }
  }

  void collideWithBomber(Bomber aBomber) {
    if (int (aBomber.x_coordinate)==int(super.x_coordinate) && int(aBomber.y_coordinate) == int(super.y_coordinate )) {
      hasBeenPicked = true;
    }
  }
}