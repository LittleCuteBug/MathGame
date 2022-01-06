class CircleButton {
  color BUTTON_COLOR_DEFAULT = #0373fc;
  color BUTTON_COLOR_OVER = #0053b8;
  color BUTTON_COLOR_CHOOSE = #c5d86d;
  color BUTTON_COLOR_CHOOSE_OVER = #909e4f;

  float x, y, radios;
  boolean is_chose = false;
  boolean is_static = false;

  CircleButton(float _x, float _y, float _radios, boolean _is_static) {
    x = _x;
    y = _y;
    radios = _radios;
    is_static = _is_static;
  }

  void draw() {
    stroke(0);
    strokeWeight(0);
    if(moveOver() && !is_static)
      if(is_chose)
        fill(BUTTON_COLOR_CHOOSE_OVER);
      else  
        fill(BUTTON_COLOR_OVER);
    else
      if(is_chose)
        fill(BUTTON_COLOR_CHOOSE);
      else 
        fill(BUTTON_COLOR_DEFAULT);
    if(!is_static || is_chose)    
      circle(x,y,radios*2);
  }

  boolean clicked() {
    if(mousePressed && (mouseButton == LEFT)) {
      return moveOver();
    }
    return false;
  }

  boolean moveOver() {
    if((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y) <= radios * radios)
          return true;
    return false;
  }
}

class Q11_12 {
  float x, y, size;
  CircleButton[] button = new CircleButton[6];
  boolean is_display = false;
  boolean is_static;

  Q11_12(float _x, float _y, float _size, boolean _static) {
    x = _x;
    y = _y;
    size = _size;
    is_static = _static;
  }

  void setup() {
    float scale = 0.08;
    button[0] = new CircleButton(x, y, size*scale, is_static);
    button[1] = new CircleButton(x + size, y, size*scale, is_static);
    button[2] = new CircleButton(x + size * 2, y, size*scale, is_static);
    button[3] = new CircleButton(x, y + size, size*scale, is_static);
    button[4] = new CircleButton(x + size, y + size, size*scale, is_static);
    button[5] = new CircleButton(x + size * 2, y + size, size*scale, is_static);
  }

  void draw() {
    if(is_display) {
      strokeWeight(size*0.05);
      stroke(#d7263d);
      for(CircleButton b1 : button) {
        for(CircleButton b2 : button) {
          if(!(b1.x == b2.x && b1.y == b2.y) && b1.is_chose && b2.is_chose) {
            line(b1.x, b1.y, b2.x, b2.y);
          }
        }
      }
      
      for(CircleButton b : button) {
        b.draw();
      }
    }
      

  }

  void setClick(String param) {
    if( param.length()!= 6) return;
    for(int i=0;i<6;i++) {
      if(param.charAt(i)=='1')
        button[i].is_chose = true;
    }
  }

  String getClick() {
    String ans = "";
    for(int i=0;i<6;i++) {
      if(button[i].is_chose)
        ans += "1";
      else
        ans += "0";
    }
    return ans;
  }
}

class Question11_12 extends Question {
  
  Q11_12 q11_12 = new Q11_12(300, 350, 200, false);
  Q11_12[] q11_12Ans = new Q11_12[18];
  String [] ans = { 
  "100110", "100101", "100011", 
  "010110", "010101", "010011", 
  "001110", "001101", "001011",
  "110100", "101100", "011100", 
  "110010", "101010", "011010", 
  "110001", "101001", "011001"
  };

  void setup() {
    super.setup();
    String quizText = "Em có thể vẽ được bao nhiêu tam giác khi sử dụng ba dấu ba chấm bất kì dưới đây làm đỉnh (góc)? Gợi ý: Click chọn mỗi 3 điểm để có 1 tam giác hoàn chỉnh.";
    quiz = new QuizText(quizText);
    q11_12.setup();
    q11_12.is_display = true;

     for (int i = 0; i<18;i++) {
      q11_12Ans[i] = new Q11_12(900 + 140*(i%3), 160 + 90 *(i/3), 60, true);
      q11_12Ans[i].setup();
      q11_12Ans[i].setClick(ans[i]);
    }
  }
  
  void draw() {
    super.draw();
    q11_12.draw();
    for(Q11_12 q : q11_12Ans) {
      q.draw();
    }
  }

  void reset() {
    super.reset();
    for(CircleButton b : q11_12.button) {
      b.is_chose = false;
    }
    for(Q11_12 q : q11_12Ans) {
      q.is_display = false;
    }
  }
  
  void mousePressed() {
    super.mousePressed();
    for (CircleButton b : q11_12.button) {
      if(b.clicked()) {
        if(b.is_chose)
          b.is_chose = false;
        else {
          int cnt = 0;
          int cntY = 0;
          for (CircleButton _b : q11_12.button) {
            if(_b.is_chose) {
              if(_b.y == b.y)
                cntY++;
              cnt++;
            }
          }
          if(cnt < 3 && cntY < 2) {
            b.is_chose = true;
          }
          if(cnt == 2) {
            String s = q11_12.getClick();
            int cntAns = 0;
            for(Q11_12 q : q11_12Ans) {
              if(s.equals(q.getClick())) {
                q.is_display = true;
              }
              if(q.is_display)
                cntAns++;
            }
            if(cntAns == 18)
              finish(true);
          }
        }
      }
    }
  }
}
