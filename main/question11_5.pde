class Item {

  int _x, _y, _w, _h;
  int _xOffset;
  int _yOffset;
  int _boundOffset = 10;
  PImage _image;
  boolean locked = false;
  Item(int x, int y, int w, int h, String path) {
    _x = x;
    _y = y;
    _image = loadImage(path);
    _w = w;
    _h = h;
    _image.resize(_w, _h);
    _xOffset = _image.width / 2;
    _yOffset = _image.height / 2;
  }

  void draw() {
    image(_image, _x, _y);
    //fill(0);
    //rect(_x + _boundOffset, _y + _boundOffset, _w - 2 *_boundOffset, _h - 2 * _boundOffset);

  }

  void moveTo(int x1, int y1) {
    _x = x1;
    _y = y1;
  }

  boolean mouseOver() {
    if (mouseX > _x + _boundOffset && mouseX < _x + _image.width - _boundOffset && mouseY > _y + _boundOffset && mouseY < _y + _image.height - _boundOffset)
      return true;
    else
      return false;
  }

  void setPosition(int x, int y) {
    _x = x;
    _y = y;
  }

  void mousePressed() {
    if (mouseOver()) {
      locked = true;
      _xOffset = mouseX - _x;
      _yOffset = mouseY - _y;
    } else {
      locked = false;
    }
  }
  void mouseDragged() {
    if (locked && mouseX > 0 && mouseX < 1366 && mouseY > 0 && mouseY < 768) {
      _x = mouseX - _xOffset;
      _y = mouseY - _yOffset;
    }
  }
  void mouseReleased() {
    locked = false;
  }
}
class Box {
  int _x, _y, _w, _h;
  color _color;
  PImage _image;

  Box(int x, int y, int w, int h, color col) {
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    _color = col;
    _image = loadImage("../data/img/question11_5/cart.png");
    _image.resize(_w * 2, _h  * 2);
  }

  void draw() {
    //stroke(_color);
    //fill(255, 255, 255);
    //rect(_x, _y, _w, _h);
    image(_image, _x - _w / 2, _y);
  }
}

class Box_item {
  ArrayList<Box> boxList = new ArrayList<Box>();
  ArrayList<Item> itemList = new ArrayList<Item>();
  int[] itemPosition = new int[10];
  boolean[] printSolve = new boolean[10];
  PImage[] resultImg = new PImage[6];
  int result_img_size = 0;
  boolean finished = false;
  boolean watchingSolve = false;

