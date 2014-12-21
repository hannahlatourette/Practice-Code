ArrayList<Ball> balls = new ArrayList<Ball>();
int h = 0; int hc = 30; //hue & change in hue
float t = 0.0; float tc = 0.2; //transparency & change in transparency

void setup() {
  size(800, 600); 
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(100,0,100);
  
  //"floor"
  fill(h, 100, 100, t);
  noStroke();
  rect(-1, 500, width+1, height);
  
  //drawing the balls
  balls.add(new Ball());
  for (int i = 0; i<balls.size (); i++) {
    Ball b = balls.get(i);
    fill(h,100,100,50);
    b.show();
    b.move();
 
  //color & transparency
      if (b.x.y>495) {                             //if a ball falls to the ground, remove it
        balls.remove(i);                           //and make the floor more opaque
        t += tc;
        println(t);
      }
    }
    
   if(t>100) {                                    //if the transparency is greater than 100
    fill(0);                                      //guide user to press the spacebar/change color
    textAlign(RIGHT);
    text("Try pressing the spacebar!", width, 495);
   }
   
   if(h > 360) {                                  //if the color reaches one end of the rainbow
   hc = -30;                                      //make it go in the other direction to the opposite end
  }
  if(h < 0) {
   hc = 30; 
  } 
}

void keyPressed() {                               //when the spacebar is pressed, change color
 if(key == ' ' ) {                                //and reset transparency
  h += hc;
  t = 0;
 }
} 

