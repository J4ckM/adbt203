float centreX;
float centreY;
float rheight;
float rwidth;
float radius;
int form = 3;

void setup() {
  background(255);
  size(600, 600);
  centreX = width/2;
  centreY = height/2;
  rheight = 100;
  rwidth = rheight/4;
  radius = 3*rwidth;
}

void draw() {
  rectMode(CENTER);
  fill(26, 0, 0);
  rect(centreX, centreY, rwidth, rheight);
  if (form==1) {
    fill(0, 255, 0);
    circle(centreX, centreY - (3*rheight)/4, radius);
  }
  if (form==2) {
    fill(179, 59, 0);
    circle(centreX, centreY - (3*rheight)/4, radius);
  }
  if (form==3) {
    pushMatrix();
    translate(centreX, centreY - rheight/2);
    for (int i=0; i<8; i++) {
      rotate((-PI/8) * i);
      rect(0, 0, (1.25 *rheight), rwidth/4);
    }
    popMatrix();
  }
}
