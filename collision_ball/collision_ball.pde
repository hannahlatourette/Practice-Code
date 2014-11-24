<<<<<<< HEAD
PVector x, v, a;
PVector x2, v2, a2;

void setup() {
  size(500, 300);
  x = new PVector(60, 60);
  v = new PVector(random(3, 5), random(3, 5));
  a = new PVector(0.1, 0.25);

  x2 = new PVector(width-10, height-10);
  v2 = new PVector(random(-5, -3), random(-5, -3));
  a2 = new PVector(0.1, 0.25);
=======
int count = 15;
int r = 10;

PVector[] x = new PVector[count];
PVector[] v = new PVector[count];
PVector[] a = new PVector[count];

void setup() {
  size(800, 600);
  for (int i = 0; i < count; i++) {
    x[i] = new PVector(random(2*r, (width-2*r)), random(20, (600)));
    v[i] = new PVector(random(-2, 2), random(-2, 2));
    a[i] = new PVector(0, 0);
  }
>>>>>>> origin/master
}

void draw() {
  background(0);
<<<<<<< HEAD
  println(x.x);
  fill(100, 0, 100);
  x.x += v.x;
  x.y += v.y;
  v.x += a.x;
  v.y += a.y;

  x2.x += v2.x;
  x2.y += v2.y;
  v2.x += a2.x;
  v2.y += a2.y;


  if (dist(mouseX, mouseY, x.x, x.y)>25) {   //x1 color change
    fill(0, 0, 200);
  } else {
    fill(100, 0, 100);
  }

  ellipse(x.x, x.y, 50, 50);

  if (dist(mouseX, mouseY, x2.x, x2.y)>25) {   //x2 color change
    fill(200, 0, 0);
  } else {
    fill(100, 0, 100);
  }

  ellipse(x2.x, x2.y, 50, 50);

  if (x.x>width) {           //x1 bounce
    v.x = -abs(v.x);
  }
  if (x.x<0) {           //x1 bounce
    v.x = abs(v.x);
  }
  if (x.y>height) {
    v.y = -abs(v.y);
  }
  if (x.y<0) {
    v.x = abs(v.x);
  } 

  if (x2.x>width || x2.x<0) {           //x2 bounce
    v2.x*=-1;
  }
  if (x2.y>height || x2.y<0) {
    v2.y*=-1;
  }  

  if (x.dist(x2)<=50) {                 //collide
    v.mult(-1);
    v2.mult(-1);
    fill(100, 0, 100);
  }
=======
  for (int i = 0; i<count; i++) {
    //    v[i].x += a[i].x;
    //    v[i].y += a[i].y;

    x[i].x += v[i].x;
    x[i].y += v[i].y;


    for (int j = 0; j<count; j++) {
      if (i != j) {
        if (x[i].dist(x[j]) < 2*r) {        //collision
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
>>>>>>> origin/master
} 

