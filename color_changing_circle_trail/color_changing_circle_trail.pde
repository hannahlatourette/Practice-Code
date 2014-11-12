int dracula = 10;
float[] x = new float[dracula];
float[] y = new float[dracula];

void setup() {
  size(800, 600);
  colorMode(HSB, 800, 100, 100);
}  

void draw() {

  noFill();
  stroke(mouseX, 99, 99);
  background(255);
  for (int i = (dracula-1); i > 0; i--) {
    ellipse(x[i], y[i], i*20+20, i*20+20);
  }

  x[0]=x[1];
  y[0]=y[1];

  x[1]=x[2];
  y[1]=y[2]; 

  x[2]=x[3];
  y[2]=y[3];

  x[3]=x[4];
  y[3]=y[4];

  x[4]=x[5];
  y[4]=y[5];

  x[5]=x[6];
  y[5]=y[6];

  x[6]=x[7];
  y[6]=y[7];

  x[7]=x[8];
  y[7]=y[8];

  x[8]=x[9];
  y[8]=y[9];

  x[9]=mouseX;
  y[9]=mouseY;
} 

