int predrad = 20;
int prednum = 5;
int predcount = prednum;

class Predator
{
  boolean on;
  float centreX;
  float centreY;
  int time;
  float vx;
  float vy;

  Predator() {
    on = true;
    centreX = random(predrad, width - predrad);
    centreY = random(predrad, height - predrad);
    time = 0;
    vx = 2;
    vy = 2;
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    if (on) {
      fill(230, 76, 0);
      circle(centreX, centreY, predrad);
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
