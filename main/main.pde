//import processing.sound.*;

String currentPage = "menu";

Menu menu = new Menu();
ArrayList<Question> question = new ArrayList<Question>();

PImage questionBG, congratIMG, tryAgainIMG, starIMG;

void setup() {
  size(1366, 768);
  questionBG = loadImage("../data/img/questionBG.jpg");
  congratIMG = loadImage("../data/img/congratBG.png");
  tryAgainIMG = loadImage("../data/img/tryAgainBG.png");
  starIMG = loadImage("../data/img/star.png");
  menu.setup();
  
  question.add(new Question11_1());
  question.add(new Question11_2());
  question.add(new Question11_3());
  question.add(new Question11_4());
  question.add(new Question11_5());
  question.add(new Question11_6());
  question.add(new Question11_7());
  question.add(new Question11_8());
  question.add(new Question11_9());
  question.add(new Question11_10());
  question.add(new Question11_11());
  question.add(new Question11_12());
  question.add(new Question11_13());
  question.add(new Question11_14());
  question.add(new Question11_15());
  question.add(new Question11_16());
  question.add(new Question11_17());
  question.add(new Question11_18());
  question.add(new Question12_1());
  question.add(new Question12_2());
  question.add(new Question12_3());
  question.add(new Question12_4());
  question.add(new Question12_5());
  question.add(new Question12_6());
  question.add(new Question12_7());
  question.add(new Question12_8());
  question.add(new Question12_9());
  question.add(new Question12_10());
  question.add(new Question12_11());
  question.add(new Question12_12());
  question.add(new Question12_13());
  question.add(new Question12_14());
  question.add(new Question12_15());
  question.add(new Question12_16());
  question.add(new Question12_17());
  question.add(new Question12_18());
  question.add(new Question12_19());
  question.add(new Question12_20());
  question.add(new Question12_21());
  question.add(new Question12_22());

  for (Question q : question){
    q.setup();
  }
  
  //SoundFile soundFile = new SoundFile(this, "../data/music/bgMusic.mp3");
  //soundFile.loop();
}

void draw() {
  background(255);
  switch(currentPage.trim()) {
    case "menu":
      menu.draw();
      break;
    case "Quiz 11.1":
      question.get(0)._draw();
      break;
    case "Quiz 11.2":
      question.get(1)._draw();
      break;
    case "Quiz 11.3":
      question.get(2)._draw();
      break;
    case "Quiz 11.4":
      question.get(3)._draw();
      break;
    case "Quiz 11.5":
      question.get(4)._draw();
      break;
    case "Quiz 11.6":
      question.get(5)._draw();
      break;
    case "Quiz 11.7":
      question.get(6)._draw();
      break;
    case "Quiz 11.8":
      question.get(7)._draw();
      break;
    case "Quiz 11.9":
      question.get(8)._draw();
      break;
    case "Quiz 11.10":
      question.get(9)._draw();
      break;
    case "Quiz 11.11":
      question.get(10)._draw();
      break;
    case "Quiz 11.12":
      question.get(11)._draw();
      break;
    case "Quiz 11.13":
      question.get(12)._draw();
      break;
    case "Quiz 11.14":
      question.get(13)._draw();
      break;
    case "Quiz 11.15":
      question.get(14)._draw();
      break;
    case "Quiz 11.16":
      question.get(15)._draw();
      break;
    case "Quiz 11.17":
      question.get(16)._draw();
      break;
    case "Quiz 11.18":
      question.get(17)._draw();
      break;
    case "Quiz 12.1":
      question.get(18)._draw();
      break;
    case "Quiz 12.2":
      question.get(19)._draw();
      break;
    case "Quiz 12.3":
      question.get(20)._draw();
      break;
    case "Quiz 12.4":
      question.get(21)._draw();
      break;
    case "Quiz 12.5":
      question.get(22)._draw();
      break;
    case "Quiz 12.6":
      question.get(23)._draw();
      break;
    case "Quiz 12.7":
      question.get(24)._draw();
      break;
    case "Quiz 12.8":
      question.get(25)._draw();
      break;
    case "Quiz 12.9":
      question.get(26)._draw();
      break;
    case "Quiz 12.10":
      question.get(27)._draw();
      break;
    case "Quiz 12.11":
      question.get(28)._draw();
      break;
    case "Quiz 12.12":
      question.get(29)._draw();
      break;
    case "Quiz 12.13":
      question.get(30)._draw();
      break;
    case "Quiz 12.14":
      question.get(31)._draw();
      break;
    case "Quiz 12.15":
      question.get(32)._draw();
      break;
    case "Quiz 12.16":
      question.get(33)._draw();
      break;
    case "Quiz 12.17":
      question.get(34)._draw();
      break;
    case "Quiz 12.18":
      question.get(35)._draw();
      break;
    case "Quiz 12.19":
      question.get(36)._draw();
      break;
    case "Quiz 12.20":
      question.get(37)._draw();
      break;
    case "Quiz 12.21":
      question.get(38)._draw();
      break;
    case "Quiz 12.22":
      question.get(39)._draw();
      break;
  }
}

