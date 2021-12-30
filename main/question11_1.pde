class ControlButton extends RectButton{
    int linhtinh;
    
    ControlButton(String _text, float _x, float _y) {
        super(_text, _x, _y, 15.0, 10.0, 10.0);
    }
    
    ControlButton(String _text, float _x, float _y, float _text_size) {
        super(_text, _x, _y, _text_size, _text_size * 0.8, _text_size * 0.8);
    }
}


class Answer11_1 {
    String sequence = "";
    int ordinal = 1;
    int segment = 50;
    int pos_x = 800;
    int pos_y = 200;
    int distance = 50;
    
    Answer11_1(int _ordinal, String _sequence) {
        ordinal = _ordinal;
        sequence = _sequence;
        
        if(ordinal < 3) {
            pos_x = pos_x + ordinal * (segment * 2 + distance);
        } else {
            pos_y = pos_y + segment * 2 + distance;
            ordinal = ordinal - 3;
            pos_x = pos_x + ordinal * (segment * 2 + distance);
        }
    }
    
    void draw() {
        noFill();
        stroke(0);
        strokeWeight(1);
        
        for(int i = 0; i < 2; i ++) {
            for(int j = 0; j < 2; j ++) {
                rect(pos_x + i * segment, pos_y + j * segment, segment, segment);
            }
        }
        
        int cur_x = pos_x;
        int cur_y = pos_y + 2 * segment;
        
        for(int i = 0; i < sequence.length(); i ++) {
            stroke(127);
            strokeWeight(5);
            
            if(sequence.charAt(i) == 'R') {
                line(cur_x, cur_y, cur_x + segment, cur_y);
                cur_x = cur_x + segment;
            } else {
                line(cur_x, cur_y, cur_x, cur_y - segment);
                cur_y = cur_y - segment;
            }
        }
    }
}


class MainModel11_1 {
    // to edit
    int segment = 150;
    int x_start = 300;
    int y_start = 500;
    int delay = 20;
    int speed = 2;
    
    PImage character = loadImage("../data/img/ant.png");
    int character_size = 50;
    
    int x_end = x_start + 2 * segment;
    int y_end = y_start - 2 * segment;
    
    int[] x_init = {x_start};
    int[] y_init = {y_start};
    int[] x_move = x_init;
    int[] y_move = y_init;
    int x_left = 0;
    int y_left = 0;
    int x_cur = x_start;
    int y_cur = y_start;
    
    int counter = 0;
    String sequence = "";  
    ArrayList<Answer11_1> listAnswer = new ArrayList<Answer11_1>();
    String[] solution = {"UURR", "URUR", "URRU", "RRUU", "RURU", "RUUR"};
    
    ControlButton button_right = new ControlButton("sang phải", 350, 575, 20);
    ControlButton button_up = new ControlButton("đi lên", 500, 575, 20);
    ControlButton button_reset = new ControlButton("đi lại", 650, 575, 20);
    ControlButton button_solution = new ControlButton("đáp án", 1280, 100, 20);
    
    //{listAnswer.add(new Answer11_1(0, "URUR"));}
    
    void init() {
        sequence = "";
        x_cur = x_start;
        y_cur = y_start;
        x_move = x_init;
        y_move = y_init;
    }
    
    void setup() {
        //draw main model
        noFill();
        stroke(0);
        strokeWeight(1);
        for(int i = 0; i < 2; i ++) {
            for(int j = 1; j < 3; j ++) {
                rect(x_start + i * segment, y_start - j * segment, segment, segment);
            }
        }
        
        //draw buttons
        button_right.draw();
        button_up.draw();
        button_reset.draw();
        button_solution.draw();
        
        //draw answer
        for(Answer11_1 answer : listAnswer) {
            answer.draw();
        }
    }
    
    void draw() {
        // allownextaction when counter reach 0
        if(counter > 0) {
            counter -= speed;
        }
        
        //movingright 
        if(x_left > 0) {
            for(int s = 0; s < speed; s ++) {
                x_left --;
                x_cur ++;
                x_move = append(x_move, x_cur);
                y_move = append(y_move, y_cur);
            }
            
        }
        
        //movingup
        if(y_left > 0) {
            for(int s = 0; s < speed; s ++) {
                y_left --;
                y_cur --;
                x_move = append(x_move, x_cur);
                y_move = append(y_move, y_cur);
            }
            
        }
        
        //draw moved
        stroke(255, 0, 0);
        strokeWeight(4);
        for(int i = 0; i < x_move.length; i ++) {
            point(x_move[i], y_move[i]);
        }
        
        if(counter == 0) {
            // draw nextpossible moves
            stroke(0, 255, 0);
            strokeWeight(4);
            
            if(x_cur < x_end) {
                line(x_cur, y_cur, x_cur + segment, y_cur);
            }
            if(y_cur > y_end) {
                line(x_cur, y_cur, x_cur, y_cur - segment);
            }
            
            //initializewhen reach the end
            if(x_cur == x_end && y_cur == y_end) {
                init();
            }
        }
        
        //draw character
        image(character, x_cur - character_size / 2, y_cur - character_size / 2, character_size, character_size);
        
        //add answer
        if(x_cur == x_end && y_cur == y_end) {
            boolean check = true;
            for(Answer11_1 answer : listAnswer) {
                if(answer.sequence.equals(sequence)) {
                    check = false;
                }
            }
            if(check) {
                Answer11_1 newAnswer = new Answer11_1(listAnswer.size(), sequence);
                listAnswer.add(newAnswer);
            }
        }
    }
    
    void mousePressed() {
        //right button
        if(button_right.clicked()) {
            if(counter <= 0 && x_cur < x_end) {
                sequence = sequence + "R";
                x_left = segment;
                counter = segment + delay;
            }
        }
        
        //up button
        if(button_up.clicked()) {
            if(counter <= 0 && y_cur > y_end) {
                sequence = sequence + "U";
                y_left = segment;
                counter = segment + delay;
            }
        } 
        
        //reset button
        if(button_reset.clicked()) {
            if(counter <= 0) {
                init();
                counter = delay;
            }
        }
        
        //solution button
        if(button_solution.clicked()) {
            if(counter <= 0) {
                for(String _solution : solution) {
                    boolean check = true;
                    
                    for(Answer11_1 answer : listAnswer) {
                        if(answer.sequence.equals(_solution)) {
                            check = false;
                        }
                    }
                    
                    if(check) {
                        Answer11_1 newAnswer = new Answer11_1(listAnswer.size(), _solution);
                        listAnswer.add(newAnswer);
                    }
                }
            }
        }
    }
}

class Question11_1 extends Question { 
    MainModel11_1 model = new MainModel11_1();
    
    void setup() {
        super.setup();  
        String quizText = "Có bao nhiêu cách để một chú kiến có thể trở về nhà là điểm B từ điểm A? Hãy hình dung chú ta chỉ có thể đi được theo hai hướng phải và lên";
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
