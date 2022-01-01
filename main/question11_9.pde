import java.util.Map;

class MainModel11_9 {

    int rSize = 70;

    int buttonY = 350;
    int buttonX1 = 300;
    int buttonX2 = 500;
    int buttonX3 = 700;
    int buttonSubmitX = 900;

    int disAnsX = 90;
    int ansX = 1100;
    int ansTextSize = 15;

    int textSize = 30;
    int id1 = 0;
    int id2 = 1; 
    int id3 = 2;
    String[] mp = {"       Mẹ       ", "Jonathan", "       Bố       "};

    RectButton[][] button = {
      {new RectButton("       Mẹ       ", buttonX1, buttonY, textSize), new RectButton("Jonathan", buttonX1, buttonY, textSize), new RectButton("       Bố       ", buttonX1, buttonY, textSize) },
      {new RectButton("       Mẹ       ", buttonX2, buttonY, textSize), new RectButton("Jonathan", buttonX2, buttonY, textSize), new RectButton("       Bố       ", buttonX2, buttonY, textSize) },
      {new RectButton("       Mẹ       ", buttonX3, buttonY, textSize), new RectButton("Jonathan", buttonX3, buttonY, textSize), new RectButton("       Bố       ", buttonX3, buttonY, textSize) }
    };
    
    
    RectButton button1, button2, button3;
    RectButton buttonSubmit = new RectButton("submit", buttonSubmitX, buttonY, textSize);
    RectButton buttonSolution = new RectButton("solution", 1280, 100, textSize);
    
    HashMap<Integer, Boolean> hm = new HashMap<Integer, Boolean>();
    //ArrayList<RectButton> listRes = new ArrayList<RectButton>();
    ArrayList<RectButton[]> listRes = new ArrayList<RectButton[]>();

    void add(int x1, int x2, int x3) {
        int x = (x1 + 1) * 100 + (x2 + 1) * 10 + x3;
        int sz = listRes.size();
        if (hm.get(x) == null) {
            hm.put(x, true);
            RectButton[] tmp = {new RectButton(mp[x1], ansX , 200 + sz * rSize, ansTextSize), new RectButton(mp[x2], ansX + disAnsX , 200 + sz * rSize, ansTextSize), new RectButton(mp[x3], ansX + 2 * disAnsX , 200 + sz * rSize, ansTextSize)};
            listRes.add(tmp);
        }
    }

    void solution() {
        int[][] solution = {
            {0, 1, 2},
            {0, 2, 1},
            {1, 0, 2},
            {1, 2, 0},
            {2, 0, 1},
            {2, 1, 0},
        };
        for (int i = 0; i < 6; i++) {
            add(solution[i][0], solution[i][1], solution[i][2]);
        }

    }
    

    void setup() {
        button1 = button[0][id1];
        button2 = button[1][id2];
        button3 = button[2][id3];
        button1.draw();
        button2.draw();
        button3.draw();
        buttonSubmit.draw();
        buttonSolution.draw();
    }

    void draw() {
        for (RectButton button[] : listRes) {
            button[0].draw();
            button[1].draw();
            button[2].draw();
        }         

    }
    

  void mousePressed() {
        
        if (button1.clicked()) {
            id1 = (id1 + 1) % 3;
        }
        if (button2.clicked()) {
            id2 = (id2 + 1) % 3;
        }
        if (button3.clicked()) {
            id3 = (id3 + 1) % 3;
        }


        if (buttonSubmit.clicked() && id1 != id2 && id2 != id3 && id3 != id1) {
            add(id1, id2, id3);
        }

        if (buttonSolution.clicked()) {
            solution();
        }

    }


}


class Question11_9 extends Question {

    MainModel11_9 model = new MainModel11_9();

    void setup() {
        super.setup();
        String quizText = "Jonathan và bố mẹ cùng chụp một bức ảnh gia đình. Hãy chỉ ra các cách sắp xếp vị trí ngồi của từng người";
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

}
