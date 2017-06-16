class Instruction {
  PImage instruction;

  Instruction() {
    instruction = loadImage("instruction.jpg");
  }

  void display() {


    imageMode(CENTER);
    image(instruction, width/2, height/2, width, height);
  }
}