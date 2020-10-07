int cretrad;
int points;

class Creature
{
  boolean on;
  float centreX;
  float centreY;
  
  Creature(){
    on = true;
    centreX = width/2;
    centreY = height/2;
  }
  
  // Moves the ball according to its current velocity.
  void display()
  {
    if(on){
      cretrad = apexrad;
    }
    else{
      cretrad = predrad;
    }
    fill(0,0,255);
    circle(centreX,centreY,cretrad);
  }
  
  boolean contains(){
    float d = dist(mouseX, mouseY, centreX, centreY);
    if(d<cretrad){
      return true;
    }
    else{
      return false;
    }
  }
}
