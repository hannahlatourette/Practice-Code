int x; float y; float yc;

void setup() {
 size(800,600);
 x=0; y=0; yc=0;
 frameRate(100);
}

void draw() {
  background(255);
  fill(0,y);
  noStroke();
  ellipse(width/2,y,50,50);
  y+=yc;
  yc+=0.2;
  if(y>height-25) {
   yc*=-1; 
  }
//  noLoop();
} 

//void mousePressed() {
// redraw(); 
//} 
