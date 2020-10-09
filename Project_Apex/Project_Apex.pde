float ax, ay, bx, by, cx, cy;
int centreX;
int centreY;
float rwidth = 60;
float rheight = 40;
float diam = 30;

//this is a tiger

void setup() {
  size(600, 600);
  background(255);
  centreX = width/2;
  centreY = height/2;
}

void draw() {
  rectMode(CENTER);

  //body
  fill(255, 0, 0);
  rect(centreX, centreY, rwidth, rheight);

  //Stripes
  fill(0);
  ax = centreX - (rwidth/2);
  ay = centreY - (rheight/2);
  bx = ax + rwidth/3;
  by = ay;
  cx = ax + rwidth/6;
  cy = ay + rheight;
  for (int i = 0; i<3; i++) {
    triangle(ax, ay, bx, by, cx, cy);
    ax = bx;
    bx = ax + rwidth/3;
    cx = cx + rwidth/3;
  }
  
  //ear
  fill(0);
  ax = centreX - (rwidth/2);
  bx = ax + (3*rwidth)/12;
  by = centreY - (rheight/2);
  ay = by - diam/2;
  cx = ax + rwidth/3;
  cy = ay - rheight/4;
  triangle(ax, ay, bx, by, cx, cy);
  
  //nose
  fill(255, 0, 0);
  ax = (centreX - (rwidth/2)) - (3*diam)/8;
  ay = (centreY - (rheight/2)) + diam/4; 
  ellipse(ax,ay,diam/2,diam/2);

  //face
  fill(255, 0, 0);
  ax = centreX - (rwidth/2);
  ay = centreY - (rheight/2);
  circle(ax, ay, diam);
  
  //eye
  fill(255);
  ax = (centreX - (rwidth/2)) - diam/4;
  ay = (centreY - (rheight/2)) - diam/4;
  circle(ax,ay,diam/4);
  fill(0);
  circle(ax,ay,diam/12);
}
