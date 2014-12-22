class Ball {
  PVector x, v, a;                                      //position, velocity, acceleration
  PVector mouse = new PVector (mouseX, mouseY);
  float d, d2;                                          //diameter (size)

  Ball() {
    x = new PVector(mouseX, mouseY);
    v = new PVector(random(-1, 1), random(-0.5, 0.5));
    a = new PVector(random(-0.03, 0.03), 0.098);

    d = random(5, 20);
    d2 = 0.1;
  }

  void show() {
    ellipse(x.x, x.y, d, d);
  }

  void move() {
    if (mousePressed) {                                  //if the mouse is held, gravity (and x acceleration) go away
      a = new PVector(0, 0);
      d += 0.1;
    }
    if (keyPressed && keyCode == DOWN) {
      v.add(0, 0.25, 0);
    } 
    v.add(a);                                           //velocity increases by acceleration
    x.add(v);                                           //position increases by velocity

    if (a.x == 0 && a.y == 0) {
      if (mousePressed) {
        d += 0.1;
      } else {
        if (d<0.01) { 
          x.y = 500;
        }
        d -= 0.1;
      }
    }
  }
}

