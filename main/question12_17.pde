class ModelObject {
    // element
    int ordinal = 0;
    int remain = 0;
    int await = 0;
    int hide = 80;
    
    //to draw
    int x_start = 0;
    int x_end = 0;
    int y = 0;
    int segment = 14;
    int width = 50;
    
    //image
    PImage img;
    int imgSize = 100;
    int x_img = 0;
    int y_img = 0;
    
    ModelObject(int _ordinal, int _remain) {
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
        rect(x_start, y, x_end - x_start, width);
        fill(0, 255, 0);
        rect(x_end, y, await * segment, width);
        
        x_img = x_start - imgSize - 10;
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
}

class MainModel12_17 {
    int counter = 0;
    int delay = 5;
    int speed = 4;
    
    int x = 300;
    int y = 200;
    int distance = 100;
    int dis = 20;
    
    //movement
    int x_cur = 0;
    int y_cur = 0;
    int x_tar = 0;
    int y_tar = 0;
    
    String state = "idle";
    // all component
    ArrayList<ModelObject> listObj = new ArrayList<ModelObject>();
    RectButton add = new RectButton("Thêm", 300, 600, 20);
    RectButton sub = new RectButton("Bớt", 400, 600, 20);
    RectButton depart = new RectButton("Rời", 500, 600, 20);
    RectButton arrive = new RectButton("Đi", 500, 600, 20);
    
    // await
    ModelObject chosenObj = new ModelObject(0, 100);
    int await = 0;
    
    void drawFloat(int temp) {
        stroke(0);
        fill(0, 255, 0);
        rect(x_cur, y_cur, temp * chosenObj.segment, chosenObj.width);
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
        PImage img = loadImage("../data/img/menuBG.jpg");
        // object 1
        ModelObject hotel1 = new ModelObject(0, 120);
        hotel1.setPosition(x, y);
        hotel1.setImage(img, imgSize);
        
        // object 2
        ModelObject hotel2 = new ModelObject(1, 98);
        hotel2.setPosition(x, y + distance);
        hotel2.setImage(img, imgSize);
        
        //object 3
        
        ModelObject hotel3 = new ModelObject(1, 98);
        hotel3.setPosition(x, y + 2 * distance);
        hotel3.setImage(img, imgSize);
        
        //push in array
        listObj.add(hotel1);
        listObj.add(hotel2);
        listObj.add(hotel3);
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
        add.draw();
        sub.draw();
        if(state.equals("depart")) {
            arrive.draw();
        }
        if(state.equals("chosen") && await > 0) {
            depart.draw();
        }
        
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
                        state = "idle";
                    }
                }
            }
            
        }
        //draw objects
        for(ModelObject obj : listObj) {
            obj.draw();
        }
    }
    
    void mousePressed() {
        //choose obj    
        for(ModelObject obj : listObj) {
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
                break;
            }
        }
        
        if(add.clicked() && state.equals("chosen") && await < chosenObj.remain - chosenObj.hide) {
            chosenObj.await ++;
            await ++;
            x_cur = chosenObj.x_end;
            y_cur = chosenObj.y;
        }
        
        if(sub.clicked() && state.equals("chosen") && await > 0) {
            chosenObj.await --;
            await --;
            x_cur = chosenObj.x_end;
            y_cur = chosenObj.y;
        }
        
        if(state.equals("depart")) {
            if(arrive.clicked() && counter == 0) {
                x_tar = chosenObj.x_end;
                y_tar = chosenObj.y;
                counter = max(abs(x_cur - x_tar), abs(y_cur - y_tar)) / speed + delay;
            }
        }
        if(state.equals("chosen") && await > 0) {
            if(depart.clicked() && counter == 0) {
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
        
    }
}
class Question12_17 extends Question {
    MainModel12_17 model = new MainModel12_17();
    void setup() {
        super.setup();
        String quizText = "12_17";
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
    
    void reset() {
        super.reset();
        model.reset();
    }
}
