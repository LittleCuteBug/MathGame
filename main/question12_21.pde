class ModelObject12_21 {
    // element
    int ordinal = 0;
    int remain = 0;
    int await = 0;
    int hide = 0;
    int diff = 0;
    
    //to draw
    int x_start = 0;
    int x_end = 0;
    int y = 0;
    int segment = 20;
    int width = 50;
    
    //image
    PImage pointer = loadImage("../data/img/pointer.png");
    PImage img;
    int imgSize = 100;
    int x_img = 0;
    int y_img = 0;
    int radio = 10;
    
    ModelObject12_21(int _ordinal, int _remain) {
        ordinal = _ordinal;
        remain = _remain;
    }
    
    void setImage(PImage _img, int _imgsize) {
        img = _img;
        imgSize = _imgsize;
    }
    
    void setPosition(int _x, int _y) {
        x_start = _x;
        y = _y;
    }
    
    void draw() {
        //draw object
        x_end = x_start + (remain - hide - await) * segment;
        stroke(0);
        strokeWeight(2);
        fill(255, 0, 0);
        rect(x_start, y, x_end - x_start + await * segment, width, radio);
        fill(0, 255, 0);
        if(await > 0) {
            rect(x_end, y, await * segment, width, radio);
        }
        
        fill(0);
        textAlign(CENTER);
        textSize(30);
        if(remain > 0) {
            text(remain - await, x_start + (x_end - x_start) / 2, y + 35);
        } else {
            text("?", x_start + (x_end - x_start) / 2  + 10, y + 35);
        }
        
        textSize(12);
        
        if(await > 0) {
            if(await > 2) {
                stroke(0);
                noFill();
                line(x_end + segment / 2, y - 20, x_end + await * segment - segment / 2, y - 20);
                arc(x_end + segment / 2, y - 20 + segment / 2, segment, segment, PI, 3 * PI / 2);
                arc(x_end + await * segment - segment / 2, y - 20 + segment / 2, segment, segment, -PI / 2, 0);
            }
            
            rectMode(CENTER);
            fill(255);
            noStroke();
            textSize(30);
            rect(x_end + await * segment / 2, y - 20, textWidth(str(await)) + 10, 10);
            textAlign(CENTER);
            fill(0);
            text(await, x_end + await * segment / 2, y - 10);
            textSize(12);
            
            rectMode(CORNER);
        }
        
        x_img = x_start - imgSize - 20;
        y_img = y - imgSize / 2 + width / 2;
        image(img, x_img, y_img, imgSize, imgSize);
    }
    
    void drawPointer() {
        draw();
        image(pointer, x_img - 3 * imgSize / 4, y_img + imgSize / 4, imgSize / 2, imgSize / 2);
    }
    
    boolean isClicked() {
        if(mouseButton != LEFT) {
            return false;
        }
        if(x_start < mouseX && mouseX < x_end && y < mouseY && mouseY < y + width) {
            return true;
        }
        if(x_img < mouseX && mouseX < x_start && y_img < mouseY && mouseY < y_img + imgSize) {
            return true;
        }
        return false;
    }
}

class MainModel12_21 {
    int counter = 0;
    int delay = 200;
    int speed = 4;
    
    int x = 350;
    int y = 200;
    int distance = 150;
    int dis = 30;
    
    int await = 0;
    int move;
    
    //movement
    int x_cur = 0;
    int y_cur = 0;
    int x_tar = 0;
    int y_tar = 0;
    
    int stage = 0;
    boolean answer = false;
    
    ModelObject12_21 obj1;
    ModelObject12_21 obj2;
    
    ArrayList<RectButton> addButton = new ArrayList<RectButton>();
    ArrayList<RectButton> subButton = new ArrayList<RectButton>();
    
    ModelObject12_21 idle = new ModelObject12_21( -1, 0);
    ModelObject12_21 chosenObj = idle;
    
    RectButton check = new RectButton("kiểm tra", 588, 640, 25);
    
    void drawFloat(int temp) {
        if(temp == 0)
            return;
        if(temp > 2) {
            int seg = obj2.segment;
            stroke(0);
            noFill();
            line(x_cur + seg / 2, y_cur - 20, x_cur + temp * seg - seg / 2, y_cur - 20);
            arc(x_cur + seg / 2, y_cur - 20 + seg / 2, seg, seg, PI, 3 * PI / 2);
            arc(x_cur + temp * seg - seg / 2, y_cur - 20 + seg / 2, seg, seg, -PI / 2, 0);
        }
        strokeWeight(2);
        stroke(0);
        fill(0, 255, 0);
        rect(x_cur, y_cur, temp * obj2.segment, obj2.width, obj2.radio);
        
        rectMode(CENTER);
        fill(255);
        noStroke();
        textSize(30);
        rect(x_cur + temp * obj2.segment / 2, y_cur - 20, textWidth(str(temp)) + 10, 10);
        rectMode(CORNER);
        
        textAlign(CENTER);
        fill(0);
        textSize(30);
        text(temp, x_cur + temp * obj2.segment / 2, y_cur - 10);
        textSize(12);
        
        if(x_cur < x_tar) {
            x_cur += min(speed, x_tar - x_cur);
            return;
        }
        if(y_cur < y_tar) {
            y_cur += min(speed, y_tar - y_cur);
            return;
        }
        if(y_cur > y_tar) {
            y_cur -= min(speed, y_cur - y_tar);
            return;
        }
        if(x_cur > x_tar) {
            x_cur -= min(speed, x_cur - x_tar);
            return;
        }
    }
    
