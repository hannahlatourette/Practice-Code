int a; 
int b; 
int c;
void setup() {
  a = 1;
  b = 4;
  c = 1;
  size(800, 600);
}

void draw() {
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  dot(

  println("the addition one is "+quad1(a, b, c)+"; the subtraction one is "+quad2(a, b, c));
}

float quad1(float a, float b, float c) {
  float answer1;
  answer1 = -b+((sqrt(b*b-4*a*c))/2*a);
  return answer1;
}

float quad2(float a, float b, float c) {
  float answer2;
  answer2 = -b-((sqrt(b*b-4*a*c))/2*a);
  return answer2;
}

float line(float a, float b, float c) {
  float x;
  x = 
} 

