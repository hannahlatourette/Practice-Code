PVector x, v, a;

void setup() {
  size(800, 600);
  x = new PVector(width/2, height/2);
  v = new PVector(random(-1, 1), random(-1, 1));
  a = new PVector(0, 0);
}

void draw() {
  background(0);

  x.x += v.x;
  x.y += v.y;

  ellipse(x.x, x.y, 50, 50);

  if (dist(mouseX, mouseY, x.x, x.y)>25) {
    fill(0, 0, 200);
  } else {
    fill(100, 0, 100);
  }
} 

