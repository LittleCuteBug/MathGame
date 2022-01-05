import java.util.Set;
import java.util.HashSet;
class ControlButton extends RectButton{
    int linhtinh;
    
    ControlButton(String _text, float _x, float _y) {
        super(_text, _x, _y, 15.0, 10.0, 10.0);
    }
    
    ControlButton(String _text, float _x, float _y, float _text_size) {
        super(_text, _x, _y, _text_size, _text_size * 0.8, _text_size * 0.8);
    }
}
class Robot{
    int x = 0 ; 
    int y = 0 ;
    int armAngle = 0;
    int angleChange = 5;
    final int ANGLE_LIMIT = 135;

    void setup()
    {
      // smooth();
      // frameRate(30);
    }

    void draw()
    {
      // background(255);
      pushMatrix();
      translate(50+x, 50+y); // place robot so arms are always on screen
      drawRobot();
      armAngle += angleChange;

      // if the arm has moved past its limit,
      // reverse direction and set within limits.
      if (armAngle > ANGLE_LIMIT || armAngle < 0)
      {
        angleChange = -angleChange;
        armAngle += angleChange;
      }
      popMatrix();
    }

    void drawRobot()
    {
      translate(850, 300);
      noStroke();
      fill(38, 38, 200);
      rect(20+x, 0+y, 38, 30); // head
      rect(14+x, 32+y, 50, 50); // body
      drawLeftArm();
      drawRightArm();
      rect(22+x, 84+y, 16, 50); // left leg
      rect(40+x, 84+y, 16, 50); // right leg

      fill(222, 222, 249);
      ellipse(30+x, 12+y, 12, 12); // left eye
      ellipse(47+x, 12+y, 12, 12);  // right eye
    }

    void drawLeftArm()
    {
      pushMatrix();
      translate(12, 32);
      rotate(radians(armAngle));
      rect(-12+x, 0+y, 12, 37); // left arm
      popMatrix();
    }

    void drawRightArm()
    {
      pushMatrix();
      translate(66, 32);
      rotate(radians(-armAngle));
      rect(0+x, 0+y, 12, 37); // right arm
      popMatrix();
    }

}
class gameState_11_16{
    int current_1   , current_2 , current_5 ;
    int currentTotal; 
    int state ; 
    gameState_11_16(){
      this.current_1 = 0 ;
      this.current_2 = 0 ;
      this.current_5 = 0 ; 
      this.currentTotal = 0 ; 
      this.state = 0;
    }

    void reset(){
      this.current_1 = 0 ;
      this.current_2 = 0 ;
      this.current_5 = 0 ; 
      this.currentTotal = 0 ; 
      this.state = 0 ;
    }

    void increase(int i){
          if(i==1 && this.current_1 <7){
            this.current_1 += 1;
          }
          if(i==2 && this.current_2 <3){
            this.current_2 += 1; 
          }
          if(i==5 && this.current_5 <1){
            this.current_5 += 1;
          }
          this.currentTotal = current_1 + current_2 * 2 + current_5 * 5 ; 
          this.state = current_1*100 + current_2 * 10 + current_5 * 1;
    }
}

class MainModel11_16 {
    
    int x_start = 320;
    int y_start = 150;
    int segment = 100;
    int currentLine = 0 ;
    boolean FINISHED = false;
    Robot robot = new Robot();
    int TOTAL = 7 ; 
    Set<Integer> ANSWER = new HashSet<Integer>();
    ArrayList<gameState_11_16> gameState = new ArrayList<gameState_11_16>();

    ControlButton button_1 = new ControlButton("1 $", 350, 575, 20);
    ControlButton button_2 = new ControlButton("2 $", 500, 575, 20);
    ControlButton button_5 = new ControlButton("5 $", 650, 575, 20);
    ControlButton button_reset = new ControlButton("Đi lại", 800, 575, 20);
    // ControlButton button_solution = new ControlButton("đáp án", 1280, 100, 20);

    void setup() {
            ANSWER.add(700) ;
            ANSWER.add(510) ;
            ANSWER.add(320) ;
            ANSWER.add(201) ;
            ANSWER.add(130) ;
            ANSWER.add(11)  ;
            gameState.add(new gameState_11_16());
    }

    void draw(){

        if(FINISHED){
          textSize(56);
          text("CONGRATS", 850, y_start+50);
        }
        robot.setup();
        robot.draw();
        noFill();
        stroke(0);
        strokeWeight(1);
        textAlign(CENTER);

        for(int i = 0; i < 4; i ++) {
            for(int j = 0; j < 7; j ++) {
                      if(j==0){
                        fill(255,0,0,191);
                      }
                      else {
                        noFill();
                      }
                      rect(x_start + segment*i, y_start + segment* j /2, segment, segment/2);
                    }
        }
        textSize(28);
        fill(0,0,255);
        text("Số tờ 1$", x_start, y_start, segment, segment/2);
        text("Số tờ 2$", x_start+segment, y_start, segment, segment/2);
        text("Số tờ 5$", x_start+segment*2, y_start, segment, segment/2);
        text("Tổng", x_start+segment*3, y_start, segment, segment/2);
        noFill();

        textAlign(CENTER);
        for(int i=0; i < gameState.size();i++){
            text(str(gameState.get(i).current_1), x_start+segment*0 + 5, (int)y_start+segment*(i+1)/2, (float)segment, (float)segment/2);
            text(str(gameState.get(i).current_2), x_start+segment*1 + 5, (int)y_start+segment*(i+1)/2, (float)segment, (float)segment/2);
            text(str(gameState.get(i).current_5), x_start+segment*2 + 5, (int)y_start+segment*(i+1)/2, (float)segment, (float)segment/2);
            text(str(gameState.get(i).currentTotal), x_start+segment*3 + 5, (int)y_start+segment*(i+1)/2, (float)segment, (float)segment/2);
        }        

        stroke(0, 255, 0);
        strokeWeight(8);
        line(x_start-20,y_start + segment*(currentLine+1)/2,x_start-20 , y_start+segment*(currentLine+1)/2+segment/2);
        button_1.draw();
        button_2.draw();
        button_5.draw();
        button_reset.draw();
        // button_solution.draw();
    }
    void mousePressed() {
        if(button_1.clicked() && FINISHED==false){
                 gameState.get(currentLine).increase(1);
        }
        if(button_2.clicked() && FINISHED==false){
                  gameState.get(currentLine).increase(2);
                 
        }
        if(button_5.clicked() && FINISHED==false){
                  gameState.get(currentLine).increase(5);
        }
        if(button_reset.clicked() && FINISHED==false) {
                 gameState.get(currentLine).reset();
        }
        if(gameState.get(currentLine).currentTotal==TOTAL){
                  int current_state = gameState.get(currentLine).state ;
                  if(ANSWER.contains(current_state)){
                        ANSWER.remove(current_state);
                        if(ANSWER.size()!=0){
                            currentLine += 1 ; 
                            gameState.add(new gameState_11_16());
                        }
                  }
                  if(ANSWER.size()==0){
                    FINISHED = true;  
                  }
        }
    }
    void reset(){
        FINISHED = false ; 
        gameState.clear();
        ANSWER.clear();
        currentLine = 0;
        setup();
    }
}

class Question11_16 extends Question {
  MainModel11_16 model = new MainModel11_16();
  void setup() {
    super.setup();
    String quizText = "Hãy tạo ra các cách để có được tổng số tiền là 7 từ các tờ tiền giá trị 1 đô, 2 đô và 5 đô ?";
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
    if(model.FINISHED==true){
      finish(true);
    }
  }
  void reset(){
    super.reset() ; 
    model.reset() ;
  }
}
