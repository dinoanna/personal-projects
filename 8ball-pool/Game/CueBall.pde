public class CueBall extends Ball {

  public CueBall(float x, float y) { //constructor
    super(x, y, false, -1);
  }
  
  void getShape(){
    if (isOnBoard()){
      fill(255);
      stroke(0);
      circle(getP().x, getP().y, (float)r*2);
    }
  }
  
  void reset(float x, float y){
    setP(x, y);
    setV(0,0);
    setOnBoard(true);
  }
  
}
