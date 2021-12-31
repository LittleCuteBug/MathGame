class ControlButton extends RectButton{
    int labalSize = 5;
    
    String type;
    
    ControlButton(String _text, float _x, float _y) {
        super(_text, _x, _y, 15.0, 10.0, 10.0);
    }
    
    ControlButton(String _text, float _x, float _y, float _text_size) {
        super(_text, _x, _y, _text_size, _text_size * 0.8, _text_size * 0.8);
    }
    
    ControlButton(String _text, float _x, float _y, float _text_size, String _type) {
        super(_text, _x, _y, _text_size, _text_size * 0.8, _text_size * 0.8);
        type = _type;
    }
    
    void draw() {
        textSize(b_text_size);
        textAlign(CENTER); 
        float text_width = textWidth(b_text);
        float rect_x = x - text_width / 2 - b_margin_width;
        float rect_y = y - textAscent() - b_margin_height;
        
        b_width = text_width + b_margin_width * 2;
        b_height = textAscent() + textDescent() + b_margin_height * 2;
        stroke(0,0,0,0);
        if(moveOver())
            fill(BUTTON_COLOR_OVER);
        else
            fill(BUTTON_COLOR_DEFAULT);
        
        rectMode(CENTER);
        rect(x, y, b_width, b_height, BUTTON_RADIO);
        rectMode(CORNER);
        
        //draw label
        stroke(BUTTON_TEXT_COLOR);  
        strokeWeight(labalSize); 
        float x_radius = b_width / 4;
        float y_radius = b_height / 4;
        
        if(type.equals("right")) {
            line(x - x_radius, y, x + x_radius, y);
            line(x + x_radius, y, x, y + y_radius);
            line(x + x_radius, y, x, y - y_radius);
        } else if(type.equals("up")) {
            line(x, y + y_radius, x, y - y_radius);
            line(x, y - y_radius, x - x_radius, y);
            line(x, y - y_radius, x + x_radius, y);
        } else if(type.equals("reset")) {
            line(x - x_radius, y - y_radius, x + x_radius, y + y_radius);
            line(x + x_radius, y - y_radius, x - x_radius, y + y_radius);
        } else if(type.equals("backward")) {
            arc(x, y, 2 * x_radius, 2 * y_radius, -PI / 2, PI);
            int l = 5;
            line(x - l, y - y_radius, x, y - y_radius + l);
            line(x - l, y - y_radius, x, y - y_radius - l);
        }
    }
}

class Answer11_1 {
    //css
    int border_size = 2;
    int painted_size = 5;
    int dot_size = 20;
    
    String sequence = "";
    int ordinal = 1;
    int segment = 50;
    int pos_x = 800;
    int pos_y = 200;
    int distance = 50;
    
    Answer11_1(int _ordinal, String _sequence) {
        ordinal = _ordinal;
        sequence = _sequence;
        
        //set position for answer
        if(ordinal < 3) {
            pos_x = pos_x + ordinal * (segment * 2 + distance);
        } else {
            pos_y = pos_y + segment * 2 + distance;
            ordinal = ordinal - 3;
            pos_x = pos_x + ordinal * (segment * 2 + distance);
        }
    }
    
    void draw() {
        //draw each answer
        noFill();
        stroke(0);
        strokeWeight(border_size);
        
        //draw border
        for(int i = 0; i < 2; i ++) {
            for(int j = 0; j < 2; j ++) {
                rect(pos_x + i * segment, pos_y + j * segment, segment, segment);
            }
        }
        
        //draw painted
        int cur_x = pos_x;
        int cur_y = pos_y + 2 * segment;
        
        for(int i = 0; i < sequence.length(); i ++) {
            stroke(39, 174, 96);
            strokeWeight(painted_size);
            
            if(sequence.charAt(i) == 'R') {
                line(cur_x, cur_y, cur_x + segment, cur_y);
                cur_x = cur_x + segment;
            } else {
                line(cur_x, cur_y, cur_x, cur_y - segment);
                cur_y = cur_y - segment;
            }
        }
        
        //draw start end point
        strokeWeight(dot_size);
        point(pos_x, pos_y + 2 * segment);
        point(cur_x, cur_y);
    }
}


class MainModel11_1 {
    // css
    int border_size = 4;
    int painted_size = 10;
    int arrow_size = 6;
    int dot_size = 20;
    // to edit
    int segment = 150;
    int x_start = 350;
    int y_start = 500;
    int delay = 20;
    int speed = 4;
    int pediod = 20;
    int count_pediod = 0;
    
    //PImage character = loadImage("../data/img/ant.svg");
    PImage home = loadImage("../data/img/home.png");
    PImage ant = loadImage("../data/img/ant.png");
    PImage pond = loadImage("../data/img/pond.png");
    
    int x_end = x_start + 2 * segment;
    int y_end = y_start - 2 * segment;
    
    int[] x_init = {x_start};
    int[] y_init = {y_start};
    int[] x_move = x_init;
    int[] y_move = y_init;
    int x_left = 0;
    int y_left = 0;
    int bward = 0;
    int x_cur = x_start;
    int y_cur = y_start;
    
