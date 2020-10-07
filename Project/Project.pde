Creature c;
Predator[] pred;
Prey[] prey;
Plant[] plant;
Apex a;
int time;
boolean GameOver;
String message;

void setup() {
  size(600, 600);
  background(255);
  time = 0;
  GameOver = false;
  message = "Game Over";
  textSize(48);

  //initialise animals
  initanimals();
}

void draw() {
  background(255);

  //if prey eats plant, remove plant
  Plantlife();

  //if predator eats prey, remove prey
  Preylife();

  //if Player is eaten, game over
  Playerlife();

  //display
  display();

  //time
  time();

  //GameOver
  float b;
  if (GameOver) {
    background(0, 255, 0);
    b = (width/2 - (textWidth(message)/2));
    text(message, b, height/2);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (c.on) {
      c.on = false;
    } else {
      c.on = true;
    }
  }
}

void mouseDragged() {
  if (c.contains()) {
    c.centreX = mouseX;
    c.centreY = mouseY;
  }
}

void initanimals() {
  c = new Creature();
  prey = new Prey[preynum];
  for (int i = 0; i < preynum; i++) {
    prey[i] = new Prey();
  }
  plant = new Plant[plantnum];
  for (int i = 0; i < plantnum; i++) {
    plant[i] = new Plant();
  }
  pred = new Predator[prednum];
  for (int i = 0; i < prednum; i++) {
    pred[i] = new Predator();
  }
  a = new Apex();
}

void Plantlife() {
  for (Plant p : plant) {
    for (Prey pr : prey) {
      if (p.contains(pr.centreX, pr.centreY)) {
        if (p.on) {
          plantcount--;
        }
        p.on = false;
      }
    }
  }
}

void Preylife() {
  for (Prey p : prey) {
    for (Predator pr : pred) {
      if (p.contains(pr.centreX, pr.centreY)) {
        if (p.on) {
          plantcount--;
        }
        p.on = false;
      }
    }
  }
}

void Playerlife() {
  //Apex eats Player
  if (a.contains()) {
    GameOver = true;
  }
}

void display() {
  c.display();
  for (Plant p : plant) {
    p.display();
  }
  for (Prey p : prey) {
    p.display();
  }
  for (Predator p : pred) {
    p.display();
  }
  if(a.time == 10){
    a.on = true;
  }
  if (a.on) {
    a.display();
  }
}

void time() {
  time++;
  if (time==60) {
    planttime++;
    preytime++;
    for (Predator p : pred) {
      p.time++;
    }
    a.time++;
    time=0;
  }
}
