class Question12_10 extends Question {
  String answer[] = new String[1];
  int state = 0;
  int big = 80;
  int small = 20;
  int pos = 1366;
  int curSum = big + small;
  int rate = 0;
  int curColor = 0;
  
  
  int posXBox = 300;
  int bigBoxLength = 720;
  int smallBoxLength = bigBoxLength / 4;
  int boxHeight = 50;
  int posYAnswerBox = 500;
  int posYAnswerBoxTitle = 490;
  int posYAnswerBoxText = 535;
  
  boolean sol = false;
  void setup() {
    super.setup();
    String quizText = "Câu 12_10: Alison có 20 đô-la. Anna có nhiều gấp 4 lần số tiền của Alison. Hỏi Anna có bao nhiêu đô-la?";
    quiz = new QuizText(quizText);
    answer[0] = "";
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
    //rect(500,posYAnswerBox,150,50); /// answerS box 
    stroke(0);
    fill(255, 198, 8);
    rect(800,posYAnswerBox,150,50); /// submit box 
    fill(0, 255, 0);
    rect(1000,posYAnswerBox,200,50); /// sol box 
    
    
    fill(0);
    text("Anna có", 300, posYAnswerBoxTitle);
    text(answer[0], 305, posYAnswerBoxText);
    text("Trả lời", 830, posYAnswerBoxText);
    fill(0);
    text("Hướng dẫn", 1030, posYAnswerBoxText);
    
    
    fill(255, 0, 0);
    rect(posXBox + 0 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 1
	fill(233, 250, 5);
    rect(posXBox + 1 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 2
	fill(0, 0, 255);
    rect(posXBox + 2 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 3
	fill(100, 100, 100);
    rect(posXBox + 3 * smallBoxLength,225,smallBoxLength,boxHeight); /// Bignumber box 4
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
      text("Anna có: " + small + " * 4 = " + big + ".", 180, 420);
    }
    if (curColor == 255) {
      curSum = big * 2;
    }
    fill(50);
    
    
    //textSize(150);
    //text("}", 1000, 320);
 
    textSize(40);
    fill(0);
    text("Anna", 180, 270);
    text("Alison", 180, 345);
    text(small, posXBox + 75, 340);
    //text(curSum, 1050, 290);
  }
  
  void mousePressed() {
    super.mousePressed();
    if (mouseX >= 300 && mouseX <= 450 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      state = 0;
    }
    if (mouseX >= 800 && mouseX <= 950 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      if (answer[0].length() > 0 && Integer.valueOf(answer[0]) == big) {
          
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
    answer[0] = "";
    sol = false;
    rate = 0;
    curColor = 0;
	super.reset();
  }
}