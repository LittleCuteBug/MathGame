class Question {
  PImage bg;
  RectButton menuButton = new RectButton("Menu", 50, 50);
  RectButton resetButton = new RectButton("Reset", 50, 100);
  Paragraph quiz;
  
  void setup() {
    bg = loadImage("../data/img/questionBG.jpg");
  }
  
  void draw() {
    background(bg);
    menuButton.draw();
    resetButton.draw();
    quiz.draw();
  }

  void reset() {

  }
  
  void mousePressed() {
    if(menuButton.clicked())
      currentPage = "menu";
    if(resetButton.clicked())
      reset();
  }

  void keyPressed() {
    
  }
}
