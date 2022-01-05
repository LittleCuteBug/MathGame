class Question {
  RectButton menuButton = new RectButton("Menu", 50, 50);
  RectButton resetButton = new RectButton("Reset", 50, 100);
  
  RectButton menuButtonFinish = new RectButton("Menu", 570, 580, 50);
  RectButton resetButtonFinish = new RectButton("Reset", 810, 580, 50);
  
  boolean isFinish = false;
  boolean isCorrect;

  Paragraph quiz;

  void setup() {
  }
  
  void _draw() {
    background(questionBG);
    menuButton.draw();
    resetButton.draw();
    quiz.draw();
    draw();
    if(isFinish) {
      fill(0,230);
      rect(0,0,1366,768);
      if(isCorrect) {
        image(congratIMG, 0, 0); 
      } else {
        image(tryAgainIMG, 0, 0);
      }
      menuButtonFinish.draw();
      resetButtonFinish.draw();
    }
  }

  void reset() {
    menu.achievements.get(currentPage).display = false;
    isFinish = false;
  }

  void finish(boolean is_correct) {
    menu.achievements.get(currentPage).display = is_correct;
    isCorrect = is_correct;
    isFinish = true;
  }
  
  void _mousePressed() {
    if(isFinish) {
      if(menuButtonFinish.clicked())
        currentPage = "menu";
      if(resetButtonFinish.clicked())
        reset();
    } else {
      mousePressed();
      if(menuButton.clicked())
        currentPage = "menu";
      if(resetButton.clicked())
        reset();
    }
  }
  
  void draw() {

  }
  
  void mousePressed() {

  }

  void keyPressed() {

  }
  void mouseReleased() {
    
  }
  void mouseDragged() {
    
  }
}
