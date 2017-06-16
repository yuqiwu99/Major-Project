
class Potion_expand extends Potions {
  boolean hasBeenPicked;

  Potion_expand() {

    super(#2BE04A, 9, 29,"bomb.png");
    hasBeenPicked = false;
  }

  void display() {

    super.display();
  }


  void collideWithBomber(Bomber aBomber) {
    if (int (aBomber.x_coordinate)==int(super.x_coordinate) && int(aBomber.y_coordinate) == int(super.y_coordinate ) ) {

      if (aBomber.numbersOfBombs <=8) {
        aBomber.numbersOfBombs ++;

        hasBeenPicked = true;
      }
    }
  }
}