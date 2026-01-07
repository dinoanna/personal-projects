public class Ball {  //<>//
  PVector pos, vel, acc;
  color col;
  int numBall;
  boolean onBoard = true;
  boolean isStriped;
  final double m = 0.16; //kilograms
  final double mu = 0.06;
  final double G = 1.07; 
  
  public Ball(float x, float y, boolean stripe, color c, int num){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    isStriped = stripe;
    col = c;
    numBall = num;
  }

  public Ball(float x, float y, boolean stripe, int num) { //constructor
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    isStriped = stripe;
    numBall = num;
    col = color(random(255), random(255), random(255));
    if (col == color(41, 163, 33)) {
      col = color(244, 7, 7);
    }
    //restrict green color from appearing and camouflage into background
  }
  
  // for testing purposes
  public Ball(float x, float y, float vx, float vy, boolean stripe, int num) { //constructor
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
    acc = new PVector(0, 0);
    isStriped = stripe;
    numBall = num;
    col = color(random(255), random(255), random(255));
    if (col == color(41, 163, 33)) {
      col = color(244, 7, 7);
    }
    //restrict green color from appearing and camouflage into background
  }
  
  void fixOverlap(Ball other){
    float overlap = 2*r - this.pos.dist(other.pos);
    float dx = other.pos.x - this.pos.x;
    float dy = other.pos.y - this.pos.y;
    PVector fixOther = new PVector(dx, dy).normalize().mult(overlap/2);
    PVector fixThis = new PVector(-dx, -dy).normalize().mult(overlap/2);
    other.pos.add(fixOther);
    pos.add(fixThis);
  }
  
  

  void collide(Ball other){
    fixOverlap(other);
     
    float dx = other.pos.x - this.pos.x;
    float dy = other.pos.y - this.pos.y;
    float angle = atan2(dy,dx);
    this.vel.rotate(-angle);
    other.vel.rotate(-angle);
    float temp = this.vel.x;
    this.vel.x = other.vel.x;
    other.vel.x = temp;
    this.vel.rotate(angle);
    other.vel.rotate(angle);
        
  }

  void move() {
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);
    
    
    if (bounceCheck()){
       // bouncing
      if (pos.x>=width-border-sideBar-r||pos.x<=border+r) { 
        vel.x *= -1;
      }
      if (pos.y>=height-border-r-scoreBar||pos.y<=border+r) {
        vel.y *= -1;
      }
      
      // preventing high velocity balls from drawing on the border
      if (pos.x < r+border){ pos.x = r+border; }
      if (pos.x > width-border-sideBar-r){ pos.x = width-border-sideBar-r; }
      if (pos.y < r+border){ pos.y = r+border; }
      if (pos.y > height-border-r-scoreBar){ pos.y = height-border-r-scoreBar; } 
    }
    

  }
  
  PVector getForce(){
    double mag = mu * m * G;
    PVector force = PVector.mult(vel, -1);
    force.normalize();
    force.mult( (float) mag );
    return force;
  }


  void applyFriction(PVector f) {
    f.div((float)m);
    acc.add(f);
  }

  void getShape() {
    if (onBoard) {
      // outer circle
      stroke(0);
      fill(col);
      circle(pos.x, pos.y, (float)r*2);
      //inner circle
      fill(255);
      noStroke();
      circle(pos.x, pos.y, (float)r);
      // number
      textSize(12);
      fill(0);
      text(numBall, pos.x, pos.y+r/4);
      if (isStriped){
        stroke(0);
        fill(255);
        arc(pos.x, pos.y, (float)r*2, (float)r*2, PI/4, 3*PI/4, OPEN);
        arc(pos.x, pos.y, (float)r*2, (float)r*2, 5*PI/4, 7*PI/4, OPEN);
      }
    }
  }
  
  void getShape(float x, float y) {
    if (onBoard) {
      // outer circle
      stroke(0);
      fill(col);
      circle(x, y, (float)r*2);
      //inner circle
      fill(255);
      noStroke();
      circle(x, y, (float)r);
      // number
      textSize(12);
      fill(0);
      text(numBall, x, y+r/4);
      if (isStriped){
        stroke(0);
        fill(255);
        arc(x, y, (float)r*2, (float)r*2, PI/4, 3*PI/4, OPEN);
        arc(x, y, (float)r*2, (float)r*2, 5*PI/4, 7*PI/4, OPEN);
      }
    }
  }

  void goal() {
    onBoard = false;
  }
  
  boolean isOverlapping(Ball other){
    double dist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
    return dist < 2*r;
  }
  
  void setV(float x, float y) {
    vel.set(x,y);
  }
  
  void setV(PVector v) {
    vel = v;
  }
  
  PVector getP() {
    return pos;
  }
  
  void setOnBoard(boolean b){
    onBoard = b;
  }
  
  void setP(float x, float y){
    pos = new PVector(x,y);
  }

  PVector getV() {
    return vel;
  }
  
  boolean isOnBoard(){
    return onBoard;
  }
  
  boolean isStriped(){
    return isStriped;
  }
  
  boolean bounceCheck(){
    float x = pos.x;
    float y = pos.y;
    boolean mid = x > 522 && x < 578;
    boolean corner = (x < 85 || x > 1015) && (y < 85 || y > 515);
    return !(mid || corner);
  }
  
  void changeOnBoard(){
    float x = pos.x;
    float y = pos.y;
    boolean mid =  x > 522 && x < 578 && (y <= border || y >= border + boardHeight);
    boolean left = x > 50 && x < 85 && (y < -x + 135 || y > x + 456);
    boolean right = x > 1015 && x < 1050 && (y < x - 965 || y > -x + 1565);
    if (mid || left || right) {
      onBoard = false;
    }
  }
  
  int getNum(){
    return numBall;
  }
  
}
