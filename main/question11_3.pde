class TextBox {
  int x, y, w, h;
  int fontSize = 35;
  color COLOR_OVER = #d6cece;
  color COLOR = #ffffff;
  int clickState = 0;
  String text = "";
  TextBox(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  TextBox(int x, int y, int w, int h, int fontSize) {
    this(x, y, w, h);
    this.fontSize = fontSize;
  }

  String getText() {
    return this.text;
  }
  
  void draw() {
    stroke(0);
    if(clickState == 1)
      fill(COLOR_OVER);
    else 
      fill(COLOR);
    rect(x, y, w, h, 15);
    fill(0);
    textSize(fontSize);
    text(text, x + 10, y + 40);
  }
  void handle_clicked() {
    if(mousePressed && (mouseButton == LEFT) && moveOver()) {
      clickState = 1;
    } else {
      clickState = 0;
    }
  }
  boolean moveOver() {
    if(mouseX > x + 2 && mouseX < x + w - 2 && mouseY > y + 2 && mouseY < y + h - 2)
      return true;
    return false;
  }
  void handle_keyPressed() {
    if (clickState == 1) {
      if (key == BACKSPACE) {
        if (text.length() > 0) {
          text = text.substring(0, text.length()-1);
        }
      } else if (textWidth(text+key) < width) {
        text = text + key;
      }
    }
  }
}
class Question11_3 extends Question {
  //state 0 : doing
  //state 1 : check result
  //state 2 : show result
  int state = 0;
  RectButton checkResult = new RectButton("Kiểm tra kết quả", 700, 580, 25);
  RectButton showResult = new RectButton("Xem hướng dẫn", 950, 580, 25);
  TextBox soThuNhat = new TextBox(540, 300, 270, 60);
  TextBox soThuHai = new TextBox(540, 375, 270, 60);


  void state_0_draw() {
    soThuNhat.draw();
    soThuHai.draw();
    fill(0);
    textSize(35);
    text("Nhập số thứ nhất", 250, 340);
    text("Nhập số thứ hai", 250, 425);
    checkResult.draw();
    showResult.draw();
  }
  void state_0_keyPressed() {
    if (key == ENTER) {
      state = 1;
    }
    soThuNhat.handle_keyPressed();
    soThuHai.handle_keyPressed();
  }
  void state_0_mousePressed() {
    if (checkResult.clicked()) {
      println(soThuNhat.getText());
      println(soThuHai.getText());
    }
    soThuNhat.handle_clicked();
    soThuHai.handle_clicked();
    

  }

  void setup() {
    super.setup();
    String quizText = "Tích của hai số là 36. Tổng của hai số là 15. Hỏi đó là số nào?";
    quiz = new QuizText(quizText);
  }
  
  void draw() {
    super.draw();
    switch (state) {
      case 0:
        state_0_draw();
        break;
    }
  }
  
  void mousePressed() {
    super.mousePressed();
    switch (state) {
      case 0:
        state_0_mousePressed();
        break;
    }
  }

  void keyPressed() {
    switch (state) {
      case 0:
        state_0_keyPressed();
        break;
    }
  }
}