  Box_item() {
    boxList.add(new Box(300, 200, 100, 100, #ffe605));
    boxList.add(new Box(450, 300, 100, 100, #ff2b05));
    boxList.add(new Box(600, 400, 100, 100, #09ff05));
    itemList.add(new Item(980, 130, 120, 120, "../data/img/question11_5/pop_candy.png"));
    itemList.add(new Item(980, 330, 120, 120, "../data/img/question11_5/candy_2.png"));
    itemList.add(new Item(980, 530, 120, 120, "../data/img/question11_5/candy_3.png"));
    resultImg[0] = loadImage("../data/img/question11_5/result_0.png");
    resultImg[1] = loadImage("../data/img/question11_5/result_1.png");
    resultImg[2] = loadImage("../data/img/question11_5/result_2.png");
    resultImg[3] = loadImage("../data/img/question11_5/result_3.png");
    resultImg[4] = loadImage("../data/img/question11_5/result_4.png");
    resultImg[5] = loadImage("../data/img/question11_5/result_5.png");
    result_img_size = 150;
    for (int i = 0; i < 6; ++ i) {
      itemPosition[i] = 0;
      printSolve[i] = false;
      resultImg[i].resize(result_img_size, result_img_size);
    }
  }
  boolean doOverlap(int l1x, int l1y, int r1x, int r1y, int l2x, int l2y, int r2x, int r2y) {
    if (l1x == r1x || l1y == r1y || l2x == r2x
        || l2y == r2y) {
        return false;
    }
    if (l1x >= r2x || l2x >= r1x)
        return false;
    if (r1y <= l2y || r2y <= l1y)
        return false;
    return true;
  }

  void getSolve() {
    watchingSolve = true;
    for (int i = 0; i < 6; ++ i) {
      printSolve[i] = true;
    }
  }
  void draw() {
    stroke(#2bff00);
    fill(255, 255, 255);
    rect(790, 140, 480, 500);
    int count = 0;
    for (int i = 0; i < 6; ++ i) {
      if (printSolve[i]) {
        ++ count;
        drawResult(i);
      }
    }
    if (count == 6 && watchingSolve == false)
      finished = true;
    for (int i = 0; i < itemList.size(); ++ i) {
      itemList.get(i).draw();
    }
    for (int i = 0; i < boxList.size(); ++ i) {
      boxList.get(i).draw();
    }
    
  }

  void mousePressed() {
    for (int i = 0; i < itemList.size(); ++ i) {
      itemList.get(i).mousePressed();
    }
  }

  void moveItemToBox() {
    Item item;
    Box box;
    int l1x, l1y, r1x, r1y, l2x, l2y, r2x, r2y;
    for (int i = 0; i < boxList.size(); ++ i) 
      for (int j = 0; j < itemList.size(); ++ j) {
        item = itemList.get(j);
        box = boxList.get(i);
        l1x = item._x;
        l1y = item._y;
        r1x = l1x + item._w;
        r1y = l1y + item._h;
        l2x = box._x;
        l2y = box._y;
        r2x = l2x + box._w;
        r2y = l2y + box._h;
        if (doOverlap(l1x, l1y, r1x, r1y, l2x, l2y, r2x, r2y)) {
          item.moveTo(l2x, l2y);
          itemPosition[j] = i;
        } else {
          if (itemPosition[j] == i)
            itemPosition[j] = -1;
        }
        
      }
  }

  void checkItemCollision() {
    Item item_1, item_2, item;
    int l1x, l1y, r1x, r1y, l2x, l2y, r2x, r2y;
    int newx, newy;
    for (int i = 0; i < itemList.size() - 1; ++ i) {
      for (int j = i + 1; j < itemList.size(); ++ j) {
        item_1 = itemList.get(i);
        item_2 = itemList.get(j);
        l1x = item_1._x + item_1._boundOffset;
        l1y = item_1._y + item_1._boundOffset;
        r1x = l1x + item_1._w - 2 * item_1._boundOffset;
        r1y = l1y + item_1._h - 2 * item_1._boundOffset;
        l2x = item_2._x + item_2._boundOffset;
        l2y = item_2._y + item_2._boundOffset;
        r2x = l2x + item_2._w - 2 * item_2._boundOffset;
        r2y = l2y + item_2._h - 2 * item_2._boundOffset;
        if (doOverlap(l1x, l1y, r1x, r1y, l2x, l2y, r2x, r2y)) {
          if (item_2.locked)
            item = item_1;
          else 
            item = item_2;
          newy =  item._y - item._h;
          newx = item._x + item._w;
          if (newy < 0)
            newy = (int) (Math.random() * 768);
          if (newx > 1300)
            newx = (int) (Math.random() * 1300);
          item.moveTo(newx, newy);
        }
      }
    }
  }

  void reset() {
    for (int i = 0; i < 6; ++ i)
      printSolve[i] = false;
    watchingSolve = false;
    itemList.get(0).setPosition(980, 130);
    itemList.get(1).setPosition(980, 330);
    itemList.get(2).setPosition(980, 530);
  }

  void drawResult(int num) {
    int x = 800 + (int) (num % 2) * result_img_size * 2;
    int y = 150 + (int) (num / 2) * result_img_size;
    image(resultImg[num], x, y);
  }

  void mouseReleased() {
    checkItemCollision();
    moveItemToBox();
    if (itemPosition[0] == 0 && itemPosition[1] == 1 && itemPosition[2] == 2)
      printSolve[0] = true;
    if (itemPosition[0] == 0 && itemPosition[1] == 2 && itemPosition[2] == 1)
      printSolve[1] = true;
    if (itemPosition[0] == 1 && itemPosition[1] == 0 && itemPosition[2] == 2)
      printSolve[2] = true;
    if (itemPosition[0] == 1 && itemPosition[1] == 2 && itemPosition[2] == 0)
      printSolve[3] = true;
    if (itemPosition[0] == 2 && itemPosition[1] == 0 && itemPosition[2] == 1)
      printSolve[4] = true;
    if (itemPosition[0] == 2 && itemPosition[1] == 1 && itemPosition[2] == 0)
      printSolve[5] = true;

    for (int i = 0; i < itemList.size(); ++ i) {
      itemList.get(i).mouseReleased();
    }
    
  }

  void mouseDragged() {
    for (int i = 0; i < itemList.size(); ++ i) {
      itemList.get(i).mouseDragged();
    }
  }

}
class Question11_5 extends Question {
  Box_item box_item = new Box_item();
  RectButton getSolve = new RectButton("Xem hướng dẫn", 80, 150);
  
  void setup() {
    super.setup();
    String quizText = "Em hãy xếp những gói kẹo vào giỏ theo những cách khác nhau nhé";
    quiz = new QuizText(quizText);
  }
  
  void draw() {
    super.draw();
    getSolve.draw();
    box_item.draw();
    if (box_item.finished)
      finish(true);
  }
  
  void mousePressed() {
    super.mousePressed();
    if (getSolve.clicked()) {
      box_item.getSolve();
    }
    box_item.mousePressed();
  }
  void mouseReleased() {
    super.mouseReleased();
    box_item.mouseReleased();
  }
  void mouseDragged() {
    super.mouseDragged();
    box_item.mouseDragged();
  }

  void reset() {
    super.reset();
    box_item.finished = false;
    box_item.reset();
  }
}
