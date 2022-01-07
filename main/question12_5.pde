class Question12_5 extends Question {
  String answer[] = new String[3];
  int state = 0;
  int big = 10;
  int small = 6;
  int third = 8;
  int pos = 1366;
  int curSum = big + small + third;
  int rate = 0;
  int curColor = 0;
  
  int posXBox = 300;
  int bigBoxLength = 500;
  int smallBoxLength = 350;
  int boxHeight = 40;
  int posYAnswerBox = 500;
  int posYAnswerBoxTitle = 490;
  int posYAnswerBoxText = 535;
  
  boolean sol = false;
  void setup() {
    super.setup();
    String quizText = "Câu 12_5: Chú Nelson có 24 con gà, ngỗng và vịt trong nông trại. Số vịt nhiều hơn số gà là 4 con. Số ngỗng lại nhiều hơn số gà là 2 con. Hỏi mỗi loại có bao nhiêu con?";
    quiz = new QuizText(quizText);
    answer[0] = answer[1] = answer[2] = "";
    strokeWeight(3);
  }
  
  void draw() {
    super.draw();
    

    textSize(25);
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
	
	if (state == 2) {
		stroke(255, 0, 0); 
	}
	rect(400,posYAnswerBox + 100,150,50); /// answer3 box 
    stroke(0);
    
	fill(255, 198, 8);
    rect(800,posYAnswerBox,150,50); /// submit box 
    fill(0, 255, 0);
    rect(1000,posYAnswerBox,200,50); /// sol box 
    
    
    fill(0);
    text("Số vịt là", 300, posYAnswerBoxTitle);
    text(answer[0], 305, posYAnswerBoxText);
    text("Số gà là", 500, posYAnswerBoxTitle);
    text(answer[1], 505, posYAnswerBoxText);
    text("Trả lời", 840, posYAnswerBoxText);
	text("Số ngỗng là", 400, posYAnswerBoxTitle + 100);
	text(answer[2], 405,  posYAnswerBoxText + 100);
    fill(0);
    text("Hướng dẫn", 1040, posYAnswerBoxText);
    
    
    fill(0, 0, 255);
    rect(posXBox,200,smallBoxLength,boxHeight); /// Bignumber box
    rect(posXBox,250,smallBoxLength,boxHeight); /// Smallnumber box
    rect(posXBox,300,smallBoxLength,boxHeight); /// Thirdnumber box
	
    fill(255, 0, 0);
    rect(posXBox + smallBoxLength,200,bigBoxLength - smallBoxLength,boxHeight); /// Different1 box
	fill(255, 2, 0);
    rect(posXBox + smallBoxLength,300,(bigBoxLength - smallBoxLength) / 2,boxHeight); /// Different3 box
	
	
	fill(0);
	text(big - small, posXBox + smallBoxLength + 70,230);
	text(third - small, posXBox + smallBoxLength + 30,330);
	
	
	stroke(curColor);
	fill(255, curColor, curColor);
    rect(posXBox + smallBoxLength,200,bigBoxLength - smallBoxLength,boxHeight); /// Different1 box
	fill(255, 255, curColor);
    rect(posXBox + smallBoxLength,300,(bigBoxLength - smallBoxLength) / 2,boxHeight); /// Different3 box
	
	
	fill(curColor);
	text(big - small, posXBox + smallBoxLength + 70,230);
	text(third - small, posXBox + smallBoxLength + 30,330);
	
	
	fill(0, 0, 255);
	stroke(0);
    rect(posXBox,200,smallBoxLength,boxHeight); /// Bignumber box
    rect(posXBox,250,smallBoxLength,boxHeight); /// Smallnumber box
    rect(posXBox,300,smallBoxLength,boxHeight); /// Thirdnumber box
	
	
    if (sol) {
      curColor += rate;
      curColor = min(curColor, 255);
      
      fill(255 - curColor);
	  
      text(small, posXBox + smallBoxLength + 20,300 - 70); /// Smallnumber box
      text(small, posXBox + smallBoxLength + 20,300 - 20); /// Smallnumber box
      text(small, posXBox + smallBoxLength + 20,300 + 30); /// Smallnumber box
	  
      text("Số gà là: ("
			+ (big + small + third)
			+ " - " 
			+ (big - small)
			+ " - " 
			+ (third - small)
			+ ") / 3 = "
			+ small 
			+ ". Số vịt là: "
			+ small
			+ " + "
			+ (big - small) 
			+ " = "
			+ big 
			+ ". "
			+ "Số ngỗng là: "
			+ small
			+ " + "
			+ (third - small) 
			+ " = "
			+ third 
			+ ". "
	  , 180, 420);
    }
    if (curColor == 255) {
      curSum = small * 3;
    }
    fill(50);
    
	
    
    textSize(170);
    text("}", 990, 310);
 
    textSize(30);
    fill(curColor);
    text("Số vịt", 150, 230);
	text("Số ngỗng", 150, 330);
	fill(0);
    text("Số gà", 150, 280);
	
	textSize(35);
    text(curSum, 1060, 275);
  }
  
  void mousePressed() {
    super.mousePressed();
    if (mouseX >= 300 && mouseX <= 450 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      state = 0;
    }
    if (mouseX >= 500 && mouseX <= 650 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      state = 1;
    }
	//rect(400,posYAnswerBox + 100,150,50); /// answer3 box 
	if (mouseX >= 400 && mouseX <= 650 && mouseY >= posYAnswerBox + 100 && mouseY <= posYAnswerBox + 150) {
		state = 2;
	}
    if (mouseX >= 800 && mouseX <= 950 && mouseY >= posYAnswerBox && mouseY <= posYAnswerBox + 50) {
      if (answer[0].length() > 0 && answer[1].length() > 0 && Integer.valueOf(answer[0]) == big && Integer.valueOf(answer[1]) == small
			&& answer[2].length() > 0 && Integer.valueOf(answer[2]) == third
			) {
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
    answer[0] = answer[1] = answer[2] = "";
    sol = false;
    curSum = 24;
    rate = 0;
    curColor = 0;
	super.reset();
  }
}
