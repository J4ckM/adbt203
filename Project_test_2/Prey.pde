int preyrad = 15;
int preynum = 10;  //constant
int preycount = preynum;  //variable
int preytime;

class Prey
{
  boolean on;
  float centreX;
  float centreY;
  float vx;
  float vy;
  float ax;
  float ay;

  Prey() {
    on = true;
    centreX = random(preyrad, width - preyrad);
    centreY = random(preyrad, height - preyrad);
    vx = random(1, 2);
    vy = random(1, 2);
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    fill(51, 8, 0);
    if (on) {
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

      //movement
      move();
      bounce();
    }
  }

  boolean contains(float x, float y) {
    float d = dist(centreX, centreY, x, y);
    if (d<preyrad) {
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
    if (centreX - preyrad < 0 || centreX + preyrad > width) {
      vx = -vx;
    }

    if (centreY - preyrad < 0 || centreY + preyrad > height) {
      vy = -vy;
    }
  }
}
