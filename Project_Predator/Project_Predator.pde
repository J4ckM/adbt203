int ax, ay, bx, by, cx, cy;
int centerX;
int centerY;
int rwidth = 30;
int rheight = 20;

//this is a fox

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  centerX = width/2;
  centerY = height/2;
  
  //body
  rectMode(CENTER);
  fill(230, 76, 0);
  rect(centerX, centerY, rwidth, rheight);
  
  //tail
  ax = centerX + rwidth/2;
  ay = centerY - rheight/2;
  rect(ax,ay,rheight/4,rheight);
  //white tail tip
  fill(255);
  rect(ax,ay-(rheight/2),rheight/4,(2*rheight)/3);
  
  //ear
  fill(0);
  ax = centerX - (rwidth/2);
  bx = ax + rwidth/3;
  by = centerY - (rheight/2);
  ay = by - rheight/2;
  cx = bx + rwidth/12;
  cy = ay - rheight/4;
  triangle(ax, ay, bx, by, cx, cy);
  
  //nose
  fill(230, 76, 0);
  ax = centerX - (rwidth/2);
  ay = centerY - (rheight/2);  
  ax = ax - rwidth/4;
  ay = ay + rheight/4;
  ellipse(ax,ay,20,10);
  
  //face
  fill(230, 76, 0);
  ax = centerX - (rwidth/2);
  ay = centerY - (rheight/2);
  circle(ax,ay,20);
  
  
}
