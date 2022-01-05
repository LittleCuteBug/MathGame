class Question11_17 extends Question {
  
   AnswerChoicesButton[] answer = new AnswerChoicesButton[4];
  void setup() {
    super.setup();
    String quizText = "Câu 11_17: Patrick đã làm bài thi cuối kì rất tốt. Bố Patrick quyết định thưởng cho con. Patrick sẽ phải chọn một món chính trong thực đơn khai vị, món chính và đồ uống. Hỏi có bao nhiêu sự kết hợp giữa ba món mà Patrick có thể chọn?";
    quiz = new QuizText(quizText);
    answer[0] = new AnswerChoicesButton("A. Có 9 cách kết hợp", false, 250, 460, 50, 500, 100);
    answer[1] = new AnswerChoicesButton("B. Có 6 cách kết hợp", false, 770, 460, 50, 500, 100);
    answer[2] = new AnswerChoicesButton("C. Có 18 cách kết hợp", true, 250, 580, 50, 500, 100);
    answer[3] = new AnswerChoicesButton("D. Có 12 cách kết hợp", false, 770, 580, 50, 500, 100);
  }
  
  void draw() {
    super.draw();
    for (AnswerChoicesButton button: answer) {
      button.draw();
    }
    
    textAlign(LEFT);
    textSize(40);
    fill(0);

    text("Món khai vị", 270, 250);
    text("1. Salad", 240, 310);
    text("2. Súp nghêu", 240, 360);
    
    text("Món chính", 610, 250);
    text("A. Gà Mê-hi-cô", 570, 310);
    text("B. Bò Ý", 570, 360);
    text("C. Cá tuyết om", 570, 410);

    text("Đồ uống", 940, 250);
    text("I  . Nước ngọt", 900, 310);
    text("II . Trà", 900, 360);
    text("III. Nước hoa quả", 900, 410);
    
  }

  void reset() {
    super.reset();
    for (AnswerChoicesButton b: answer) {
      b.is_answered = false;
    }
  }
  
  void mousePressed() { 
    for (AnswerChoicesButton button: answer) {
      if(button.clicked()) {
        finish(button.is_correct_answer);
        for (AnswerChoicesButton b: answer) {
          b.is_answered = true;
        }
      }
    }
  }
}