    void setup() {
        int imgSize = 100;
        
        move = 5;
        
        // object 1
        obj1 = new ModelObject12_21(0, 0);
        obj1.setPosition(x, y);
        obj1.setImage(loadImage("../data/img/egg1.png"), imgSize);
        
        // object 2
        obj2 = new ModelObject12_21(1, 0);
        obj2.setPosition(x, y + distance);
        obj2.setImage(loadImage("../data/img/egg2.png"), imgSize);
        
        // buttons
        addButton.add(new RectButton("+ 5", 775, 550, 20));
        addButton.add(new RectButton("+ 2", 700, 550, 20));
        addButton.add(new RectButton("+ 1", 625, 550, 20));
        
        subButton.add(new RectButton("- 1", 550, 550, 20));
        subButton.add(new RectButton("- 2", 475, 550, 20));
        subButton.add(new RectButton("- 5", 400, 550, 20));
        
        draw();
    }
    
    void draw() {
        if(counter > 0) {
            //println(counter);
            counter -= speed;
            if(counter < 0) {
                counter = 0;
            }
        }
        //draw objects
        obj1.draw();
        obj2.draw();
        
        textSize(220);
        text("}", 1000, 360);
        textSize(50);
        text(obj1.remain + obj2.remain, 1060, 310);
        textSize(12);
        
        //draw buttons
        for(RectButton button : addButton) {
            button.draw();
        }
        for(RectButton button : subButton) {
            button.draw();
        }
        check.draw();
        drawFloat(await);
        
        if(chosenObj.ordinal >= 0) {
            chosenObj.drawPointer();
        }
        //draw checking
        if(stage > 0) {
            switch(stage) {
                case 8 :
                    if(obj1.await < move) {
                        obj1.await ++;
                    } else {
                        stage = 9;
                    }
                    break;
                case 9 :
                    obj1.await = 0;
                    obj1.remain -= move;
                    await = move;
                    obj1.draw();
                    x_cur = obj1.x_end;
                    y_cur = obj1.y;
                    stage = 1;
                    break;
                case 1 :
                    x_tar = obj2.x_end;
                    y_tar = obj2.y;
                    if(x_cur == x_tar && y_cur == y_tar) {
                        stage = 2;
                    }
                    break;
                case 2 :
                    if(await > 0) {
                        obj2.await = await;
                        obj2.remain += await;
                        await = 0;
                    } else {
                        stage = 3;
                    }
                    break;
                case 3 :
                    if(obj2.await > 0) {
                        obj2.await --;
                    } else {
                        counter = delay;
                        stage = 4;
                    }
                    break;
                case 4 :
                    if(obj2.remain + 2 == obj1.remain) {
                        if(counter > 0) {
                            break;
                        } else {
                            answer = true;
                            stage = 0;
                        }
                    } else {
                        if(counter > 0) {
                            image(loadImage("../data/img/False.png"), 1060, 210, 240, 160);
                        } else {
                            stage = 5;
                        }
                    }
                    break;
                case 5 :
                    if(obj2.await < move) {
                        obj2.await ++;
                    } else {
                        stage = 6;
                    }
                    break;
                case 6 :
                    obj2.remain -= move;
                    obj2.await = 0;
                    await = move;
                    stage = 7;
                    break;
                case 7 :
                    x_tar = obj1.x_end;
                    y_tar = obj1.y;
                    if(x_cur == x_tar && y_cur == y_tar) {
                        obj1.await = await;
                        obj1.remain += await;
                        await = 0;
                        stage = 10;
                    }
                    break;
                case 10 :
                    if(obj1.await > 0) {
                        obj1.await --;
                    } else {
                        stage = 0;
                    }
                    break;
                case 11 :
                    if(counter > 0) {
                        image(loadImage("../data/img/False.png"), 1060, 210, 240, 160);
                    } else {
                        stage = 0;
                    }
            }
        }
    }
    
    void mousePressed() {
        if(stage > 0 || counter > 0) {
            return;
        }
        
        if(obj1.isClicked()) {
            chosenObj = obj1;
        }
        
        if(obj2.isClicked()) {
            chosenObj = obj2;
        }
        for(RectButton button : addButton) {
            if(button.clicked()) {
                int t = button.b_text.charAt(button.b_text.length() - 1) - '0';
                chosenObj.remain += t;
                if(chosenObj.remain > 30) {
                    chosenObj.remain = 30;
                }
            }
        }
        
        for(RectButton button : subButton) {
            if(button.clicked()) {
                int t = button.b_text.charAt(button.b_text.length() - 1) - '0';
                chosenObj.remain -= t;
                if(chosenObj.remain < 0) {
                    chosenObj.remain = 0;
                }
            }
        }
        
        if(check.clicked()) {
            if(obj1.remain + obj2.remain != 40) {
                counter = delay;
                stage = 11;
            } else {
                stage = 8;
            }
            
        }
    }
    
    void reset() {
        if(stage > 0) {
            return;
        }
        obj2.remain = obj1.remain = 0;
        chosenObj = idle;
        answer = false;
    }
    
    boolean isFinish() {
        return answer;
    }
}
class Question12_21 extends Question {
    MainModel12_21 model = new MainModel12_21();
    void setup() {
        super.setup();
        String quizText = "Có 40 quả trứng trong hai chiếc rổ. Nếu chuyển 5 quả trứng từ chiếc rổ thứ nhất sang rổ thứ hai thì rổ thứ nhất sẽ nhiều hơn rổ thứ hai 2 quả. Hỏi ban đầu rổ thứ hai có bao nhiêu quả trứng";
        quiz = new QuizText(quizText);
        model.setup();
    }
    
    void draw() {
        super.draw();
        model.draw();
        if(model.isFinish()) {
            super.finish(true);
        }
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
