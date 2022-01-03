class MainModel11_11 {

    int rSize = 95;
    boolean kt1, kt2, kt3, kt4;
    int id1 = 0, id2 = 0;

    int buttonX = 400;
    int buttonY = 210;
    int disButtonY = 100;
    int disButtonX = 400;
    int textSize = 30;

    int disAnsX = 90;
    int ansX = 1250;
    int ansY = 170;
    int ansTextSize = 15;

    RectButton button1 = new RectButton("1. Thú cưng nhà hàng xóm", buttonX, buttonY + 0 * disButtonY, textSize);
    RectButton button2 = new RectButton("2. Tommy và Jeffrey            ", buttonX + disButtonX, buttonY + 0 * disButtonY, textSize);
    RectButton button3 = new RectButton("3. Chú mèo tuyệt diệu        ", buttonX, buttonY + 1 * disButtonY, textSize);   
    RectButton button4 = new RectButton("4. Nhiệm vụ hoàn thành     ", buttonX + disButtonX, buttonY + 1 * disButtonY, textSize);

    RectButton buttonSubmit = new RectButton("submit", 280, buttonY + 2 * disButtonY, textSize);
    RectButton buttonClear = new RectButton("clear", 280 + 200, buttonY + 2 * disButtonY, textSize);

    RectButton buttonSolution = new RectButton("solution", 1280, 100, textSize);
    
    HashMap<Integer, Boolean> hm = new HashMap<Integer, Boolean>();
    String[] mp = {" ", "1. Thú cưng nhà hàng xóm", "2. Tommy và Jeffrey            ", "3. Chú mèo tuyệt diệu        ", "4. Nhiệm vụ hoàn thành     "};

    ArrayList<RectButton> res = new ArrayList<RectButton>();
    ArrayList<RectButton[]> listRes = new ArrayList<RectButton[]>();


    void submit(int x1, int x2) {
        if (x2 < x1){
            int tmp = x1;
            x1 = x2;
            x2 = tmp;
        }
        println("x1: "+ x1);
        println("x2: "+ x2);
        int x = (x1 + 1) * 100 + (x2 + 1) * 10;
        int sz = listRes.size();
        if (hm.get(x) == null) {
            hm.put(x, true);
            RectButton[] tmp = {new RectButton(mp[x1], ansX , ansY + sz * rSize, ansTextSize), new RectButton(mp[x2], ansX, ansY + 40 + sz * rSize, ansTextSize)};
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
        kt1 = kt2 = kt3 = kt4 = false;
        res.clear();
    }

    void addRes(int x) {
        int sz = 0;
        
        if (id1 == 0) {
          id1 = x;
        }
        else  {
          id2 = x;
          sz = 1;
        }
        res.add(new RectButton(mp[x], buttonX  + disButtonX * sz, disButtonY + 4 * disButtonY + 40, textSize));
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
                
        for (RectButton button : res) {
            button.draw();
        }
        for (RectButton button[]: listRes) {
            button[0].draw();
            button[1].draw();
        }
    }
    
    void mousePressed() {
        int sz = res.size();
        
        if (button1.clicked() && kt1 == false && id2 == 0) {
            addRes(1);
            kt1 = true;
        }

        if (button2.clicked() && kt2 == false && id2 == 0) {;
            addRes(2);
            kt2 = true;
        }

        if (button3.clicked() && kt3 == false && id2 == 0) {
            addRes(3);
            kt3 = true;
        }
        if (button4.clicked() && kt4 == false && id2 == 0) {
            addRes(4);
            kt4 = true;
        }        

        if (buttonClear.clicked()) {
            clear();
        }

        if (buttonSubmit.clicked() && id2 != 0) {
            submit(id1, id2);
            clear();
        }

        if (buttonSolution.clicked()) {
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
    }

    void reset() {
        super.reset();
        model = new MainModel11_11();
    }

}
