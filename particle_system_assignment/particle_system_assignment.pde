ArrayList<Ball> balls = new ArrayList<Ball>();
int h = 0; 
int hc = 30; //hue & change in hue
float lv = 590;
float t = 0.0; 
float tc = 0.15; //transparency & change in transparency

void setup() {
  size(800, 600); 
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(100, 0, 100);

  //"floor"
  fill(h, 100, 100, t);
  noStroke();
  rect(-1, lv + 5, width+1, height);

  //drawing the balls
  balls.add(new Ball());
  for (int i = 0; i<balls.size (); i++) {
    Ball b = balls.get(i);
    fill(h, 100, 100, 50);
    b.show();
    b.move();

    //color & transparency
    if (b.x.y>lv) {                              //if a ball falls to the ground, remove it
      balls.remove(i);                           //and make the floor more opaque
      t += tc;
      lv -= 0.1;
    }
  }

  if (t>100) {                                    //if the transparency is greater than 100
    fill(0);                                      //guide user to press the spacebar to change color
    textAlign(RIGHT);
    text("Try pressing the spacebar!", width, 15);
  }

  if (h > 360) {                                  //if the color reaches one end of the rainbow
    hc = -30;                                     //make it go in the other direction to the opposite end
  }
  if (h < 0) {
    hc = 30;
  }
  if(lv<5) {                                      //if the screen is completely filled with the color,
    h += hc;                                      //switch to the next color and reset transparency
    t = 0;
    lv = 590;
  } 
}

void keyPressed() {                               //when the spacebar is pressed, change color
  if (key == ' ' ) {                              //and reset transparency and floor level
    h += hc;
    t = 0;
    lv = 590;
  }
} 

