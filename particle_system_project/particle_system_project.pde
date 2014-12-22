
int  r = 10; 
int d = 2*r; 
int ct = 100;
Dot[] dottie = new Dot[ct];


void setup() {
  size(800, 600);
  for (int i=0; i<ct; i++) {
    dottie[i] = new Dot();
  }
}

void draw() {
  for (int k=0; k<ct; k++) {
    for (int i = 0; i<ct; i++) {
      for (int j = 0; j<ct; j++) {

        float x= r+d*i;
        float y= r+d*j;
        dottie[k].display(x, y);
        dottie[k].spin(x, y);
      }
    }
  }
}
class Dot {
  PVector x, v, a;            //where x is location, v is velocity, and a is acceleration
  //where r is radius, d is diameter, and ct is count

  Dot() {
  }

  void display(float x_, float y_) {
    ellipse(x_, y_, d, d);
  }
  void spin(float x_, float y_) {
    PVector mouse = new PVector (mouseX, mouseY);
    if (dist(x_, y_, mouseX, mouseY) < 50) {
      println(frameCount);
      background(random(255));
    }
  }
}

