int apexrad = 40;

class Apex
{
  boolean on;
  float centreX;
  float centreY;
  int time;
  float vx;
  float vy;

  Apex() {
    on = true;
    centreX = random(apexrad, width - apexrad);
    centreY = random(apexrad, height - apexrad);
    time = 0;
    vx = 8;
    vy = 8;
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    if (on) {
      fill(255, 0, 0);
      circle(centreX, centreY, apexrad);
      move();
      bounce();
    }
  }

  boolean contains() {
    float d = dist(centreX, centreY, c.centreX, c.centreY);
    if (d<(apexrad) && (!a.on)) {
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
