class MainModel11_11 {

    int rSize = 95;
    boolean kt1, kt2, kt3, kt4;
    int id1 = 0, id2 = 0;
    int checkSol = 0;

    int buttonX = 370;
    int buttonY = 300;
    int disButtonY = 100;
    int disButtonX = 500;
    int textSize = 30;

    int disAnsX = 90;
    int ansX = 1250;
    int ansY = 170;
    int ansTextSize = 15;

    String[] mp = {" ", 
    "1. Thú cưng nhà hàng xóm", 
    "2. Tommy và Jeffrey             ", 
    "3. Chú mèo tuyệt diệu         ", 
    "4. Nhiệm vụ hoàn thành     "};

    ChooseButton button1 = new ChooseButton(mp[1], buttonX, buttonY + 0 * disButtonY, textSize * 1.3);
    ChooseButton button2 = new ChooseButton(mp[2], buttonX + disButtonX, buttonY + 0 * disButtonY, textSize * 1.3);
    ChooseButton button3 = new ChooseButton(mp[3], buttonX, buttonY + 1 * disButtonY, textSize * 1.3);   
    ChooseButton button4 = new ChooseButton(mp[4], buttonX + disButtonX, buttonY + 1 * disButtonY, textSize * 1.3);

    RectButton buttonSubmit = new RectButton("submit", 470, buttonY + 2.7 * disButtonY, textSize * 1.5);
    RectButton buttonClear = new RectButton("clear", 700, buttonY + 2.7 * disButtonY, textSize * 1.5);

    RectButton buttonSolution = new RectButton("solution", 1280, 100, textSize);
    
    HashMap<Integer, Boolean> hm = new HashMap<Integer, Boolean>();
    
    ArrayList<ChooseButton[]> listRes = new ArrayList<ChooseButton[]>();

    int end() {
        if (checkSol == 1) return 1;
        if (listRes.size() == 6) return 2;
        return 0;
    }

    void submit(int x1, int x2) {
        if (x2 < x1){
            int tmp = x1;
            x1 = x2;
            x2 = tmp;
        }
        int x = (x1 + 1) * 100 + (x2 + 1) * 10;
        int sz = listRes.size();
        if (hm.get(x) == null) {
            hm.put(x, true);
            ChooseButton[] tmp = {new ChooseButton(mp[x1], ansX , ansY + sz * rSize, ansTextSize, true), 
            new ChooseButton(mp[x2], ansX, ansY + 40 + sz * rSize, ansTextSize, true)};
            listRes.add(tmp);
        }
    }

    void solution() {
        int[][] solution = {
            {1, 2},
            {1, 3},
            {1, 4},
            {2, 3},
            {2, 4},
            {3, 4},
        };
        for (int i = 0; i < 6; i++) {
            submit(solution[i][0], solution[i][1]);
        }
    }

    void clear() {
        id1 = id2 = 0;
        button1.is_chose = button2.is_chose = button3.is_chose = button4.is_chose = false;
    }

    void addRes(int x) {
        if (id1 == 0) {
          id1 = x;
        }
        else  {
          id2 = x;
        }
    }

    void rmRes(int x) {
        if (id1 == x) {
          id1 = id2;
          id2 = 0;
        }
        else  {
          id2 = 0;
        }
    }

    void setup() {
        button1.draw();
        button2.draw();
        button3.draw();
        button3.draw();
        button4.draw();
        buttonClear.draw();
        buttonSubmit.draw();
        buttonSolution.draw();
    }

    void draw() {
        for (ChooseButton button[]: listRes) {
            button[0].draw();
            button[1].draw();
        }
    }
    
    void mousePressed() {
        if (button1.clicked()) {
          if(button1.is_chose) {
            rmRes(1);
            button1.is_chose = false;
          } else {
            if(id2 == 0) {
              addRes(1);
              button1.is_chose = true;
            }
          }
        }

        if (button2.clicked()) {
          if(button2.is_chose) {
            rmRes(2);
            button2.is_chose = false;
          } else {
            if(id2 == 0) {
              addRes(2);
              button2.is_chose = true;
            }
          }
        }

        if (button3.clicked()) {
          if(button3.is_chose) {
            rmRes(3);
            button3.is_chose = false;
          } else {
            if(id2 == 0) {
              addRes(3);
              button3.is_chose = true;
            }
          }
        }
        if (button4.clicked()) {
          if(button4.is_chose) {
            rmRes(4);
            button4.is_chose = false;
          } else {
            if(id2 == 0) {
              addRes(4);
              button4.is_chose = true;
            }
          }
        }        

        if (buttonClear.clicked()) {
            clear();
        }

        if (buttonSubmit.clicked() && id2 != 0) {
            submit(id1, id2);
            clear();
        }

        if (buttonSolution.clicked()) {
            checkSol = 1;
            solution();
        }
    }

}

class Question11_11 extends Question {

    MainModel11_11 model = new MainModel11_11();

    void setup() {
        super.setup();
        String quizText = "Hu-ra! Dì regina sẽ chiêu đãi Geoff xem hai bộ phim trong ngày hãy giúp Geoff tính xem có bao nhiêu các chọn ra hai bộ phim từ bốn bộ phim dưới dây";
        quiz = new QuizText(quizText);     
    }
    
    void draw() {
        super.draw();
        model.setup();
        model.draw();
    }
    
    void mousePressed() {
        super.mousePressed();
        model.mousePressed();
        int flaf = model.end();
        if (flaf == 2) finish(true);
    }

    void reset() {
        super.reset();
        model = new MainModel11_11();
    }

}
