class Question12_1 extends Question {
  String answer[] = new String[2];
  String res = "";
  int state = 0;
  String big = "60";
  String small = "50";
  int pos = 1366;
  int curSum = 110;
  int rate = 0;
  void setup() {
    super.setup();
    String quizText = "Câu 12_1: Chia 110 viên bi vào 2 túi sao cho túi thứ nhất nhiều hơn túi thứ hai 10 viên. Hỏi có bao nhiêu viên bi trong mỗi túi?";
    quiz = new QuizText(quizText);
    answer[0] = answer[1] = "";
  }
  
  void draw() {
    super.draw();
    

    textSize(32);
    fill(50);
    rect(300,500,150,50); /// answerB box 
    rect(500,500,150,50); /// answerS box 
    rect(800,500,150,50); /// submit box 
    rect(1000,500,150,50); /// sol box 
    ////
    fill(0);
    text("Số lớn là", 300, 500);
    text(answer[0], 300, 540);
    text("Số bé là", 500, 500);
    text(answer[1], 500, 540);
    text("Trả lời", 800, 540);
    text(res, 500, 600);
    text("Hướng dẫn", 1000, 540);
    
    
    
    
    //translate(2, 180);
    //rotate(45);
    //text("45 DEGREES", 0, 0);
    //line(0, 0, 150, 0);
    /////
    
    
    fill(80);
    rect(300,300,500,50); /// Diff box
    
    fill(50);
    rect(300,225,500,50); /// Snumber box
    rect(300,300,300,50); /// Snumber box
    
    rect(pos,300,200,50); /// Add box
    if (pos > 600) {
      pos = max(pos - rate, 600);
      if (pos == 600) {
        curSum += 10;
      }
    }
    
    textSize(150);
    text("}", 1000, 320);
 
    textSize(40);
    text("Số lớn", 180, 270);
    fill(255);
    text("Số bé", 180, 345);
    noFill();
    text("Số bé là: 110 - 60 = 50", 180, 420);
    fill(0);
    text(10, 700, 345);
    text(curSum, 1050, 290);
    
    
    
    
  }
  
  void mousePressed() {
    
   
    
    super.mousePressed();
    if (mouseX >= 300 && mouseX <= 450 && mouseY >= 500 && mouseY <= 550) {
      state = 0;
    }
    if (mouseX >= 500 && mouseX <= 650 && mouseY >= 500 && mouseY <= 550) {
      state = 1;
    }
    if (mouseX >= 800 && mouseX <= 1000 && mouseY >= 500 && mouseY <= 550) {
      res = "Trả lời đúng";
    }
    if (mouseX >= 1000 && mouseX <= 1150 && mouseY >= 500 && mouseY <= 550) {
      rate = 3;
    }
  }
  void keyPressed() {
    if (key >= '0' && key <= '9') {
      answer[state] = answer[state] + key;
    }
  }
}
