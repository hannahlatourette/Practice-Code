int ballCount=500; 
float szc;

float[] x = new float [ballCount];
float[] y = new float [ballCount];
float[] xc = new float [ballCount];
float[] yc = new float [ballCount];
float[] sz = new float [ballCount];
float[] cl = new float [ballCount];
float[] tr = new float [ballCount];
//float[] szc = new float [ballCount];

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(600, 600);
  for (int i=0; i<ballCount; i++) {

    x[i] = random(width)-sz[i];
    y[i] = random(height)-sz[i];
    xc[i] = random(-7, 7);
    yc[i] = random(-7, 7);
    sz[i] = random(10,15);
    cl[i] = random(360);
    tr[i] = random(25, 75);
  }
  szc=1;
}

void draw() {
  noStroke();
  background(0);
  for (int i=0; i<ballCount; i++) {
    if((mouseX==x[i]+(sz[i]/2) || mouseX==x[i]-(sz[i]/2)) && (mouseY==y[i]-(sz[i]/2)|| mouseY==y[i]+(sz[i]/2))) {
     fill(cl[i],99,99,100); 
    }
    else{
     fill(cl[i], 99, 99, tr[i]);
    }

    ellipse(x[i], y[i], sz[i], sz[i]);

//    x[i]+=xc[i];
//    y[i]+=yc[i];
    sz[i]+=szc;
    
    if (sz[i]>150 || sz[i]<10) {
      szc*=-1;
    } 
//    if (x[i]<0+(sz[i]/2) || x[i]>height-(sz[i]/2)) {
//      xc[i]*=-1;
//    }
//    if (y[i]<(sz[i]/2) || y[i]>height-(sz[i]/2)) {
//      yc[i]*=-1;
//    }
  }
} 

