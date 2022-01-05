class RectButton {
  color BUTTON_COLOR_DEFAULT = #0373fc;
  color BUTTON_COLOR_OVER = #0053b8;
  color BUTTON_TEXT_COLOR = #ffffff;
  float BUTTON_RADIO = 20;
  float x, y, b_text_size, b_margin_width, b_margin_height;
  float b_width, b_height;
  
  String b_text;
  RectButton (String _text, float _x, float _y) {
    this(_text, _x, _y, 15.0, 10.0, 10.0);
  }
  
  RectButton (String _text, float _x, float _y, float _text_size) {
    this(_text, _x, _y, _text_size, _text_size*0.8, _text_size*0.8);
  }
  
  RectButton (String _text, float _x, float _y, float _text_size, float _margin_width, float _margin_height) {
    x = _x;
    y = _y;
    b_text = _text;
    b_text_size = _text_size;
    b_margin_width = _margin_width;
    b_margin_height = _margin_height;
  }
  
  void draw() {
    textSize(b_text_size);
    textAlign(CENTER); 
    float text_width = textWidth(b_text);
    float rect_x = x - text_width/2 - b_margin_width;
    float rect_y = y - textAscent() - b_margin_height;
    
    b_width = text_width + b_margin_width*2;
    b_height = textAscent() + textDescent() + b_margin_height*2;
    stroke(0,0,0,0);
    if(moveOver())
      fill(BUTTON_COLOR_OVER);
    else
      fill(BUTTON_COLOR_DEFAULT);
    rect(rect_x, rect_y, b_width, b_height, BUTTON_RADIO);
    
    fill(BUTTON_TEXT_COLOR);    
    text(b_text, x, y);
    
  }
  
  boolean clicked() {
    if(mousePressed && (mouseButton == LEFT)) {
      return moveOver();
    }
    return false;
  }
  
  boolean moveOver() {
    if( abs(mouseX - x) <= b_width/2 && abs(mouseY - y) <= b_height/2 )
      return true;
    return false;
  }
}

class Paragraph {
  color BUTTON_TEXT_COLOR = #000000;
  
  String b_text;
  float text_size;
  float x, y, b_width, b_height;
  Paragraph (String _text, float _x, float _y, float _text_size, float _width) {
    b_text = _text;
    x = _x;
    y = _y;
    text_size = _text_size;
    b_width = _width;
    b_height = 10000000;
  }
  
  void draw() {
    textSize(text_size);
    textAlign(LEFT);
    fill(BUTTON_TEXT_COLOR); 
    text(b_text, x, y, b_width, b_height);
  }
}

class QuizText extends Paragraph {
  color DEFAULT_COLOR = #cc8854;
  float MARGIN = 20;
  float RADIO = 40;
  
  QuizText (String _text) {
    super(_text, 150, 50, 24, 1000);
  }
  void draw() {
    fill(DEFAULT_COLOR);
    textSize(text_size);
    float _height = ceil(textWidth(b_text)/b_width) * (textAscent() + textDescent()) * 1.25;
    rect(x - MARGIN, y - MARGIN, b_width + MARGIN * 2, _height + MARGIN * 2, RADIO);
    super.draw();
  }
}

class AnswerChoicesButton {
  color BUTTON_COLOR_DEFAULT = #0373fc;
  color BUTTON_COLOR_OVER = #0053b8;
  color BUTTON_TEXT_COLOR = #ffffff;
  color BUTTON_COLOR_CORRECT = #c5d86d;
  color BUTTON_COLOR_WRONG = #d7263d;
  
  float BUTTON_RADIO = 20;
  float x, y, b_text_size;
  float b_width, b_height;
  
  String b_text;
  boolean is_answered = false;
  boolean is_correct_answer;
  
  AnswerChoicesButton (String _text, boolean is_correct, float _x, float _y, float _text_size, float _width, float _height) {
    x = _x;
    y = _y;
    b_text = _text;
    b_text_size = _text_size;
    b_width = _width;
    b_height = _height;
    is_correct_answer = is_correct;
  }
  
  void draw() {
    float rect_x = x - b_width/2;
    float rect_y = y - b_height/2;
    
    stroke(0,0,0,0);
    if(is_answered) {
      if(is_correct_answer)
        fill(BUTTON_COLOR_CORRECT);
      else
        fill(BUTTON_COLOR_WRONG);
    } else {
      if(moveOver())
        fill(BUTTON_COLOR_OVER);
      else
        fill(BUTTON_COLOR_DEFAULT);
    }
    rect(x, y, b_width, b_height, BUTTON_RADIO);
    
    textSize(b_text_size);
    textAlign(CENTER, CENTER);
    fill(BUTTON_TEXT_COLOR);    
    text(b_text, x, y, b_width, b_height);
  }
  
  boolean clicked() {
    if(is_answered)
      return false;
    if(mousePressed && (mouseButton == LEFT)) {
      return moveOver();
    }
    return false;
  }
  
  boolean moveOver() {
    if( mouseX >= x && mouseX <= x+b_width &&
    mouseY >= y && mouseY <= y+b_height )
      return true;
    return false;
  }
}