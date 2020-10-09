float ax, ay, bx, by, cx, cy;
int centreX;
int centreY;
float rwidth = 30;
float rheight = 20;
float diam = 20;

//this is a fox

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  centreX = width/2;
  centreY = height/2;
  
  //body
  rectMode(CENTER);
  fill(230, 76, 0);
  rect(centreX, centreY, rwidth, rheight);
  
  //tail
  ax = centreX + rwidth/2;
  ay = centreY - rheight/2;
  rect(ax,ay,rheight/4,rheight);
  //white tail tip
  fill(255);
  rect(ax,ay-(rheight/2),rheight/4,(2*rheight)/3);
  
  //ear
  fill(0);
  ax = centreX - (rwidth/2);
  bx = ax + rwidth/3;
  by = centreY - (rheight/2);
  ay = by - rheight/2;
  cx = bx + rwidth/12;
  cy = ay - rheight/4;
  triangle(ax, ay, bx, by, cx, cy);
  
  //nose
  fill(230, 76, 0);
  ax = (centreX - (rwidth/2)) - rwidth/4;
  ay = (centreY - (rheight/2)) + rheight/4;  
  ellipse(ax,ay,20,10);
  
  //face
  fill(230, 76, 0);
  ax = centreX - (rwidth/2);
  ay = centreY - (rheight/2);
  circle(ax,ay,diam);
  
  //eye
  fill(255);
  ax = (centreX - (rwidth/2)) - diam/4;
  ay = (centreY - (rheight/2)) - diam/4;
  circle(ax,ay,diam/4);
  fill(0);
  circle(ax,ay,diam/12);
}
