float ax, ay;
int centreX;
int centreY;
float rad = 15;

//this is a rabbit

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  centreX = width/2;
  centreY = height/2;

  //body
  fill(51, 8, 0);
  circle(centreX, centreY, rad);

  //ears
  ax = centreX - rad/4;
  ay = centreY - (3 * rad)/4;
  ellipse(ax, ay, rad/2, rad);
  ax = centreX + rad/4;
  ellipse(ax, ay, rad/2, rad);

  //eyes
  ax = centreX - rad/4;
  ay = centreY - rad/4;
  for (int i = 0; i<2; i++) {
    fill(255);
    circle(ax, ay, rad/4);
    fill(0);
    circle(ax, ay, rad/12);
    ax = centreX + rad/4;
  }

  //nose
  fill(255, 102, 102);
  circle(centreX, centreY, rad/4);
}
