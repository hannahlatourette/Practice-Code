int xb1,xb2,yb1,yb2; //ball's corner values
int xbc,ybc,xz; //ball's speed and size values

int xp11,yp11,xp12,yp12; //paddle 1's corner values
int xp21,yp21,xp22,yp22; //paddle 2's corner values

int pc,pl,pw; //paddle speed/size values

int score1,score2; //player 1 & 2 score values
char score; PFont space;

boolean start; boolean controls; //other screens
boolean pause; boolean game;
int x=0; int xc=1;

void setup() {
 size(800,600);
 colorMode(HSB,800,100,100);
 ellipseMode(CORNERS);
 rectMode(CORNERS);
 textSize(50);
 frameRate(600);
 

 space = loadFont("ARDESTINE-48.vlw");
 
 xz=50; xbc=1; ybc=1;              //ball's variables
 xb1=(width/2)-(xz/2); xb2=xb1+xz;            
 yb1=(height/2)-(xz/2); yb2=yb1+xz;

 
 
 pl=125; pw=35; pc=1;              //paddle variables
 
 xp11=100; yp11=(height/2)-pl;     //paddle 1's variables
 xp12=xp11+pw; yp12=yp11+pl;
 
 xp21=700-pw; yp21=yp11;           //paddle 2's variables
 xp22=xp21+pw; yp22=yp21+pl;
 
 score1=0; score2=0;  //scores
 
 start=true; pause=false; game=false;
}

void draw() {
 if(start==false && controls==false && pause==false) {
  game=true; 
 } 
 if(start) {
   background(0);
   x=x+xc;
   if(x>800 || x<0) {
    xc*=-1; 
   }
   fill(x,99,99);
   textAlign(CENTER);
   textFont(space, 48);
   text("Welcome to Pong!", width/2,200);
   textSize(28);
   text("Press Tab for Controls or", width/2,400);
   textSize(48);
   text("Press Enter to Begin", width/2,450);
 }
 if(controls) {
   background(0);
   x=x+xc;
   if(x>800 || x<0) {
    xc*=-1; 
   }
   fill(x,99,99);
   textAlign(CENTER);
   textFont(space, 48);
   text("Controls",width/2,75);
   textSize(28);
   textAlign(LEFT);
   text("Player 1: paddle controlled with mouse",50,200);
   text("Player 2: paddle controlled with up and down arrows",50,250);
   textAlign(CENTER);
   text("To pause game, press P",width/2,475);
   textSize(48);
   text("Press Enter to Begin", width/2,525);
 } 
 if(game) {
 background(xb1,99,99);
 textAlign(CENTER, TOP);
 textSize(48);
 text(score1, (width/2)-50,10);
 text(score2, (width/2)+50,10);
 stroke(0,0,0);
 fill(0,0,0);
 ellipse(xb1,yb1,xb2,yb2);      //ball's position & motion
   xb1=xb1+xbc; xb2=xb1+xz;
   yb1=yb1+ybc; yb2=yb1+xz;
 
 if(yb1<0 || yb2>height) {        //ball's bouncing
   ybc*=-1;
 }
 if(xb1<0 || xb2>width) {   //score & reset
    if(xb2>width) {
     score1+=1;
   }
   if(xb1<=10) {
    score2+=1; 
   } 
   
   xb1=(width/2)-(xz/2);
   yb1=(height/2)-(xz/2);
     
}

 //paddle 1
 rect(xp11,yp11,xp12,yp12);         //initial position
 yp11=mouseY-(pl/2); yp12=yp11+pl;
 
 if(xp12==xb1 && ((yb2>=yp11 && yb1<=yp12) || (yb1<=yp12 && yb2>=yp11))) {  //x bounce
  xbc*=-1; 
 }
 
 
 
//paddle 2
 rect(xp21,yp21,xp22,yp22);      //initial position
 yp21+=pc; yp22=yp21+pl;
 
 if(keyCode==UP) {               //motion
  pc=-1;
  if(keyPressed) {
   pc=-3; 
  } 
 }
 if(keyCode==DOWN) {
  pc=1;
  if(keyPressed) {
    pc=3;
 }
}
 if(yp21<=0) {
  yp21=0;
 }
 if(yp22>=height) {
  yp21=height-pl;
 } 

 if(xp21==xb2 && ((yb2>=yp21 && yb1<=yp22) || (yb1<=yp22 && yb2>=yp21))) {  //bounce
  xbc*=-1; 
 }
}
 
if(pause) {
     background(0);
     x=x+xc;
     if(x>800 || x<0) {
      xc*=-1; 
     }
     fill(x,99,99);
     textAlign(CENTER);
     textFont(space, 48);
     text("Paused", width/2,200);
     text("Press P to Return to Game", width/2,400);
     xbc=0; ybc=0;
     println(pause);
     }
}   



void keyPressed() {
 if(key==ENTER) {
  start = false;
  controls = false;
 }
 if(key==TAB) {
  controls = true;
  start=false;
 } 
 if(key=='p') {
  pause = !pause;
  if(looping) {
   noLoop();
  }
  else {
   loop();
  }
  fill(0);
  stroke(0);
  rect(200,200,600,400);
  fill(xb1,99,99);
  textSize(48);
  text("Paused",(width/2),225);
  textSize(32);
  text("Press P to Resume", width/2,325);
  } 
 }
