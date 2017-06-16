//sound effect
import ddf.minim.*;
Minim minim;
AudioPlayer player1, player2,player3;

//buttons
Button startButton, endButton;

//mainpage, instruction, gameover
PImage main;
Instruction i;
GameOver g;

PFont font;
boolean gameStart, instructions, mainpage, gameOver;

//basic settings
Level thisLevel;
ScreenSize myScreenSize;
Bomber bomber1, bomber2;

//potions
Potion_expand p1;
Potion_explosion p2;
Potion_shield p3;
Potion_explosionSpeed p4;
Timer p1t, p2t, p3t, p4t;
boolean p1isdisplaying, p2isdisplaying, p3isdisplaying, p4isdisplaying;


void setup() {
  //screen
  fullScreen();
  myScreenSize = new ScreenSize();
  thisLevel = new Level("levels/0.txt", 0);

  //sound
  minim = new Minim(this);
  player1 = minim.loadFile("mainpage.mp3");
  player2 = minim.loadFile("level1.mp3");
  player3 = minim.loadFile("gameover.mp3");

  //main
  gameStart = false;
  main = loadImage("mainpage.jpg");  
  startButton = new Button(width/2, height/1.620, "start", #406EEA, #084AFA, width/4, height/5);
  endButton = new Button(width/2, height/1.19, "end", #1BE373, #067C0B, width/4, height/5);
  i = new Instruction();
  g = new GameOver();
  font = createFont("Bauhaus93-48.vlw",48);

  instructions = false;
  mainpage = false;
  gameOver = false;

  //potions
  p1 = new Potion_expand();
  p2 = new Potion_explosion();
  p3 = new Potion_shield();
  p4 = new Potion_explosionSpeed();
  p1t = new Timer(int(random(20, 30)));
  p2t = new Timer(int(random(20, 33)));
  p3t = new Timer(int(random(60, 100)));
  p4t = new Timer(int(random(25, 35)));

  p1isdisplaying = false;
  p2isdisplaying = false;
  p3isdisplaying = false;
  p4isdisplaying = false;

  //players
  bomber1 = new Bomber(#ED2626, 87, 83, 65, 68, 32, #F52C51, 3* myScreenSize.wide/2, 3*myScreenSize.heigh/2, this,"player1.jpg");
  bomber2 = new Bomber(#26ED35, UP, DOWN, LEFT, RIGHT, 97, #B3FF05, 47* myScreenSize.wide/2, 31*myScreenSize.heigh/2, this,"player2.jpg");
}

void draw() {
  displayTheMainPage();
  displayTheGame();
  displayInstruction();
  displayGameOver();
}


//main page
void displayTheMainPage() {
  if (! startButton.hasBeenClicked || mainpage == true) {
    startButton.display();
    endButton.display();
    player1.play();
    imageMode(CENTER);
    image(main, width/2, height/4, width, height/2);
    fill(255);
    textSize(125);
    textFont(font);
    text("YW", 47* myScreenSize.wide/2, 31*myScreenSize.heigh/2);
    textSize(20);
    text("Once Enter the game, do not forget to press 'i' !!", 5*myScreenSize.wide, 13*myScreenSize.heigh);
  }
}

//game
void displayTheGame() {
  if (startButton.hasBeenClicked) {
    gameStart = true;
    background(50);
    noCursor();
    player1.pause();
    player2.play();
  } else if (endButton.hasBeenClicked) {
    exit();
  }
  if (gameStart == true) {
    if (gameOver==false) {
      thisLevel.display();

      bomber1.display(bomber2, thisLevel, p3);
      bomber2.display(bomber1, thisLevel, p3);

      //refresh potions
      if (p1t.isDone()) {
        p1.display();
        p1isdisplaying = true;
      }
      if (p2t.isDone()) {
        p2.display();
        p2isdisplaying = true;
      }
      if (p3t.isDone()) {
        p3.display();
        p3isdisplaying = true;
      }
      if (p4t.isDone()) {
        p4.display();
        p4isdisplaying = true;
      }
      if (p1isdisplaying == true && p1.hasBeenPicked == true) { 
        p1t.reset();
        p1 = new Potion_expand();
        p1isdisplaying = false;
      }
      if (p2isdisplaying == true && p2.hasBeenPicked == true) { 
        p2t.reset();
        p2 = new Potion_explosion();
        p2isdisplaying = false;
      }
      if (p3isdisplaying == true && p3.hasBeenPicked == true) { 
        p3t.reset();
        p3 = new Potion_shield();
        p3isdisplaying = false;
      }
      if (p4isdisplaying == true && p4.hasBeenPicked == true) { 
        p4t.reset();
        p4 = new Potion_explosionSpeed();
        p4isdisplaying = false;
      }
    }
  }
}

//instruction
void displayInstruction() {
  if (instructions == true) {
    i.display();
  }
}

//game over
void displayGameOver() {
  if (bomber1.isDead) {
    player2.pause();
    player3.play();
    textFont(font);
    g.dispaly("Player2 Won The Game!!",#0DD644);
    gameOver = true;
  }
  else if (bomber2.isDead) {
    player2.pause();
    player3.play();
    textFont(font);
    g.dispaly("Player1 Won The Game!!",#F2161D);
    gameOver = true;
  }
}

// controls
void keyPressed() {
  final int k = keyCode;
  if (gameStart == true) {
    //potions collision detection
    p1.collideWithBomber(bomber1);
    p1.collideWithBomber(bomber2);
    p2.collideWithBomber(bomber1);
    p2.collideWithBomber(bomber2);
    p3.collideWithBomber(bomber1);
    p3.collideWithBomber(bomber2);
    p4.collideWithBomber(bomber1);
    p4.collideWithBomber(bomber2);

    //bombers collision detection
    bomber1.handleKeyPressed(k); 
    bomber2.handleKeyPressed(k);
    bomber1.moving(thisLevel);
    bomber2.moving(thisLevel);
    if (k ==73) {
      instructions = true;
    }
  }
}


void keyReleased() {
  final int k = keyCode;
  //bombers
  bomber1.handleKeyReleased(k);
  bomber2.handleKeyReleased(k);
  if (k ==73) {
    instructions = false;
  }
}
void mousePressed() {
  if (!startButton.hasBeenClicked) {
    startButton.checkForClick();
    endButton.checkForClick();
  }
}