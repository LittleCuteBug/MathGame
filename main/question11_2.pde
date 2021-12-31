class Question11_2 extends Question {
  AnswerChoicesButton[] answer = new AnswerChoicesButton[4];

  void setup() {
    super.setup();
    String quizText = "Câu 11_2: Trong khoảng từ 8 đến 32, có bao nhiêu bội số của 3";
    quiz = new QuizText(quizText);
    answer[0] = new AnswerChoicesButton("A. Có 6 bội số", false, 250, 460, 50, 500, 100);
    answer[1] = new AnswerChoicesButton("B. Có 7 bội số", false, 770, 460, 50, 500, 100);
    answer[2] = new AnswerChoicesButton("C. Có 8 bội số", true, 250, 580, 50, 500, 100);
    answer[3] = new AnswerChoicesButton("D. Có 9 bội số", false, 770, 580, 50, 500, 100);
  }
  
  void draw() {
    super.draw();
    for (AnswerChoicesButton button: answer) {
      button.draw();
    }
  }

  void reset() {
    for (AnswerChoicesButton b: answer) {
      b.is_answered = false;
    }
  }
  
  void mousePressed() {
    super.mousePressed();
    for (AnswerChoicesButton button: answer) {
      if(button.clicked()) {
        for (AnswerChoicesButton b: answer) {
          b.is_answered = true;
        }
      }
    }
  }
}
