ArrayList<Ball> balls = new ArrayList<Ball>();
int h = 0;                                       //hue
int hc = 30;                                     //change in hue

float lv = 590;                                  //floor level
float t = 0.0;                                   //transparency
float tc = 0.15;                                 //change in transparency

boolean textspace = false;                       //spacebar control guide
boolean textdown = false;                        //down arrow guide
boolean textmouse = false;                       //mouse hold guide

void setup() {
  size(800, 600); 
  textAlign(RIGHT);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(100, 0, 100);

  //drawing "floor" rectangle
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
    if ((b.x.y>lv-(b.d/2)) || (b.d<10)) {         //if a ball falls to the ground...
      balls.remove(i);                            //remove it,
      t += tc;                                    //increase the floor's opacity,
      lv -= 0.1;                                  //and make the floor level rise
    }
  }



  if (h > 360) {                                  //if the color reaches one end of the rainbow
    hc = -30;                                     //make it go in the other direction to the opposite end
  }
  if (h < 0) {
    hc = 30;
  }
  if (lv<5) {                                      //if the screen is completely filled with the color,
    h += hc;                                       //switch to the next color,
    t = 0;                                         //reset transparency
    lv = 590;                                      //and reset floor level
  }
  
 //guides
 if (t>100) {                                      //if the transparency is greater than 100
    textspace = true;                              //guide user to press the spacebar to change color
  }

 if(textspace) {
    fill(0);                                      //guide user to press the spacebar to change color
    text("Try pressing the spacebar!", width, 15);
 }
 if(textdown) {
    fill(0);
    text("Impatient? Try pressing the down arrow!", width, 15); 
 }
 if(textmouse) {
    fill(0);
    text("Feeling down? Try holding the left mouse button!", width, 15);
 } 
 } 
}


void keyPressed() {                               //when the spacebar is pressed, change color
  if (key == ' ' ) {                              //and reset transparency and floor level
    h += hc;
    t = 0;
    lv = 590;
  }
} 

