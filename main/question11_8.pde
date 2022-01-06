class Question11_8 extends Question {
  //state 0 : doing
  //state 1 : check result
  //state 2 : show result
  int state = 0;
  RectButton checkResult = new RectButton("Kiểm tra kết quả", 700, 580, 25);
  RectButton tryAgain = new RectButton("Làm lại", 700, 580, 25);
  RectButton showResult = new RectButton("Xem hướng dẫn", 950, 580, 25);
  TextBox soThuNhat = new TextBox(540, 300, 270, 60);
  TextBox soThuHai = new TextBox(540, 375, 270, 60);
  PImage congratIMG = loadImage("../data/img/congratBG.png");
  PImage tryAgainIMG = loadImage("../data/img/tryAgainBG.png");


  void state_0_draw() {
    soThuNhat.draw();
    soThuHai.draw();
    fill(#3464eb);
    textSize(35);
    text("Nhập số thứ nhất", 250, 340);
    text("Nhập số thứ hai", 250, 425);
    checkResult.draw();
    showResult.draw();
  }

  void state_0_keyPressed() {
    soThuNhat.handle_keyPressed();
    soThuHai.handle_keyPressed();
  }
  
  void state_0_mousePressed() {
    if (checkResult.clicked()) {
      state = 1;
    }
    if (showResult.clicked()) {
      state = 2;
    }
    soThuNhat.handle_clicked();
    soThuHai.handle_clicked();
  }


  void state_1_draw() {
    soThuNhat.draw();
    soThuHai.draw();
    fill(#3464eb);
    textSize(35);
    text("Nhập số thứ nhất", 250, 340);
    text("Nhập số thứ hai", 250, 425);
    boolean check = false;
    String val1 = soThuNhat.getText().trim();
    String val2 = soThuHai.getText().trim();
    if ((val1.equals("12") && val2.equals("4")) || (val1.equals("4") && val2.equals("12")))
      check = true;
    fill(#f50010);
    textSize(45);
    tryAgain.draw();
    showResult.draw();
    if (check)
      //image(congratIMG, 0, 0);
      finish(true);
    else
      //image(tryAgainIMG, 0, 0);
      finish(false);
  }
  void reset() {
    super.reset();
    soThuNhat.setText("");
    soThuHai.setText("");
    state = 0;
  }
  void state_1_keyPressed() {
  }
  void state_1_mousePressed() {
    if (tryAgain.clicked()) {
      state = 0;
      soThuNhat.setText("");
      soThuHai.setText("");
    }
    if (showResult.clicked()) {
      state = 2;
    }
  }

  void state_2_draw() {
    fill(#001fba);
    textSize(35);
    text("Bước 1: Tìm các cặp số có tích là 48:", 350, 240);
    fill(#0fbd09);
    text("1 x 48 = 48" , 500, 275);
    text("2 x 24 = 48" , 500, 305);
    text("3 x 16 = 48" , 500, 335);
    text("4 x 12 = 48" , 500, 365);
    text("6 x 8 = 48" , 500, 395);
    fill(#001fba);
    text("Bước 2: Chọn cặp số mà tổng của hai số là 16" , 350, 445);
    text("Ta tìm được hai số là 4 và 12" , 460, 480);
    tryAgain.draw();
  }
  void state_2_keyPressed() {
  }
  void state_2_mousePressed() {
    if (tryAgain.clicked()) {
      state = 0;
      soThuNhat.setText("");
      soThuHai.setText("");
    }
  }


  void setup() {
    super.setup();
    String quizText = "Tích của hai số là 48. Tổng của hai số là 16. Hãy tìm hai số đó?";
    quiz = new QuizText(quizText);
  }
  
  void draw() {
    super.draw();
    switch (state) {
      case 0:
        state_0_draw();
        break;
      case 1:
        state_1_draw();
        break;
      case 2:
        state_2_draw();
        break;
    }
  }
  
  void mousePressed() {
    super.mousePressed();
    switch (state) {
      case 0:
        state_0_mousePressed();
        break;
      case 1:
        state_1_mousePressed();
        break;
      case 2:
        state_2_mousePressed();
        break;
    }
  }

  void keyPressed() {
    switch (state) {
      case 0:
        state_0_keyPressed();
        break;
      case 1:
        state_1_keyPressed();
        break;
      case 2:
        state_2_keyPressed();
        break;
    }
  }
}