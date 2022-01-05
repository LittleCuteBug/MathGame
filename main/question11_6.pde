class Question11_6 extends Question {
  AnswerChoicesButton[] answer = new AnswerChoicesButton[4];
  void setup() {
    super.setup();
    String quizText = "Câu 11_6: Trong khoảng từ 4 đến 39, có bao nhiêu bội số của 4";
    quiz = new QuizText(quizText);
    answer[0] = new AnswerChoicesButton("A. Có 6 bội số", false, 250, 460, 50, 500, 100);
    answer[1] = new AnswerChoicesButton("B. Có 7 bội số", false, 770, 460, 50, 500, 100);
    answer[2] = new AnswerChoicesButton("C. Có 8 bội số", false, 250, 580, 50, 500, 100);
    answer[3] = new AnswerChoicesButton("D. Có 9 bội số", true, 770, 580, 50, 500, 100);
  }
  
  void draw() {
    super.draw();
    for (AnswerChoicesButton button: answer) {
      button.draw();
    }
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
