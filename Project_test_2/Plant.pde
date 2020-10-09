int plantrad = 10;
int plantnum = 20;
int plantcount = plantnum;
int planttime;

class Plant
{
  boolean on;
  float centreX;
  float centreY;

  Plant() {
    on = true;
    centreX = random(plantrad, width - plantrad);
    centreY = random(plantrad, height - plantrad);
  }

  // Moves the ball according to its current velocity.
  void display()
  {
    fill(0, 255, 0);
    if(on){
      circle(centreX, centreY, plantrad);
    }
  }

  boolean contains(float x, float y) {
    float d = dist(centreX, centreY, x, y);
    if (d<plantrad) {
      return true;
    } else {
      return false;
    }
  }
}
