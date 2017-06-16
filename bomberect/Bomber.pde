class Bomber {  //<>//
  //sound effects and screen
  ScreenSize myScreenSize;
  Minim minim;
  AudioPlayer player1, player2;

  //basic bomber settings
  PImage bomber;
  float x_coordinate, y_coordinate, x_speed, y_speed;
  float currentX, currentY;
  int speedScale;
  int sizeOfCharacterx;
  int sizeOfCharactery;
  int up_key, down_key, left_key, right_key, place_bomb;
  int lastFrameMoved, hesitationAmount;
  boolean isDead;
  boolean movingup, movingdown, movingleft, movingright;
  color my_color;

  //bombs
  ArrayList<Bombs> bombs;
  int numbersOfBombs;
  color bomb_color;

  //explosion
  Timer explosionTimer;
  Explosion myExplosion;
  float explosionSize;
  int explosionTime;
  boolean explosion;  



  //constructor
  Bomber(color myColor, int upKey, int downKey, int leftKey, int rightKey, int placeBomb, color bombColor, float x, float y, PApplet p, String _bomber ) {
    myScreenSize = new ScreenSize();
    explosionTimer = new Timer(2);
    bomber = loadImage(_bomber);
   
    explosionSize = 3;
    explosionTime = 5;
     numbersOfBombs = 3;
     
    sizeOfCharacterx = myScreenSize.wide;
    sizeOfCharactery = myScreenSize.heigh;
    x_coordinate = x;
    y_coordinate = y;
    speedScale = 1;
    x_speed = sizeOfCharacterx * speedScale;
    y_speed = sizeOfCharactery * speedScale;

    my_color=myColor;
    up_key= upKey;
    down_key= downKey;
    left_key= leftKey;
    right_key= rightKey;
    place_bomb = placeBomb;
    bomb_color = bombColor;
    bombs = new ArrayList<Bombs>();
   
    isDead = false;
    movingup = false;
    movingdown = false;
    movingleft = false;
    movingright = false;
    lastFrameMoved = 0;
    hesitationAmount = 0;
    minim = new Minim(p);
    player1 = minim.loadFile("placebomb.mp3");
    player2 = minim.loadFile("explode.mp3");
  }

  //behaviors

  void display(Bomber otherBomber, Level currentLevel, Potion_shield potion) {
    if (isDead == false) {
      drawBasicCharacter();
      displayBomb(otherBomber, currentLevel, potion);
    }




    //die();
  }
  void drawBasicCharacter() {
    fill(my_color);
    rectMode(CENTER);

    image(bomber,x_coordinate, y_coordinate, sizeOfCharacterx, sizeOfCharactery);
  }

  //  collision detection


  void handleKeyPressed(int k) {


    if (k == left_key) {
      movingleft = true;
    }
    if (k == right_key) {
      movingright = true;
    }
    if (k == up_key) {
      movingup = true;
    }
    if (k == down_key) {
      movingdown = true;
    }
    // Letter J is 74
    if (k == place_bomb ) {
      placeBomb();
    }
  }

  void handleKeyReleased(int k) {
    if (k == left_key) {
      movingleft = false;
    }
    if (k == right_key) {
      movingright = false;
    }
    if (k == up_key) {
      movingup = false;
    }
    if (k == down_key) {
      movingdown = false;
    }
  }

  void moving( Level currentLevel) {
    if (frameCount > lastFrameMoved + hesitationAmount) {
      lastFrameMoved = frameCount;
      int xTile = int(x_coordinate / currentLevel.tileWidth);
      int yTile = int(y_coordinate / currentLevel.tileHeight);
      if (movingleft) {
        if (currentLevel.tiles[xTile-1][yTile].tileType == '.') {
          x_coordinate -= x_speed;
          currentX =x_coordinate;
        }
      } else if (movingright) {
        if (currentLevel.tiles[xTile+1][yTile].tileType == '.') {
          x_coordinate += x_speed;
          currentX =x_coordinate;
        }
      } else if (movingup) {
        if (currentLevel.tiles[xTile][yTile-1].tileType == '.') {

          y_coordinate -= y_speed;

          currentY = y_coordinate;
        }
      } else if (movingdown) {   
        if (currentLevel.tiles[xTile][yTile+1].tileType == '.') {
          y_coordinate += y_speed;

          currentY = y_coordinate;
        }
      }
    }
  }

  void placeBomb() {
    player1.rewind();       
    if (bombs.size() < numbersOfBombs) {
      currentX =x_coordinate;
      currentY = y_coordinate;
      bombs.add(new Bombs(currentX, currentY, bomb_color, explosionTime));
    }
  }
  void displayBomb(Bomber otherBomber, Level currentLevel, Potion_shield potion) {
    for (int i = bombs.size()-1; i>=0; i--) {
      Bombs b = bombs.get(i);
      int xTile = int(b.x / currentLevel.tileWidth);
      int yTile = int(b.y / currentLevel.tileHeight);
      currentLevel.tiles[xTile][yTile].tileType = 'B';
      if (b.exploded == true) {
        player2.play();
        myExplosion = new Explosion(b.x, b.y, explosionSize);
        myExplosion.display();
        ///next to do 

        if (myExplosion.x-myExplosion.bx/2 <= x_coordinate && myExplosion.x+myExplosion.bx/2 >= x_coordinate
          && myExplosion.y-myExplosion.sizeOfExplosionx/2 <= y_coordinate && myExplosion.y+myExplosion.sizeOfExplosionx/2 >= y_coordinate
          ||
          myExplosion.y-myExplosion.by/2 <= y_coordinate && myExplosion.y+myExplosion.by/2 >= y_coordinate
          && myExplosion.x-myExplosion.sizeOfExplosiony/2 <= x_coordinate && myExplosion.x+myExplosion.sizeOfExplosiony/2 >= x_coordinate) {
          if (potion.hasBeenPicked == false) {
            isDead = true;
          } else {
            isDead = false;
            potion.hasBeenPicked = false;
          }
        }
        if (myExplosion.x-myExplosion.bx/2 <= otherBomber.x_coordinate && myExplosion.x+myExplosion.bx/2 >= otherBomber.x_coordinate
          && myExplosion.y-myExplosion.sizeOfExplosionx/2 <= otherBomber.y_coordinate && myExplosion.y+myExplosion.sizeOfExplosionx/2 >= otherBomber.y_coordinate
          ||
          myExplosion.y-myExplosion.by/2 <= otherBomber.y_coordinate && myExplosion.y+myExplosion.by/2 >= otherBomber.y_coordinate
          && myExplosion.x-myExplosion.sizeOfExplosiony/2 <= otherBomber.x_coordinate && myExplosion.x+myExplosion.sizeOfExplosiony/2 >= otherBomber.x_coordinate) {
          if (potion.hasBeenPicked == false) {
            otherBomber.isDead = true;
          } else {
            otherBomber.isDead = false;
            potion.hasBeenPicked = false;
          }
        }   
        bombs.remove(i);
        player2.rewind();
        currentLevel.tiles[xTile][yTile].tileType = '.';
      } else {
        b.display(); 
        if (bombs.size()<numbersOfBombs) {
          player1.play();
        }
      }
    }
  }
}