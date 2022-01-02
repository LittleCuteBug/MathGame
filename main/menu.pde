import java.util.Map;

class AchievementsStar {
  float x, y;
  boolean display = false;
  AchievementsStar(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void draw() {
    if(display)
      image(starIMG, x + 40, y);
  }
}

class Menu {
  RectButton page1 = new RectButton("Pages 1", 300, 200);
  ArrayList<RectButton> page = new ArrayList<RectButton>();
  HashMap<String, AchievementsStar> achievements = new HashMap<String, AchievementsStar>();

  PImage bg;
  
  void setup() {
    for(int j = 0; j<3; j++) {
      for(int i = 0; i<6; i++) {
        int p_th = (i+j*6 + 1);
        if (p_th <= 18) {
          String bText = "Quiz 11." + p_th;
          if (p_th < 10)
            bText += "  ";
          page.add(new RectButton(bText , 350 + i * 160, 100 + j * 90, 25));
          achievements.put(bText.trim(), new AchievementsStar(350 + i * 160, 100 + j * 90));
        }
      }
    }

    for(int j = 0; j<4; j++) {
      for(int i = 0; i<6; i++) {
        int p_th = (i+j*6 + 1);
        if (p_th <= 22) {
          String bText = "Quiz 12." + p_th;
          if (p_th < 10)
            bText += "  ";
          page.add(new RectButton(bText , 350 + i * 160, 400 + j * 90, 25));
          achievements.put(bText.trim(), new AchievementsStar(350 + i * 160, 400 + j * 90));
        }
      }
    }
    bg = loadImage("../data/img/menuBG.jpg");
  }
  
  void draw() {
    background(bg);
    for(RectButton button : page) {
      button.draw();
    }

    for(AchievementsStar star : achievements.values()) {
      star.draw();
    }
  }
  
  void mousePressed() {
    for(int i=0; i<page.size();i++) {
      if(page.get(i).clicked()) {
        currentPage = page.get(i).b_text.trim();
      }
    }
  }
}
