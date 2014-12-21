class Ball {
  PVector x, v, a;                                      //position, velocity, acceleration
  float d;                                              //diameter (size)
  
  Ball() {
   x = new PVector(mouseX,mouseY);
   v = new PVector(random(-1,1),random(-0.5,0.5));
   a = new PVector(random(-0.03,0.03),0.098);
   
   d = random(5,20);
  }
  
  void show() {
   ellipse(x.x,x.y,d,d);
  }
  
  void move() {
   if(mousePressed) {                                  //if the mouse is held, downward velocity increases
    v.add(0,0.25,0);
   } 
   v.add(a);                                           //velocity increases by acceleration
   x.add(v);                                           //position increases by velocity
  }
 }
