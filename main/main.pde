//import processing.sound.*;

String currentPage = "menu";

Menu menu = new Menu();
HashMap<String, Question> question = new HashMap<String, Question>();

PImage questionBG, congratIMG, tryAgainIMG, starIMG;

void setup() {
  size(1366, 768);
  questionBG = loadImage("../data/img/questionBG.jpg");
  congratIMG = loadImage("../data/img/congratBG.png");
  tryAgainIMG = loadImage("../data/img/tryAgainBG.png");
  starIMG = loadImage("../data/img/star.png");
  menu.setup();
  
  question.put("Quiz 11.1", new Question11_1());
  question.put("Quiz 11.2", new Question11_2());
  question.put("Quiz 11.3", new Question11_3());
  question.put("Quiz 11.4", new Question11_4());
  question.put("Quiz 11.5", new Question11_5());
  question.put("Quiz 11.6", new Question11_6());
  question.put("Quiz 11.7", new Question11_7());
  question.put("Quiz 11.8", new Question11_8());
  question.put("Quiz 11.9", new Question11_9());
  question.put("Quiz 11.10", new Question11_10());
  question.put("Quiz 11.11", new Question11_11());
  question.put("Quiz 11.12", new Question11_12());
  question.put("Quiz 11.13", new Question11_13());
  question.put("Quiz 11.14", new Question11_14());
  question.put("Quiz 11.15", new Question11_15());
  question.put("Quiz 11.16", new Question11_16());
  question.put("Quiz 11.17", new Question11_17());
  question.put("Quiz 11.18", new Question11_18());
  question.put("Quiz 12.1", new Question12_1());
  question.put("Quiz 12.2", new Question12_2());
  question.put("Quiz 12.3", new Question12_3());
  question.put("Quiz 12.4", new Question12_4());
  question.put("Quiz 12.5", new Question12_5());
  question.put("Quiz 12.6", new Question12_6());
  question.put("Quiz 12.7", new Question12_7());
  question.put("Quiz 12.8", new Question12_8());
  question.put("Quiz 12.9", new Question12_9());
  question.put("Quiz 12.10", new Question12_10());
  question.put("Quiz 12.11", new Question12_11());
  question.put("Quiz 12.12", new Question12_12());
  question.put("Quiz 12.13", new Question12_13());
  question.put("Quiz 12.14", new Question12_14());
  question.put("Quiz 12.15", new Question12_15());
  question.put("Quiz 12.16", new Question12_16());
  question.put("Quiz 12.17", new Question12_17());
  question.put("Quiz 12.18", new Question12_18());
  question.put("Quiz 12.19", new Question12_19());
  question.put("Quiz 12.20", new Question12_20());
  question.put("Quiz 12.21", new Question12_21());
  question.put("Quiz 12.22", new Question12_22());

  for (Question q : question.values()){
    q.setup();
  }
  
  //SoundFile soundFile = new SoundFile(this, "../data/music/bgMusic.mp3");
  //soundFile.loop();
}

void draw() {
  background(255);

  if(currentPage == "menu") {
    menu.draw();
  } else {
    if(currentPage.substring(0,5).equals("Quiz "))
      question.get(currentPage)._draw();
  }
}

void mousePressed() {
  if(currentPage == "menu") {
    menu.mousePressed();
  } else {
    if(currentPage.substring(0,5).equals("Quiz "))
      question.get(currentPage)._mousePressed();
  }
}

void mouseDragged() {
  if(currentPage.length() >= 5 && currentPage.substring(0,5).equals("Quiz "))
      question.get(currentPage).mouseDragged();
}

void mouseReleased() {
   if(currentPage.length() >= 5 && currentPage.substring(0,5).equals("Quiz "))
      question.get(currentPage).mouseReleased();
}

void keyPressed() {
  if(currentPage.length() >= 5 && currentPage.substring(0,5).equals("Quiz "))
      question.get(currentPage).keyPressed();
}
