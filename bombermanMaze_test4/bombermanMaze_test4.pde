Bomber bomber1, bomber2;

Level thisLevel;


void setup() {
  size(600,600);
  //fullScreen();  // 4:3 ratio
  thisLevel = new Level("levels/0.txt", 0);
  bomber1 = new Bomber(#ED2626, 87,83,65,68);
  bomber2 = new Bomber(#26ED35, UP,DOWN,LEFT,RIGHT);
}

void draw() {
  thisLevel.display();
  bomber1.display();
  bomber2.display();
  bomber1.collisionCheck(thisLevel);
 
}

void keyPressed() {
final int k = keyCode;
 bomber1.handleKeyPressed(k); 
 bomber2.handleKeyPressed(k);

  
}