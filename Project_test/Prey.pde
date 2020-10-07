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

  Prey() {
    on = true;
    centreX = random(preyrad, width - preyrad);
    centreY = random(preyrad, height - preyrad);
    vx = 1.5;
    vy = 1.5;
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    fill(51, 8, 0);
    if ((!on) && (preytime > 10)) {
      centreX = random(preyrad, width - preyrad);
      centreY = random(preyrad, height - preyrad);
      on = true;
      preytime = 0;
    }
    if(on){
      circle(centreX, centreY, preyrad);
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
