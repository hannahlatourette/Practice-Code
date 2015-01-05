ArrayList<Ball> balls = new ArrayList<Ball>();

int h = 0;                                       //hue
int hc = 30;                                     //change in hue

String text = " ";
String space = "Try pressing the spacebar!";
String down = "Hold the down arrow to speed it up a bit!";
String mouse = "Feeling down? Try holding the left mouse button!";

float lv = 590;                                  //floor level
float t = 0.0;                                   //transparency
float tc = 0.15;                                 //change in transparency
float fr = 0;

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
  fr++;

  //drawing "floor" rectangle
  fill(h, 100, 100, t);
  noStroke();
  rect(-1, lv + 5, width+1, height);

  //drawing balls
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
  
 //text guides
 fill(0);
 text(text,width,15);
 println(fr);
 
 if(h==0 && fr>360) { text = down; }
 if(h==0 && t>100) { text = space; }
 if(h==30 && fr>800) { text = mouse; println("mouseistrue"); }
 
 if(mousePressed) { mouse = " "; }
 if(keyPressed && key==' ') { fr = 0; }
 if(keyPressed && keyCode==DOWN) { down = " "; }

}



void keyPressed() {                               //when the spacebar is pressed, change color
  if (key == ' ' ) {                              //and reset transparency and floor level
    h += hc;
    t = 0;
    lv = 590;
  }
} 

