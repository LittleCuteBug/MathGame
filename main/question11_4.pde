import java.util.Map;

class MainModel11_4 {

    int rSize = 200;
    int currentNumber = 0;
    boolean kt1, kt2, kt3;
    int buttonY = 600;
    int ansY = 350;
    int ansX = 480;
    int textSize = 30;
    int checkSol = 0;
    RectButton button1 = new RectButton("1", 450, buttonY, textSize, 30, 20);
    RectButton button2 = new RectButton("2", 550, buttonY, textSize, 30, 20);
    RectButton button3 = new RectButton("3", 650, buttonY, textSize, 30, 20);
    RectButton buttonReset = new RectButton("clear", 950, buttonY, textSize);
    RectButton buttonSubmit = new RectButton("submit", 800, buttonY, textSize);
    RectButton buttonSolution = new RectButton("solution", 1280, 100, textSize);
    
    HashMap<Integer, Boolean> hm = new HashMap<Integer, Boolean>();

    ArrayList<RectButton> res = new ArrayList<RectButton>();
    ArrayList<RectButton> listRes = new ArrayList<RectButton>();
    

    int end() {
        if (checkSol == 1) return 1;
        if (listRes.size() == 6) return 2;
        return 0;
    }

    void reset() {
        res = new ArrayList<RectButton>();
        kt1 = kt2 = kt3 = false;
        currentNumber = 0;
    }

    void add(int x) {
        int sz = listRes.size();
        if (hm.get(x) == null) {
            hm.put(x, true);
            listRes.add(new RectButton(str(x) , 1280 , 200 + sz * 80, 25));
        }
        
    }
    void solution() {
        int[] solution = {123, 132, 213, 231, 312, 321};
        for (int tmp: solution) {
            add(tmp);
        }
        
    }

    void setup() {
        button1.draw();
        button2.draw();
        button3.draw();
        buttonReset.draw();
        buttonSubmit.draw();
        buttonSolution.draw();
    }

    void draw() {
                
        for (RectButton button : res) {
            button.draw();
        }
        for (RectButton button : listRes) {
            button.draw();
        }
    }
    

    void mousePressed() {
        
        int sz = res.size();
        
        if (button1.clicked() && kt1 == false) {
            res.add(new RectButton("1" , ansX + sz * rSize, ansY, 60, 60, 40));
            currentNumber = currentNumber * 10 + 1;
            kt1 = true;
        }

        if (button2.clicked() && kt2 == false) {
            res.add(new RectButton("2" , ansX + sz * rSize, ansY, 60, 60, 40));
            currentNumber = currentNumber * 10 + 2;
            kt2 = true;
        }

        if (button3.clicked() && kt3 == false) {
            res.add(new RectButton("3" , ansX + sz * rSize, ansY, 60, 60, 40));
            currentNumber = currentNumber * 10 + 3;
            kt3 = true;
        }

        if (buttonReset.clicked()) {
            reset();
        }

        if (buttonSubmit.clicked() && currentNumber > 100) {
            add(currentNumber);
            reset();
        }

        if (buttonSolution.clicked()) {
            checkSol = 1;
            solution();
        }

    }


}

class Question11_4 extends Question {

    MainModel11_4 model = new MainModel11_4();

    void setup() {
        super.setup();
        String quizText = "Có bao nhiêu cách tạo thành một số có 3 chữ số từ các số 1, 2 và 3; mỗi số chỉ xuất hiện một lần";
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
        model = new MainModel11_4();
    }
}