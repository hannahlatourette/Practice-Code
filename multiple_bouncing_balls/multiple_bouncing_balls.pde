int ct = 100;
Ball[] clarence = new Ball[ct];


void setup() {
  size(800, 600);
  colorMode(HSB,360,100,100,100);
  for(int i = 0; i<ct; i++) {
  clarence[i] = new Ball();
  }
}

void draw() {
  background(0);
  noStroke();
  for (int i = 0; i<ct; i++) {
  clarence[i].display();
  clarence[i].move();
  clarence[i].bounce();
  }
//  text(y, 200, 100);
} 

class Ball {
  PVector y; 
  PVector yc;
  PVector ya;
  float r;
  float h;
  float s;
  float t;

  Ball() {
    y= new PVector(random(r,width),random(height/2)); 
    yc= new PVector(random(1,5),random(0.5));
    ya=new PVector(0, random(0.1,0.5));
    r= 10;
    h = random(360);
    s = random(40,60);
    t = 30;
  }

  void display() {
    fill(h,99,99,t);
    ellipse(y.x, y.y, s, s);
  }

  void move() {
    yc.add(ya);
    y.add(yc);
  }

  void bounce() {
    if (y.y+25>height) {
      y.y=height-25;
      yc.mult(-1);
    }
    if(y.x<s || y.x>width-s) {
     yc.x*=-1; 
    } 
  }

}

