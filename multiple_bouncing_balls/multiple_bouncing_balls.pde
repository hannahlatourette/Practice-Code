int ct = 100;
Ball[] clarence = new Ball[ct];


void setup() {
  size(800, 600);
  colorMode(HSB,360,100,100);
  for(int i = 0; i<ct; i++) {
  clarence[i] = new Ball();
  }
}

void draw() {
//  background(0);
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

  Ball() {
    y= new PVector(random(r,width),random(height/2)); 
    yc= new PVector(0,random(0.5));
    ya=new PVector(0, random(0.1,0.5));
    r= 10;
    h = random(360);
  }

  void display() {
    fill(h,99,99);
    ellipse(y.x, y.y, r, r);
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
  }

}

