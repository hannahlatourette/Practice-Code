PVector x, v, a;
PVector x2,v2,a2;

void setup() {
  size(400, 200);
  x = new PVector(60, 60);
  v = new PVector(random(3,5), random(3,5));
  a = new PVector(0, 0);
  
  x2 = new PVector(width-10, height-10);
  v2 = new PVector(random(-5, -3), random(-5, -3));
  a2 = new PVector(0, 0);
}

void draw() {
  background(0);
  println(x.x);
  x.x += v.x;
  x.y += v.y;
  
  x2.x += v2.x;
  x2.y += v2.y;

  ellipse(x.x, x.y, 50, 50);
  ellipse(x2.x, x2.y, 50, 50);
  
  if(x.x>width || x.x<0) {           //x1 bounce
   v.x*=-1; 
  }
  if(x.y>height || x.y<0) {
   v.y*=-1; 
  } 
  if (dist(mouseX, mouseY, x.x, x.y)>25) {   //x1 color change
    fill(0, 0, 200);
  } else {
    fill(100, 0, 100);
  }
  
  if(x2.x>width || x2.x<0) {           //x2 bounce
   v2.x*=-1; 
  }
  if(x2.y>height || x2.y<0) {
   v2.y*=-1; 
  }  
  
  if(x.dist(x2)<=50) {
   v.mult(-1);
  v2.mult(-1); 
  } 
} 

