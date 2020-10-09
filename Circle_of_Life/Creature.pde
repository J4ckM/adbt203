int cretrad;
int form;
int points = 0;

class Creature
{
  boolean on;
  boolean tigform;
  float centreX;
  float centreY;
  float rwidth;
  float rheight;
  float diam;
  float ax, ay, bx, by, cx, cy;

  Creature() {
    on = false;
    tigform = false;
    centreX = width/2;
    centreY = height/2;
    form = 1;
  }
  
  void setup(){
    on = false;
    tigform = false;
    centreX = width/2;
    centreY = height/2;
    form = 1;
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    if(points > 15){
      on = false;
      tigform = true;
    }
    if ((on) && (!tigform)) {
      Preyshape();
    } else if ((!on) && (!tigform)) {
      cretrad = predrad;
      Predshape();
    } else {
      cretrad = apexrad;
      Apexshape();
    }
    fill(0, 0, 255);
    //circle(centreX,centreY,cretrad);
  }

  boolean contains() {
    float d = dist(mouseX, mouseY, centreX, centreY);
    if (d<cretrad) {
      return true;
    } else {
      return false;
    }
  }

  void Apexshape() {
    rwidth = 60;
    rheight = 40;
    diam = 30;
    fill(0, 0, 255);
    rectMode(CENTER);

    //body
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
    fill(0, 0, 255);
    ax = (centreX - (rwidth/2)) - (3*diam)/8;
    ay = (centreY - (rheight/2)) + diam/4; 
    ellipse(ax, ay, diam/2, diam/2);

    //face
    fill(0, 0, 255);
    ax = centreX - (rwidth/2);
    ay = centreY - (rheight/2);
    circle(ax, ay, diam);

    //eye
    fill(255);
    ax = (centreX - (rwidth/2)) - diam/4;
    ay = (centreY - (rheight/2)) - diam/4;
    circle(ax, ay, diam/4);
    fill(0);
    circle(ax, ay, diam/12);
  }

  void Predshape() {
    rwidth = 30;
    rheight = 20;
    diam = 20;
    fill(0, 0, 255);

    //body
    rectMode(CENTER);
    rect(centreX, centreY, rwidth, rheight);

    //tail
    ax = centreX + rwidth/2;
    ay = centreY - rheight/2;
    rect(ax, ay, rheight/4, rheight);
    //white tail tip
    fill(255);
    rect(ax, ay-(rheight/2), rheight/4, (2*rheight)/3);

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
    fill(0, 0, 255);
    ax = (centreX - (rwidth/2)) - rwidth/4;
    ay = (centreY - (rheight/2)) + rheight/4;  
    ellipse(ax, ay, 20, 10);

    //face
    fill(0, 0, 255);
    ax = centreX - (rwidth/2);
    ay = centreY - (rheight/2);
    circle(ax, ay, diam);

    //eye
    fill(255);
    ax = (centreX - (rwidth/2)) - diam/4;
    ay = (centreY - (rheight/2)) - diam/4;
    circle(ax, ay, diam/4);
    fill(0);
    circle(ax, ay, diam/12);
  }

  void Preyshape() {
    fill(0,0,255);
    //body
    circle(centreX, centreY, preyrad);

    //ears
    ax = centreX - preyrad/4;
    ay = centreY - (3 * preyrad)/4;
    ellipse(ax, ay, preyrad/2, preyrad);
    ax = centreX + preyrad/4;
    ellipse(ax, ay, preyrad/2, preyrad);

    //eyes
    ax = centreX - preyrad/4;
    ay = centreY - preyrad/4;
    for (int i = 0; i<2; i++) {
      fill(255);
      circle(ax, ay, preyrad/4);
      fill(0);
      circle(ax, ay, preyrad/12);
      ax = centreX + preyrad/4;
    }

    //nose
    fill(255, 102, 102);
    circle(centreX, centreY, preyrad/4);
  }
}
