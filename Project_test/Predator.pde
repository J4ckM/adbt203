int predrad = 20;
int prednum = 5;
int predcount = prednum;

class Predator
{
  boolean on;
  float centreX;
  float centreY;
  float rwidth;
  float rheight;
  float diam;
  int time;
  float vx;
  float vy;
  float ax, ay, bx, by, cx, cy;

  Predator() {
    on = true;
    centreX = random(predrad, width - predrad);
    centreY = random(predrad, height - predrad);
    rwidth = 30;
    rheight = 20;
    diam = 20;
    time = 0;
    vx = 2;
    vy = 1.5;
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    if (on) {
      fill(230, 76, 0);
      //circle(centreX, centreY, predrad);

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
      fill(230, 76, 0);
      ax = (centreX - (rwidth/2)) - rwidth/4;
      ay = (centreY - (rheight/2)) + rheight/4;  
      ellipse(ax, ay, 20, 10);

      //face
      fill(230, 76, 0);
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

      move();
      bounce();
    }
  }

  boolean contains(float x, float y) {
    float d = dist(centreX, centreY, x, y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    centreX = centreX + vx;
    centreY = centreY + vy;
  }

  void bounce() {
    if (centreX - predrad < 0 || centreX + predrad > width) {
      vx = -vx;
    }

    if (centreY - predrad < 0 || centreY + predrad > height) {
      vy = -vy;
    }
  }
}
