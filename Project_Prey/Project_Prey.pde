float ax, ay;
int centerX;
int centerY;
int rwidth = 30;
int rheight = 20;
float rad = 15;

//this is a rabbit

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  centerX = width/2;
  centerY = height/2;
  
  //body
  fill(51, 8, 0);
  circle(centerX, centerY, rad);
  
  //ears
  ax = centerX - rad/4;
  ay = centerY - (3 * rad)/4;
  ellipse(ax,ay,rad/2,rad);
  ax = centerX + rad/4;
  ellipse(ax,ay,rad/2,rad);
}
