class ModelObject12_20 {
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
    int segment = 14;
    int width = 40;
    
    //image
    PImage pointer = loadImage("../data/img/pointer.png");
    PImage img;
    int imgSize = 60;
    int x_img = 0;
    int y_img = 0;
    int radio = 10;
    
    ModelObject12_20(int _ordinal, int _remain) {
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
    
    void drawPointer() {
        draw();
        image(pointer, x_img - 3 * imgSize / 4, y_img + imgSize / 4, imgSize / 2, imgSize / 2);
    }
    
    void drawDiff() {
        fill(0);
        textAlign(CENTER);
        textSize(40);
        if(diff > 0) {
            text("+" + str(diff), x_end + await * segment + 30, y + 36);
        } else if(diff < 0) {
            text(str(diff), x_end + await * segment + 30, y + 36);
        }
        textSize(12);
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
        text(remain - await, x_start + (x_end - x_start) / 2, y + 30);
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
    
    void reset() {
        remain -= diff;
        diff = 0;
        await = 0;
    }
}

class MainModel12_20 {
    int counter = 0;
    int delay = 5;
    int speed = 4;
    
    int x = 340;
    int y = 200;
    int distance = 100;
    int dis = 30;
    
    //movement
    int x_cur = 0;
    int y_cur = 0;
    int x_tar = 0;
    int y_tar = 0;
    
    String state = "idle";
    int maxRange = 0;
    int minRange = 5;
    
    // all component
    ArrayList<ModelObject12_20> listObj = new ArrayList<ModelObject12_20>();
    ArrayList<RectButton> addButton = new ArrayList<RectButton>();
    ArrayList<RectButton> subButton = new ArrayList<RectButton>();
    
    {
        addButton.add(new RectButton("+ 5", 400, 550, 20));
        addButton.add(new RectButton("+ 2", 475, 550, 20));
        addButton.add(new RectButton("+ 1", 550, 550, 20));
        
        subButton.add(new RectButton("- 1", 625, 550, 20));
        subButton.add(new RectButton("- 2", 700, 550, 20));
        subButton.add(new RectButton("- 5", 775, 550, 20));
    }
    
    RectButton depart = new RectButton("Chuyển đi", 475, 650, 20);
    RectButton arrive = new RectButton("Chuyển đến", 700, 650, 20);
    
    // await
    ModelObject12_20 idle = new ModelObject12_20( -1, 100);
    ModelObject12_20 chosenObj = idle;
    int await = 0;
    
    void drawFloat(int temp) {
        if(temp > 2) {
            int seg = chosenObj.segment;
            stroke(0);
            noFill();
            line(x_cur + seg / 2, y_cur - 20, x_cur + temp * seg - seg / 2, y_cur - 20);
            arc(x_cur + seg / 2, y_cur - 20 + seg / 2, seg, seg, PI, 3 * PI / 2);
            arc(x_cur + temp * seg - seg / 2, y_cur - 20 + seg / 2, seg, seg, -PI / 2, 0);
        }
        strokeWeight(2);
        stroke(0);
        fill(0, 255, 0);
        rect(x_cur, y_cur, temp * chosenObj.segment, chosenObj.width, chosenObj.radio);
        
        rectMode(CENTER);
        fill(255);
        noStroke();
        textSize(30);
        rect(x_cur + temp * chosenObj.segment / 2, y_cur - 20, textWidth(str(temp)) + 10, 10);
        rectMode(CORNER);
        
        textAlign(CENTER);
        fill(0);
        textSize(30);
        text(temp, x_cur + temp * chosenObj.segment / 2, y_cur - 10);
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
        int imgSize = 80;
        
        // object 1
        ModelObject12_20 obj1 = new ModelObject12_20(0, 25);
        obj1.setPosition(x, y);
        obj1.setImage(loadImage("../data/img/bus1.png"), imgSize);
        
        // object 2
        ModelObject12_20 obj2 = new ModelObject12_20(1, 33);
        obj2.setPosition(x, y + distance);
        obj2.setImage(loadImage("../data/img/bus2.png"), imgSize);

        // object 3
        ModelObject12_20 obj3 = new ModelObject12_20(2, 23);
        obj3.setPosition(x, y + 2 * distance);
        obj3.setImage(loadImage("../data/img/bus3.png"), imgSize);
        
        //push in array
        listObj.add(obj1);
        listObj.add(obj2);
        listObj.add(obj3);
    }
    
    void draw() {
        if(counter > 0) {
            //println(counter);
            counter -= speed;
            if(counter < 0) {
                counter = 0;
            }
        }
        //draw buttons
        for(RectButton button : addButton) {
            button.draw();
        }
        for(RectButton button : subButton) {
            button.draw();
        }
        arrive.draw();
        depart.draw();
        
        //draw await
        if(state.equals("depart")) {
            drawFloat(await);
            if(x_tar == chosenObj.x_end && y_tar == chosenObj.y) {
                if(x_tar == x_cur && y_tar == y_cur) {
                    if(await > 0) {
                        x_tar += chosenObj.segment;
                        x_cur += chosenObj.segment;
                        chosenObj.remain ++;
                        await --;
                    } else {
                        chosenObj = idle;
                        state = "idle";
                    }
                }
            }
            
        }
        //draw objects
        if(!state.equals("idle")) {
            chosenObj.drawPointer();
        }
        for(ModelObject12_20 obj : listObj) {
            obj.draw();
            // if(!state.equals("depart")) {
            //     obj.drawDiff();
        // }
        }
    }
    
    void mousePressed() {
        //choose obj    
        for(ModelObject12_20 obj : listObj) {
            if(obj.isClicked()) {
                if(!state.equals("depart")) {
                    await = 0;
                    state = "chosen";
                } else {
                    x_tar = obj.x_end + dis;
                    y_tar = obj.y;
                    counter = max(abs(x_cur - x_tar), abs(y_cur - y_tar)) + delay;
                }
                chosenObj.await = 0;
                chosenObj = obj;
                maxRange = obj.remain - obj.hide;
                break;
            }
        }
        
        // add buttons
        for(RectButton button : addButton) {
            if(button.clicked() && state.equals("chosen") && await < maxRange - minRange) {
                int t = button.b_text.charAt(button.b_text.length() - 1) - '0';
                chosenObj.await += t;
                if(chosenObj.await > maxRange - minRange) {
                    chosenObj.await = maxRange - minRange;
                }
                await += t;
                if(await > maxRange - minRange) {
                    await = maxRange - minRange;
                }
                chosenObj.draw();
                x_cur = chosenObj.x_end;
                y_cur = chosenObj.y;
            }
        }
        
        // sub buttons
        for(RectButton button : subButton) {
            if(button.clicked() && state.equals("chosen") && await > 0) {
                int t = button.b_text.charAt(button.b_text.length() - 1) - '0';
                chosenObj.await -= t;
                if(chosenObj.await < 0) {
                    chosenObj.await = 0;
                }
                await -= t;
                if(await < 0) {
                    await = 0;
                }
                chosenObj.draw();
                x_cur = chosenObj.x_end;
                y_cur = chosenObj.y;
            }
        }
        
        if(state.equals("depart")) {
            if(arrive.clicked() && counter == 0) {
                chosenObj.diff += await;
                x_tar = chosenObj.x_end;
                y_tar = chosenObj.y;
                counter = max(abs(x_cur - x_tar), abs(y_cur - y_tar)) / speed + delay;
            }
        }
        if(state.equals("chosen") && await > 0) {
            if(depart.clicked() && counter == 0) {
                chosenObj.diff -= await;
                x_tar = chosenObj.x_end + dis;
                y_tar = chosenObj.y;
                state = "depart";
                chosenObj.remain -= await;
                chosenObj.await = 0;
                counter = max(abs(x_cur - x_tar), abs(y_cur - y_tar)) / speed + delay;
            }
        }
    }
    
    void reset() {
        if(counter == 0) {
            for(ModelObject12_20 obj : listObj) {
                obj.reset();
            }
            state = "idle";
            await = 0;
        }
    }
    
    boolean isFinish() {
        boolean res = true;
        for(ModelObject12_20 obj : listObj) {
            if(obj.remain != listObj.get(0).remain) {
                res = false;
            }
        }
        return res;
    }
}
class Question12_20 extends Question {
    MainModel12_20 model = new MainModel12_20();
    void setup() {
        super.setup();
        String quizText = "Ba chiếc rổ A, B, C lần lượt đựng 25, 33, 23 quả cam. Hỏi em có thể sắp xếp lại như thế nào để số cam trong mỗi rổ là như nhau?";
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