    int counter = 0;
    String sequence = "";  
    ArrayList<Answer11_1> listAnswer = new ArrayList<Answer11_1>();
    String[] solution = {"UURR", "URUR", "URRU", "RRUU", "RURU", "RUUR"};
    
    int button_size = 20;
    String button_shape = "o|o";
    ControlButton button_up = new ControlButton(button_shape, 350, 600, button_size, "up");
    ControlButton button_right = new ControlButton(button_shape, 450, 600, button_size, "right");
    ControlButton button_reset = new ControlButton(button_shape, 550, 600, button_size, "reset");  
    ControlButton button_backward = new ControlButton(button_shape, 650, 600, button_size, "backward");
    RectButton button_solution = new RectButton("đáp án", 1280, 100, 30);
    
    //set ant to start point
    void init() {
        sequence = "";
        x_cur = x_start;
        y_cur = y_start;
        x_move = x_init;
        y_move = y_init;
    }
    
    void draw() {
        //loop period
        count_pediod = (count_pediod + 1) % pediod;
        
        //draw main model
        noFill();
        stroke(0);
        strokeWeight(border_size);
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
        button_backward.draw();
        
        //draw answer
        for(Answer11_1 answer : listAnswer) {
            answer.draw();
        }
        
        // allow next move when counter reach 0
        if(counter > 0) {
            counter -= speed;
            if(counter < 0) {
                counter = 0;
            }
            
            //moving right 
            if(x_left > 0) {
                for(int s = 0; s < speed && x_left > 0; s ++) {
                    x_left --;
                    x_cur ++;
                    x_move = append(x_move, x_cur);
                    y_move = append(y_move, y_cur);
                }
                
            }
            
            //moving up
            if(y_left > 0) {
                for(int s = 0; s < speed && y_left > 0; s ++) {
                    y_left --;
                    y_cur --;
                    x_move = append(x_move, x_cur);
                    y_move = append(y_move, y_cur);
                }
            }
            
            //moving backward
            if(bward > 0) {
                for(int s = 0; s < 2 * speed && bward > 0; s ++) {
                    bward --;
                    x_move = shorten(x_move);
                    y_move = shorten(y_move);
                    x_cur = x_move[x_move.length - 1];
                    y_cur = y_move[y_move.length - 1];
                }
            }
        }
        
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
        
        //draw moved
        stroke(255, 0, 0);
        strokeWeight(painted_size);
        for(int i = 0; i < x_move.length; i ++) {
            point(x_move[i], y_move[i]);
        }
        
        //handle when finish the move
        if(counter == 0) {
            // draw next possible moves
            stroke(0, 255, 0);
            
            if(x_cur < x_end) {
                strokeWeight(border_size);
                line(x_cur, y_cur, x_cur + segment, y_cur);
                strokeWeight(arrow_size);
                for(int i = count_pediod; i < segment; i += pediod) {
                    line(x_cur + i, y_cur, x_cur + i - pediod / 2, y_cur - pediod / 4);
                    line(x_cur + i, y_cur, x_cur + i - pediod / 2, y_cur + pediod / 4);
                }
                
                strokeWeight(dot_size);
                point(x_cur + segment, y_cur);
            }
            
            if(y_cur > y_end) {
                strokeWeight(border_size);
                line(x_cur, y_cur, x_cur, y_cur - segment);
                strokeWeight(arrow_size);
                for(int i = count_pediod; i < segment; i += pediod) {
                    line(x_cur, y_cur - i, x_cur + pediod / 4, y_cur - i + pediod / 2);
                    line(x_cur, y_cur - i, x_cur - pediod / 4, y_cur - i + pediod / 2);
                }
                
                strokeWeight(dot_size);
                point(x_cur, y_cur - segment);
            }
            
            //initialize when reach the end
            if(x_cur == x_end && y_cur == y_end) {
                init();
            }
        }
        
        //draw start
        int pond_size = 100;
        image(pond, x_start - pond_size - 10, y_start - pond_size, pond_size, pond_size);
        fill(0);
        textSize(50);
        text("A", x_start - 50, y_start + 50);
        textSize(12);
        
        //draw end
        int home_size = 100;
        image(home, x_end + 10, y_end - home_size / 3, home_size, home_size);
        fill(0);
        textSize(50);
        text("B", x_end - 10, y_end - 10);
        textSize(12);
        
        //draw ant
        int ant_size = 80;
        image(ant, x_cur - ant_size / 2, y_cur - ant_size / 2, ant_size, ant_size);
        
        //congratulation
        if(listAnswer.size() == 6) {
            fill(231, 76, 60);
            textSize(50.0);
            text("CONGRATULATION!!!", 1000, 600, 50);
            textSize(12.0);
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
        
        //backward button
        if(button_backward.clicked()) {
            if(counter <= 0 && sequence.length() > 0) {
                sequence = sequence.substring(0, sequence.length() - 1);
                bward = segment;
                counter = segment / 2 + delay;
            }
        }
    }
    
    void reset() {
        if(counter == 0) {
            init();
            listAnswer.clear();
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
        model.draw();
    }
    
    void mousePressed() {
        super.mousePressed();
        model.mousePressed();
    }
    
    void reset() {
        super.reset();
        model.reset();
    }
}
