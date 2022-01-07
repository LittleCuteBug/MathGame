class Ball {
  // not chosen
  int x;
  int y;
  int r = 30;
  float deg = random(0, 2 * PI);
  float dis = 2 * PI / 360;
  color colo;

  boolean chosen;
  // chosen
  int ordinal = 0;
  int x_p = 300;
  int y_p = 700;
  int distance = 100;

  Ball(String _colo, int _x, int _y) {
    x = _x;
    y = _y;
    switch (_colo) {
    case "red":
      colo = color(255, 0, 0);
      break;
    case "green":
      colo = color(0, 255, 0);
      break;
    case "blue":
      colo = color(0, 0, 255);
      break;
    }
    chosen = false;
  }

  Ball(Ball a, boolean _chosen, int ord) {
    x = a.x;
    y = a.y;
    colo = a.colo;
    chosen = _chosen;
    ordinal = ord;
  }
  void setXY(int _x, int _y) {
    chosen = false;
    x = _x;
    y = _y;
    r = 20;
  }
  void draw() {
    if (chosen) {
      stroke(0);
      strokeWeight(5);
      fill(colo);
      ellipseMode(CENTER);
      ellipse(x_p + ordinal * distance, y_p, r * 2, r * 2);
      stroke(255);
      strokeWeight(10);
      deg += dis;
      deg %= (2 * PI);
      arc(x_p + ordinal * distance, y_p, r, r, deg, deg + PI / 2);
    } else {
      stroke(0);
      strokeWeight(5);
      fill(colo);
      ellipseMode(CENTER);
      ellipse(x, y, r * 2, r * 2);
      stroke(255);
      strokeWeight(5);
      deg += dis;
      deg %= (2 * PI);
      arc(x, y, r, r, deg, deg + PI / 2);
    }

  }

  boolean isClicked() {
    return moveOver();
  }

  boolean isHover() {
    return moveOver();
  }

  boolean moveOver() {
    if (chosen) {
      return ((mouseX - (x_p + ordinal * distance)) * (mouseX - (x_p + ordinal * distance)) + (mouseY - y_p) * (mouseY - y_p)) < r * r;

    } else {
      return ((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y)) < r * r;
    }

  }
}
class AnswerBall {
  Ball ball1;
  Ball ball2;
  Ball ball3;
  AnswerBall(Ball b1, Ball b2, Ball b3) {
    this.ball1 = b1;
    this.ball2 = b2;
    this.ball3 = b3;
  }
}

class MainModel11_18 {
  ArrayList < Ball > listBall = new ArrayList < Ball > ();
  ArrayList < Ball > chosenListBall = new ArrayList < Ball > ();
  ArrayList < AnswerBall > ANS = new ArrayList < AnswerBall > ();
  ArrayList < Integer > answerState = new ArrayList < Integer > ();
  int x = 1200;
  int y = 200;
  int segment = 50;
  boolean FINISHED = false;
  void setup() {
    // 5 red balls
    listBall.add(new Ball("red", 200, 230));
    listBall.add(new Ball("red", 300, 230));
    listBall.add(new Ball("red", 200, 330));
    listBall.add(new Ball("red", 300, 330));
    listBall.add(new Ball("red", 300, 430));

    // 5 green balls
    listBall.add(new Ball("green", 500, 230));
    listBall.add(new Ball("green", 500, 330));
    listBall.add(new Ball("green", 600, 230));
    listBall.add(new Ball("green", 600, 330));
    listBall.add(new Ball("green", 600, 430));

    // 3 blue balls
    listBall.add(new Ball("blue", 800, 230));
    listBall.add(new Ball("blue", 800, 330));
    listBall.add(new Ball("blue", 900, 330));
  }

  void draw() {
    for (Ball ball: listBall) {
      ball.draw();
    }
    for (Ball ball: chosenListBall) {
      ball.draw();
    }
    for (int i = 0; i < ANS.size(); i++) {
      AnswerBall a = ANS.get(i);
      a.ball1.setXY(x, y + segment * i);
      a.ball1.draw();
      a.ball2.setXY(x + segment, y + segment * i);
      a.ball2.draw();
      a.ball3.setXY(x + segment * 2, y + segment * i);
      a.ball3.draw();
    }
  }

  void mousePressed() {

    for (int i = (int)(listBall.size()) - 1; i >= 0; --i) {
      Ball ball = listBall.get(i);
      if (ball.isClicked()) {
        if (chosenListBall.size() < 3) {
          chosenListBall.add(new Ball(listBall.get(i), true, chosenListBall.size()));
          listBall.remove(i);
        }
      }
    }
    for (int i = (int)(chosenListBall.size()) - 1; i >= 0; --i) {
      Ball ball = chosenListBall.get(i);
      if (ball.isClicked()) {
        listBall.add(new Ball(chosenListBall.get(i), false, chosenListBall.size()));
        chosenListBall.remove(i);
      }
    }
    // for (int i = 0; i < chosenListBall.size(); ++i) {
    //   Ball ball = listBall.get(i);
    //   ball.ordinal = i;
    // }

    int curID = 0;
      for (Ball ball : chosenListBall) {
        ball.ordinal = curID++;
      }

    if (chosenListBall.size() == 3) {
      int red = 0;
      int blue = 0;
      int green = 0;
      for (int i = 0; i < 3; ++i) {
        Ball ball = chosenListBall.get(i);
        if (ball.colo == color(255, 0, 0)) {
          ++red;
        } else if (ball.colo == color(0, 255, 0)) {
          ++blue;
        } else {
          ++green;
        }
      }
      boolean ok = true;
      for (int i = 0; i < answerState.size(); i += 3) {
        if (answerState.get(i) == red && answerState.get(i + 1) == blue && answerState.get(i + 2) == green) {
          ok = false;
          break;
        }
      }
      if (ok) {
        answerState.add(red);
        answerState.add(blue);
        answerState.add(green);
        for (Ball ball: chosenListBall) {
          listBall.add(new Ball(ball, false, chosenListBall.size()));
        }
        ANS.add(new AnswerBall(chosenListBall.get(0), chosenListBall.get(1), chosenListBall.get(2)));
        chosenListBall.clear();
      }
    }
    if (answerState.size() == 30) {
      FINISHED = true;
    }

  }
  void reset() {
    answerState.clear();
    ANS.clear();
    listBall.clear();
    chosenListBall.clear();
    FINISHED = false;
    setup();
  }
}
class Question11_18 extends Question {
  MainModel11_18 model = new MainModel11_18();

  void setup() {
    super.setup();
    String quizText = "Câu 11_18: Có 5 quả bóng màu đỏ, 5 quả bóng màu xanh dương, 3 quả bóng màu xanh lá cây. Nelson bị bịt mắt trước khi chọn 3 quả bóng từ trong túi. Hãy liệt kê các trường hợp có thể xảy ra với màu sắc của những quả bóng mà Nelson lấy ra.";
    quiz = new QuizText(quizText);
    model.setup();
  }

  void draw() {
    super.draw();
    model.draw();
  }

  void mousePressed() {
    super.mousePressed();
    model.mousePressed();
    if (model.FINISHED) {
      finish(true);
    }
  }
  void reset() {
    super.reset();
    model.reset();
  }
}