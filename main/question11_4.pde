import java.util.Map;

class MainModel11_4 {

    int rSize = 70;
    int currentNumber = 0;
    boolean kt1, kt2, kt3;
    int buttonY = 200;
    int ansY = 500;
    int ansX = 500;
    int textSize = 30;
    RectButton button1 = new RectButton("1", 350, buttonY, textSize);
    RectButton button2 = new RectButton("2", 425, buttonY, textSize);
    RectButton button3 = new RectButton("3", 500, buttonY, textSize);
    RectButton buttonReset = new RectButton("reset", 800, buttonY, textSize);
    RectButton buttonSubmit = new RectButton("submit", 650, buttonY, textSize);
    RectButton buttonSolution = new RectButton("solution", 1280, 100, textSize);
    
    HashMap<Integer, Boolean> hm = new HashMap<Integer, Boolean>();

    ArrayList<RectButton> res = new ArrayList<RectButton>();
    ArrayList<RectButton> listRes = new ArrayList<RectButton>();
    
    void reset() {
        res = new ArrayList<RectButton>();
        kt1 = kt2 = kt3 = false;
        currentNumber = 0;
    }

    void add(int x) {
        int sz = listRes.size();
        if (hm.get(x) == null) {
            hm.put(x, true);
            listRes.add(new RectButton(str(x) , 1280 , 200 + sz * rSize, 20));
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
            res.add(new RectButton("1" , ansX + sz * rSize, ansY, 30));
            currentNumber = currentNumber * 10 + 1;
            kt1 = true;
        }

        if (button2.clicked() && kt2 == false) {
            res.add(new RectButton("2" , ansX + sz * rSize, ansY, 30));
            currentNumber = currentNumber * 10 + 2;
            kt2 = true;
        }

        if (button3.clicked() && kt3 == false) {
            res.add(new RectButton("3" , ansX + sz * rSize, ansY, 30));
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
    }

}
