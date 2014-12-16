int ct = 5;
Dot dottie;

void setup() {
  size(800, 600);
  dottie = new Dot();
}

void draw() {
  dottie.display();
}

class Dot {
  PVector x, v, a;            //where x is location, v is velocity, and a is acceleration
  float r, d, ct;             //where r is radius, d is diameter, and ct is count

    Dot() {
    r = 10; 
    d = 2*r; 
    ct = 100;
  }

  void display() {
    for (int i = 0; i<ct; i++) {
      for (int j = 0; j<ct; j++) {
        x = new PVector(r+(d*i), r+(d*j));
        ellipse(x.x, x.y, d, d);
      }
    }
  }
}
