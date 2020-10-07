int ax, ay, bx, by, cx, cy;
int centerX;
int centerY;
int rwidth = 60;
int rheight = 40;

//this is a tiger

void setup(){
  size(600,600);
  background(255);
}

void draw(){
  centerX = width/2;
  centerY = height/2;
  rectMode(CENTER);
  
  //body
  fill(255,0,0);
  rect(centerX, centerY, rwidth, rheight);
  
  //Stripes
  fill(0);
  ax = centerX - (rwidth/2);
  ay = centerY - (rheight/2);
  bx = ax + rwidth/3;
  by = ay;
  cx = ax + rwidth/6;
  cy = ay + rheight;
  triangle(ax, ay, bx, by, cx, cy);
  ax = bx;
  bx = ax + rwidth/3;
  cx = cx + rwidth/3;
  triangle(ax, ay, bx, by, cx, cy);
  ax = bx;
  bx = ax + rwidth/3;
  cx = cx + rwidth/3;
  triangle(ax, ay, bx, by, cx, cy);
  
  //face
  fill(255,0,0);
  ax = centerX - (rwidth/2);
  ay = centerY - (rheight/2);
  circle(ax,ay,30);
}
