float y; 
float yc;
float ya;
float r;

void setup() {
  size(800, 600);
  clarence = new GravityBall();
}

void draw() {
  background(255);
  fill(0); 


  fill(0);
  text(y, 200, 100);
} 

class Ball {
  y=-0; 
  yc=0;
  ya=0.2;
  r= 50;
}

void display {
  ellipse(width/2, y, r, r);
}

void move {
  yc+=ya;
  y+=yc;
}

void bounce {
  if (y+25>height) {
    y=height-25;
    yc=-abs(yc);
  }
} 

