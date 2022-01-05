class Ball {
    // not chosen
    int x;
    int y;
    int r = 30;
    float deg = random(0, 2 * PI);
    float dis = 2 * PI / 360;
    color colo;
    
    boolean chosen = false;
    // chosen
    int ordinal = 0;
    int x_p = 300;
    int y_p = 700;
    int distance = 100;
    
    Ball(String _colo, int _x, int _y) {
        x = _x;
        y = _y;
        switch(_colo) {
            case "red":
                colo = color(255, 0, 0);
                break;
            case "green":
                colo = color(0, 255, 0);
                break;
            case "blue" :
                colo = color(0, 0, 255);
                break;
        }
    }
    
    void draw() {
        if(chosen) {
            stroke(0);
            strokeWeight(5);
            fill(colo);
            ellipseMode(CENTER);
            ellipse(x_p + ordinal * distance, y_p, r * 2, r * 2);
            stroke(255);
            strokeWeight(10);
            deg += dis;
            deg %= (2 * PI);
            arc(x_p + ordinal  * distance, y_p, r, r, deg, deg + PI / 2);
        } else {
            stroke(0);
            strokeWeight(5);
            fill(colo);
            ellipseMode(CENTER);
            ellipse(x, y, r * 2, r * 2);
            stroke(255);
            strokeWeight(10);
            deg += dis;
            deg %= (2 * PI);
            arc(x, y, r, r, deg, deg + PI / 2);
        }
        
    }
    
    boolean isClicked() {
        return moveOver();
    }
    
    boolean isHover() {
        return moveOver();
    }
    
    boolean moveOver() {
        return((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y)) < r * r;
    }
}


class MainModel11_18 {
    ArrayList<Ball> listBall = new ArrayList<Ball>();
    
    void setup() {
        // 5 red balls
        listBall.add(new Ball("red", 200, 200));
        listBall.add(new Ball("red", 300, 200));
        listBall.add(new Ball("red", 200, 300));
        listBall.add(new Ball("red", 300, 300));
        listBall.add(new Ball("red", 300, 400));
        
        // 5 green balls
        listBall.add(new Ball("green", 500, 200));
        listBall.add(new Ball("green", 500, 300));
        listBall.add(new Ball("green", 600, 200));
        listBall.add(new Ball("green", 600, 300));
        listBall.add(new Ball("green", 600, 400));
        
        // 3 blue balls
        listBall.add(new Ball("blue", 800, 200));
        listBall.add(new Ball("blue", 800, 300));
        listBall.add(new Ball("blue", 900, 300));
    }
    
    void draw() {
        for(Ball ball : listBall) {
            ball.draw();
        }
    }
    
    void mousePressed() {
        for(Ball ball : listBall) {
            if(ball.isClicked()) {
                ball.chosen = true;
            }
        }
    }
}
class Question11_18 extends Question {
    MainModel11_18 model = new MainModel11_18();
    
    void setup() {
        super.setup();
        String quizText = "11_18";
        quiz = new QuizText(quizText);
        model.setup();
    }
    
    void draw() {
        super.draw();
        model.draw();
    }
    
    void mousePressed() {
        super.mousePressed();
        model.mousePressed();
    }
}
