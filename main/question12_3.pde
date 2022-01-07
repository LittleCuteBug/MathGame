class Question12_3 extends Question {
  String answer[] = new String[2];
  int state = 0;
  int big = 45;
  int small = 15;
  int pos = 1366;
  int curSum = big + small;
  int rate = 0;
  int curColor = 0;
  
  
  int posXBox = 300;
  int bigBoxLength = 720;
  int smallBoxLength = bigBoxLength / 3;
  int boxHeight = 50;
  int posYAnswerBox = 500;
  int posYAnswerBoxTitle = 490;
  int posYAnswerBoxText = 535;
  
  boolean sol = false;
  void setup() {
    super.setup();
    String quizText = "Câu 12_3: Natalie có 15 quân bài. Số quân bài của Anne nhiều gấp 3 lần số quân bài của Natalie. Hỏi Anne có bao nhiêu quân bài?";
    quiz = new QuizText(quizText);
    answer[0] = answer[1] = "";
    strokeWeight(3);
  }
  
  void draw() {
    super.draw();
    
    textSize(32);
    fill(50);
    stroke(0);
    if (state == 0) {
      stroke(255, 0, 0); 
    }
    fill(180);
    rect(300,posYAnswerBox,150,50); /// answerB box 
    stroke(0);
    if (state == 1) {
      stroke(255, 0, 0); 
    }
    fill(180);
    rect(500,posYAnswerBox,150,50); /// answerS box 
    stroke(0);
    fill(255, 198, 8);
    rect(800,posYAnswerBox,150,50); /// submit box 
    fill(0, 255, 0);
    rect(1000,posYAnswerBox,200,50); /// sol box 
    
    
    fill(0);
    text("Số lớn là", 300, posYAnswerBoxTitle);
    text(answer[0], 305, posYAnswerBoxText);
    text("Số bé là", 500, posYAnswerBoxTitle);
    text(answer[1], 505, posYAnswerBoxText);
    text("Trả lời", 830, posYAnswerBoxText);
    fill(0);
    text("Hướng dẫn", 1030, posYAnswerBoxText);
    
    
    fill(255, 0, 0);
    rect(posXBox + 0 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 1
	fill(233, 250, 5);
    rect(posXBox + 1 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 2
	fill(0, 0, 255);
    rect(posXBox + 2 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 3
	fill(0, 255, 0);
    rect(posXBox,300,smallBoxLength,boxHeight); /// Smallnumber box
   // fill(255, 0, 0);
    //rect(posXBox + smallBoxLength,225,bigBoxLength - smallBoxLength,boxHeight); /// Different box
    if (sol) {
      curColor += rate;
      curColor = min(curColor, 255);
      fill(curColor, 0, 0);
      //rect(posXBox + smallBoxLength,300,bigBoxLength - smallBoxLength,boxHeight);
      fill(255 - curColor);
      //text(big, posXBox + bigBoxLength + 20,225 + 35); /// Bignumber box
      //text(big, posXBox + bigBoxLength + 20,300 + 35); /// Smallnumber box
      text("Số lớn là: " + small + " * 3 = " + big + ".", 180, 420);
    }
    if (curColor == 255) {
      curSum = big * 2;
    }
    fill(50);
    
    
    //textSize(150);
    //text("}", 1000, 320);
 
    textSize(40);
    fill(0);
    text("Số lớn", 180, 270);
    text("Số bé", 180, 345);
    text(small, posXBox + 95, 340);
    //text(curSum, 1050, 290);
  }
  
  void mousePressed() {
    super.mousePressed();
    if (mouseX >= 300 && mouseX <= 450 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      state = 0;
    }
    if (mouseX >= 500 && mouseX <= 650 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      state = 1;
    }
    if (mouseX >= 800 && mouseX <= 950 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      if (answer[0].length() > 0 && answer[1].length() > 0 && Integer.valueOf(answer[0]) == big && Integer.valueOf(answer[1]) == small) {
          
		  finish(true);
      } else {
		  finish(false);
         
      }
    }
    if (mouseX >= 1000 && mouseX <= 1200 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      sol = true;
      rate = 3;
    }
  }
  void keyPressed() {
    if (key == BACKSPACE) {
      if (answer[state].length() > 0) {
        answer[state] = answer[state].substring(0, answer[state].length()-1);
      }
    } else if (textWidth(answer[state]+key) < 150) {
      if (key >= '0' && key <= '9') {
        answer[state] = answer[state] + key;
      }
    }
  }
  void reset() {
    answer[0] = answer[1] = "";
    sol = false;
    curSum = 110;
    rate = 0;
    curColor = 0;
	super.reset();
  }
}