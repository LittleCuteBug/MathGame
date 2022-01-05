import java.util.Set;
import java.util.HashSet;
class gameState_11_14{
    int current_1   , current_2 , current_5 ;
    int currentTotal; 
    int state ; 
    gameState_11_14(){
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
          if(i==1 && this.current_1 <1){
            this.current_1 += 1;
          }
          if(i==2 && this.current_2 <1){
            this.current_2 += 1; 
          }
          if(i==5 && this.current_5 <1){
            this.current_5 += 1;
          }
          this.currentTotal = current_1 * 100 + current_2 * 20 + current_5 * 50 ; 
          this.state = current_1*100 + current_2 * 10 + current_5 * 1;
    }
}

class MainModel11_14 {
    
    int x_start = 320;
    int y_start = 180;
    int segment = 100;
    int currentLine = 0 ;
    boolean FINISHED = false;
    Robot robot = new Robot();
    Set<Integer> ANSWER = new HashSet<Integer>();
    ArrayList<gameState_11_14> gameState = new ArrayList<gameState_11_14>();

    ControlButton button_1 = new ControlButton("100", 350, 640, 20);
    ControlButton button_2 = new ControlButton("20", 500, 640, 20);
    ControlButton button_5 = new ControlButton("50", 650, 640, 20);
    ControlButton button_reset = new ControlButton("Đi lại", 800, 640, 20);
    // ControlButton button_solution = new ControlButton("đáp án", 1280, 100, 20);

    void setup() {
        robot.setup();
        gameState.add(new gameState_11_14());
    }

    void draw(){
        robot.draw();
        noFill();
        stroke(0);
        strokeWeight(1);
        textAlign(CENTER);

        for(int i = 0; i < 4; i ++) {
            for(int j = 0; j < currentLine+2; j ++) {
                      if(j==0){
                        fill(255,0,0,120);
                      }
                      else {
                        noFill();
                      }
                      rect(x_start + segment*i, y_start + segment* j /2, segment, segment/2);
                    }
        }
        textSize(28);
        fill(0,0,255);
        text("100 xu", x_start, y_start, segment, segment/2);
        text("20 xu", x_start+segment, y_start, segment, segment/2);
        text("50 xu", x_start+segment*2, y_start, segment, segment/2);
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
        if(ANSWER.contains(gameState.get(currentLine).currentTotal)==false && gameState.get(currentLine).currentTotal !=0){
                  ANSWER.add(gameState.get(currentLine).currentTotal) ; 
                  if(ANSWER.size()==7){
                    FINISHED = true;  
                  }
                  if(FINISHED==false){
                       currentLine += 1 ; 
                      gameState.add(new gameState_11_14());
                  }
        }
    }
    void reset(){
        FINISHED = false ; 
        gameState.clear();
        ANSWER.clear();
        currentLine = 0;
        gameState.add(new gameState_11_14());
    }
}

class Question11_14 extends Question {
  MainModel11_14 model = new MainModel11_14();
  void setup() {
    super.setup();
    String quizText = "Wilfred có 3 con tem với  giá là 20 xu , 50 xu và 100 xu. Em tạo ra các mức bưu phí khác nhau từ 3 con tem trên ?";
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
    super.reset();
    model.reset();
  }

}
