int count = 15;
float[] h = new float[count];

int r = 20;

PVector[] x = new PVector[count];
PVector[] v = new PVector[count];
PVector[] a = new PVector[count];

void setup() {
  size(800, 600);
  colorMode(HSB,360,100,100);
  for (int i = 0; i < count; i++) {
    x[i] = new PVector(random(2*r, (width-2*r)), random(20, (600)));
    v[i] = new PVector(random(-2, 2), random(-2, 2));
    a[i] = new PVector(0, 0);

    h[i] = random(360);

  }
}

void draw() {
  background(0,0,99);
  noStroke();
  for (int i = 0; i<count; i++) {
    //    v[i].x += a[i].x;
    //    v[i].y += a[i].y;

    x[i].x += v[i].x;
    x[i].y += v[i].y;


    fill(h[i],99,99);
    for (int j = 0; j<count; j++) {
      if (i != j) {
        if (x[i].dist(x[j]) < 2*r) {        //collision
          h[i] = ((h[i]+h[j])/2); 
          print(i+" & "+j+" collision  ");
          v[i].x *= -1;
          v[i].y *= -1;
        }
        ellipse(x[i].x, x[i].y, 2*r, 2*r); //drawing ellipses
      } // i != j
      if (x[i].x<r || x[i].x>width-r) {
        v[i].x *= -1;
      }
      if (x[i].y<r || x[i].y>height-r) {
        v[i].y *= -1;
      }
    }
  }
}

void mousePressed() {
  redraw();
} 

