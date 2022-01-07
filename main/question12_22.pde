class Question12_22 extends Question {
  AnswerChoicesButton[] answer = new AnswerChoicesButton[4];

  void setup() {
    super.setup();
    String quizText = "Câu 12_22: Có một vài con chim sẻ đang đậu trên hai cành cây. Ban đầu cành thứ nhất có nhiều hơn cành thứ hai 5 con chim. Sau đó có 4 con chim bay từ cành thứ nhất sang cành thứ hai. Hỏi cành nào có nhiều con chim sẻ đậu hơn? Và đậu nhiều hơn bao nhiêu con?";
    quiz = new QuizText(quizText);
    answer[0] = new AnswerChoicesButton("A. Cành thứ nhất nhiều hơn 1 con", false, 250, 460, 35, 500, 100);
    answer[1] = new AnswerChoicesButton("B. Cành thứ hai nhiều hơn 3 con", true, 770, 460, 35, 500, 100);
    answer[2] = new AnswerChoicesButton("C. Cành thứ hai nhiều hơn 4 con", false, 250, 580, 35, 500, 100);
    answer[3] = new AnswerChoicesButton("D. Cành thứ nhất nhiều hơn 9 con", false, 770, 580, 35, 500, 100);
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