void mousePressed() {
  switch(currentPage.trim()) {
    case "menu":
      menu.mousePressed();
      break;
    case "Quiz 11.1":
      question.get(0)._mousePressed();
      break;
    case "Quiz 11.2":
      question.get(1)._mousePressed();
      break;
    case "Quiz 11.3":
      question.get(2)._mousePressed();
      break;
    case "Quiz 11.4":
      question.get(3)._mousePressed();
      break;
    case "Quiz 11.5":
      question.get(4)._mousePressed();
      break;
    case "Quiz 11.6":
      question.get(5)._mousePressed();
      break;
    case "Quiz 11.7":
      question.get(6)._mousePressed();
      break;
    case "Quiz 11.8":
      question.get(7)._mousePressed();
      break;
    case "Quiz 11.9":
      question.get(8)._mousePressed();
      break;
    case "Quiz 11.10":
      question.get(9)._mousePressed();
      break;
    case "Quiz 11.11":
      question.get(10)._mousePressed();
      break;
    case "Quiz 11.12":
      question.get(11)._mousePressed();
      break;
    case "Quiz 11.13":
      question.get(12)._mousePressed();
      break;
    case "Quiz 11.14":
      question.get(13)._mousePressed();
      break;
    case "Quiz 11.15":
      question.get(14)._mousePressed();
      break;
    case "Quiz 11.16":
      question.get(15)._mousePressed();
      break;
    case "Quiz 11.17":
      question.get(16)._mousePressed();
      break;
    case "Quiz 11.18":
      question.get(17)._mousePressed();
      break;
    case "Quiz 12.1":
      question.get(18)._mousePressed();
      break;
    case "Quiz 12.2":
      question.get(19)._mousePressed();
      break;
    case "Quiz 12.3":
      question.get(20)._mousePressed();
      break;
    case "Quiz 12.4":
      question.get(21)._mousePressed();
      break;
    case "Quiz 12.5":
      question.get(22)._mousePressed();
      break;
    case "Quiz 12.6":
      question.get(23)._mousePressed();
      break;
    case "Quiz 12.7":
      question.get(24)._mousePressed();
      break;
    case "Quiz 12.8":
      question.get(25)._mousePressed();
      break;
    case "Quiz 12.9":
      question.get(26)._mousePressed();
      break;
    case "Quiz 12.10":
      question.get(27)._mousePressed();
      break;
    case "Quiz 12.11":
      question.get(28)._mousePressed();
      break;
    case "Quiz 12.12":
      question.get(29)._mousePressed();
      break;
    case "Quiz 12.13":
      question.get(30)._mousePressed();
      break;
    case "Quiz 12.14":
      question.get(31)._mousePressed();
      break;
    case "Quiz 12.15":
      question.get(32)._mousePressed();
      break;
    case "Quiz 12.16":
      question.get(33)._mousePressed();
      break;
    case "Quiz 12.17":
      question.get(34)._mousePressed();
      break;
    case "Quiz 12.18":
      question.get(35)._mousePressed();
      break;
    case "Quiz 12.19":
      question.get(36)._mousePressed();
      break;
    case "Quiz 12.20":
      question.get(37)._mousePressed();
      break;
    case "Quiz 12.21":
      question.get(38)._mousePressed();
      break;
    case "Quiz 12.22":
      question.get(39)._mousePressed();
      break;
  }
}
