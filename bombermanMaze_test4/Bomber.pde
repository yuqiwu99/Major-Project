class Bomber {
  //data
  //Bomb bomb1;
  float x_coordinate, y_coordinate, x_speed, y_speed;
  int sizeOfCharacter = 50;
  color my_color;
  int up_key, down_key, left_key, right_key;


  //constructor
  //Bomber(color myColor) {
  //  //bomb1 = new Bomb();
  //  x_coordinate = random(sizeOfCharacter/2, width-sizeOfCharacter/2);
  //  y_coordinate = random(sizeOfCharacter/2, height-sizeOfCharacter/2);
  //  x_speed = 5;
  //  y_speed = 5;
  //  my_color=myColor;
  //}

  //constructor
  Bomber(color myColor, int upKey, int downKey, int leftKey, int rightKey) {
    //bomb1 = new Bomb();
    x_coordinate = random(sizeOfCharacter/2, width-sizeOfCharacter/2);
    y_coordinate = random(sizeOfCharacter/2, height-sizeOfCharacter/2);
    x_speed = 10;
    y_speed = 10;
    my_color=myColor;
    up_key= upKey;
    down_key= downKey;
    left_key= leftKey;
    right_key= rightKey;
  }

  //behaviors

  void display() {
    drawBasicCharacter();

    //placeBomb();
    //die();
  }
  void drawBasicCharacter() {
    fill(my_color);
    rectMode(CENTER);
    rect(x_coordinate, y_coordinate, sizeOfCharacter, sizeOfCharacter);
  }
  void collisionCheck(Level currentLevel) {
    println(currentLevel.x_block);
    println(currentLevel.y_block);
  }


  void handleKeyPressed(int k) {
    if (k == left_key) {
      x_coordinate -= x_speed;
    }
    if (k == right_key) {
      x_coordinate += x_speed;
    }
    if (k == up_key) {
      y_coordinate -= y_speed;
    }
    if (k == down_key) {
      y_coordinate += y_speed;
    }
  }
}