class Mayor {
  float x, y, size;
  ChooseButton[] button = new ChooseButton[9];
  boolean is_display = false;
  boolean is_static;

  Mayor(float _x, float _y, float _size, boolean _static) {
    x = _x;
    y = _y;
    size = _size;
    is_static = _static;
  }

  void setup() {
    button[0] = new ChooseButton("M", x, y + size * 2, size*0.7, is_static);
    button[1] = new ChooseButton("A", x + size * 1.5, y + size, size*0.7, is_static);
    button[2] = new ChooseButton("A", x + size * 1.5, y + size * 3, size*0.7, is_static);
    button[3] = new ChooseButton("Y", x + size * 3, y , size*0.7, is_static);
    button[4] = new ChooseButton("Y", x + size * 3, y + size * 2, size*0.7, is_static);
    button[5] = new ChooseButton("Y", x + size * 3, y + size * 4, size*0.7, is_static);
    button[6] = new ChooseButton("O", x + size * 4.5, y + size * 1, size*0.7, is_static);
    button[7] = new ChooseButton("O", x + size * 4.5, y + size * 3, size*0.7, is_static);
    button[8] = new ChooseButton("R", x + size * 6, y + size * 2, size*0.7, is_static);
  }

  void draw() {
    if(is_display)
      for(ChooseButton b : button) {
        b.draw();
      }
  }

  void setClick(String param) {
    if( param.length()!= 9) return;
    for(int i=0;i<9;i++) {
      if(param.charAt(i)=='1')
        button[i].is_chose = true;
    }
  }

  String getClick() {
    String ans = "";
    for(int i=0;i<9;i++) {
      if(button[i].is_chose)
        ans += "1";
      else
        ans += "0";
    }
    return ans;
  }

}

class Question11_10 extends Question {

  Mayor mayorMain = new Mayor(280, 280, 70, false);
  Mayor[] mayorAns = new Mayor[12];
  RectButton check = new RectButton("Check", 700, 200, 25);
  String [] ans = {"110100101", "110100011", "110010101", "110010011", "110001101", "110001011",
  "101100101", "101100011", "101010101", "101010011", "101001101", "101001011"};
  void setup() {
    super.setup();
    String quizText = "Có bao nhiêu cách để viết từ MAYOR từ hình dưới đây";
    quiz = new QuizText(quizText);
    mayorMain.setup();
    mayorMain.is_display = true;
    mayorMain.is_static = false;

    for (int i = 0; i<12;i++) {
      mayorAns[i] = new Mayor(800 + 170*(i/4), 150 + 140 *(i%4), 20, true);
      mayorAns[i].setup();
      mayorAns[i].setClick(ans[i]);
    }
  }
  
  void draw() {
    super.draw();
    check.draw();
    mayorMain.draw();
    for(Mayor mayor: mayorAns) {
      mayor.draw();
    }
  }

  void reset() {
    super.reset();
    for(ChooseButton b : mayorMain.button) {
      b.is_chose = false;
    }
    for(Mayor m : mayorAns) {
      m.is_display = false;
    }
  }
  
  void mousePressed() {
    super.mousePressed();
    for (ChooseButton b : mayorMain.button) {
      if(b.clicked()) {
        b.is_chose = !b.is_chose;
      }
    }
    if(check.clicked()) {
      String s =mayorMain.getClick();
      int cnt = 0;
      for(Mayor m : mayorAns) {
        if(s.equals(m.getClick())) {
          m.is_display = true;
        }
        if(m.is_display)
          cnt++;
      }
        if(cnt == 12)
          finish(true);
    }
  }
}
