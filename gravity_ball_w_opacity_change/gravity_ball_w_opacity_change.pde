float y; 
float yc;
float ya;

void setup() {
  size(800, 600);
  y=-0; 
  yc=0;
  ya=0.2;
}

void draw() {
  background(255);
  fill(0);
  ellipse(width/2, y, 50, 50);
  yc+=ya;
  y+=yc;

  if (y+25>height) {
    y=height-25;
    yc=-abs(yc);
  }
  fill(0);
  text(y, 200, 100);
} 

