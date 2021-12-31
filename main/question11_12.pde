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

class gameState_11_12{
    int current_1   , current_2 , current_5 ;
    int currentTotal; 
    int state ; 
    gameState_11_12(){
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
          if(i==1){
            this.current_1 += 1;
          }
          if(i==2){
            this.current_2 += 1; 
          }
          if(i==5){
            this.current_5 += 1;
          }
          this.currentTotal = current_1 + current_2 * 2 + current_5 * 5 ; 
          this.state = current_1*100 + current_2 * 10 + current_5 * 1;
    }


}

class MainModel11_12 {
    
    int x_start = 320;
    int y_start = 150;
    int segment = 100;
    int currentLine = 0 ;

    int TOTAL = 7 ; 
    Set<Integer> ANSWER = new HashSet<Integer>();
    ArrayList<gameState_11_12> gameState = new ArrayList<gameState_11_12>();

    ControlButton button_1 = new ControlButton("1 $", 350, 575, 20);
    ControlButton button_2 = new ControlButton("2 $", 500, 575, 20);
    ControlButton button_5 = new ControlButton("5 $", 650, 575, 20);
    ControlButton button_reset = new ControlButton("Reset", 800, 575, 20);
    // ControlButton button_solution = new ControlButton("đáp án", 1280, 100, 20);

    void setup() {
            ANSWER.add(700) ;
            ANSWER.add(510) ;
            ANSWER.add(320) ;
            ANSWER.add(201) ;
            ANSWER.add(130) ;
            ANSWER.add(011) ;
            gameState.add(new gameState_11_12());
    }

    void draw(){

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
        if(button_1.clicked()){
                 gameState.get(currentLine).increase(1);
        }
        if(button_2.clicked()){
                  gameState.get(currentLine).increase(2);
                 
        }
        if(button_5.clicked()){
                  gameState.get(currentLine).increase(5);
        }
        if(button_reset.clicked()) {
                 gameState.get(currentLine).reset();
        }
        if(gameState.get(currentLine).currentTotal==TOTAL){
                  int current_state = gameState.get(currentLine).state ;
                  if(ANSWER.contains(current_state)){
                        ANSWER.remove(current_state);
                        currentLine += 1 ; 
                        gameState.add(new gameState_11_12());
                       
                  }
                 
        }
    }
}

class Question11_12 extends Question {
  MainModel11_12 model = new MainModel11_12();
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
  }
}
