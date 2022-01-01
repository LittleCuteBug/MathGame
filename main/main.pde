//import processing.sound.*;

String currentPage = "menu";

Menu menu = new Menu();
ArrayList<Question> question = new ArrayList<Question>();

void setup() {
  size(1366, 768);
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
      question.get(0).draw();
      break;
    case "Quiz 11.2":
      question.get(1).draw();
      break;
    case "Quiz 11.3":
      question.get(2).draw();
      break;
    case "Quiz 11.4":
      question.get(3).draw();
      break;
    case "Quiz 11.5":
      question.get(4).draw();
      break;
    case "Quiz 11.6":
      question.get(5).draw();
      break;
    case "Quiz 11.7":
      question.get(6).draw();
      break;
    case "Quiz 11.8":
      question.get(7).draw();
      break;
    case "Quiz 11.9":
      question.get(8).draw();
      break;
    case "Quiz 11.10":
      question.get(9).draw();
      break;
    case "Quiz 11.11":
      question.get(10).draw();
      break;
    case "Quiz 11.12":
      question.get(11).draw();
      break;
    case "Quiz 11.13":
      question.get(12).draw();
      break;
    case "Quiz 11.14":
      question.get(13).draw();
      break;
    case "Quiz 11.15":
      question.get(14).draw();
      break;
    case "Quiz 11.16":
      question.get(15).draw();
      break;
    case "Quiz 11.17":
      question.get(16).draw();
      break;
    case "Quiz 11.18":
      question.get(17).draw();
      break;
    case "Quiz 12.1":
      question.get(18).draw();
      break;
    case "Quiz 12.2":
      question.get(19).draw();
      break;
    case "Quiz 12.3":
      question.get(20).draw();
      break;
    case "Quiz 12.4":
      question.get(21).draw();
      break;
    case "Quiz 12.5":
      question.get(22).draw();
      break;
    case "Quiz 12.6":
      question.get(23).draw();
      break;
    case "Quiz 12.7":
      question.get(24).draw();
      break;
    case "Quiz 12.8":
      question.get(25).draw();
      break;
    case "Quiz 12.9":
      question.get(26).draw();
      break;
    case "Quiz 12.10":
      question.get(27).draw();
      break;
    case "Quiz 12.11":
      question.get(28).draw();
      break;
    case "Quiz 12.12":
      question.get(29).draw();
      break;
    case "Quiz 12.13":
      question.get(30).draw();
      break;
    case "Quiz 12.14":
      question.get(31).draw();
      break;
    case "Quiz 12.15":
      question.get(32).draw();
      break;
    case "Quiz 12.16":
      question.get(33).draw();
      break;
    case "Quiz 12.17":
      question.get(34).draw();
      break;
    case "Quiz 12.18":
      question.get(35).draw();
      break;
    case "Quiz 12.19":
      question.get(36).draw();
      break;
    case "Quiz 12.20":
      question.get(37).draw();
      break;
    case "Quiz 12.21":
      question.get(38).draw();
      break;
    case "Quiz 12.22":
      question.get(39).draw();
      break;
  }
}

void mousePressed() {
  switch(currentPage.trim()) {
    case "menu":
      menu.mousePressed();
      break;
    case "Quiz 11.1":
      question.get(0).mousePressed();
      break;
    case "Quiz 11.2":
      question.get(1).mousePressed();
      break;
    case "Quiz 11.3":
      question.get(2).mousePressed();
      break;
    case "Quiz 11.4":
      question.get(3).mousePressed();
      break;
    case "Quiz 11.5":
      question.get(4).mousePressed();
      break;
    case "Quiz 11.6":
      question.get(5).mousePressed();
      break;
    case "Quiz 11.7":
      question.get(6).mousePressed();
      break;
    case "Quiz 11.8":
      question.get(7).mousePressed();
      break;
    case "Quiz 11.9":
      question.get(8).mousePressed();
      break;
    case "Quiz 11.10":
      question.get(9).mousePressed();
      break;
    case "Quiz 11.11":
      question.get(10).mousePressed();
      break;
    case "Quiz 11.12":
      question.get(11).mousePressed();
      break;
    case "Quiz 11.13":
      question.get(12).mousePressed();
      break;
    case "Quiz 11.14":
      question.get(13).mousePressed();
      break;
    case "Quiz 11.15":
      question.get(14).mousePressed();
      break;
    case "Quiz 11.16":
      question.get(15).mousePressed();
      break;
    case "Quiz 11.17":
      question.get(16).mousePressed();
      break;
    case "Quiz 11.18":
      question.get(17).mousePressed();
      break;
    case "Quiz 12.1":
      question.get(18).mousePressed();
      break;
    case "Quiz 12.2":
      question.get(19).mousePressed();
      break;
    case "Quiz 12.3":
      question.get(20).mousePressed();
      break;
    case "Quiz 12.4":
      question.get(21).mousePressed();
      break;
    case "Quiz 12.5":
      question.get(22).mousePressed();
      break;
    case "Quiz 12.6":
      question.get(23).mousePressed();
      break;
    case "Quiz 12.7":
      question.get(24).mousePressed();
      break;
    case "Quiz 12.8":
      question.get(25).mousePressed();
      break;
    case "Quiz 12.9":
      question.get(26).mousePressed();
      break;
    case "Quiz 12.10":
      question.get(27).mousePressed();
      break;
    case "Quiz 12.11":
      question.get(28).mousePressed();
      break;
    case "Quiz 12.12":
      question.get(29).mousePressed();
      break;
    case "Quiz 12.13":
      question.get(30).mousePressed();
      break;
    case "Quiz 12.14":
      question.get(31).mousePressed();
      break;
    case "Quiz 12.15":
      question.get(32).mousePressed();
      break;
    case "Quiz 12.16":
      question.get(33).mousePressed();
      break;
    case "Quiz 12.17":
      question.get(34).mousePressed();
      break;
    case "Quiz 12.18":
      question.get(35).mousePressed();
      break;
    case "Quiz 12.19":
      question.get(36).mousePressed();
      break;
    case "Quiz 12.20":
      question.get(37).mousePressed();
      break;
    case "Quiz 12.21":
      question.get(38).mousePressed();
      break;
    case "Quiz 12.22":
      question.get(39).mousePressed();
      break;
  }
}
void keyPressed() {
  switch(currentPage.trim()) {
    case "Quiz 11.3":
      question.get(2).keyPressed();
      break;
  }
}
