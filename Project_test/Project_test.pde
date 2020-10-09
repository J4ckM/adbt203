Creature c;
Predator[] pred;
Prey[] prey;
Plant[] plant;
Apex a;
int time;
boolean GameOver;
boolean Victory;
String message;

void setup() {
  size(600, 600);
  background(255);
  time = 0;
  GameOver = false;
  Victory = false;
  textSize(48);

  //initialise animals
  initanimals();
}

void draw() {
  background(255);
  fill(10, 10, 10);
  for (int i = 0; i < 4; i++) {
    circle(width, height, 200 - (50 * i));
    fill(50*(1+i), 50*(1+i), 50*(1+i));
  }

  if (points > 10) {
    a.on = true;
  }

  //if prey eats plant, remove plant
  Plantlife();

  //if predator eats prey, remove prey
  Preylife();

  //if Player is eaten, game over
  Playerlife();

  //if Player is in apex form, they can fight the apex and win
  Apexlife();

  //display
  display();

  //time
  time();

  //GameEnd
  if (Victory||GameOver) {
    GameEnd();
  }
}

void keyPressed() {
  if (key == ' ') {
    if (!c.tigform) {
      if (c.on) {
        c.on = false;
      } else {
        c.on = true;
      }
    }
    if (GameOver||Victory) {
      Restart();
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
    //if creature is in prey mode, it eats plants
    if (c.on) {
      if (p.contains(c.centreX, c.centreY)) {
        if (p.on) {
          plantcount--;
          points++;
        }
        p.on = false;
      }
    }
  }
}

void Preylife() {
  for (Prey p : prey) {
    if (p.on) {
      for (Predator pr : pred) {
        if (p.contains(pr.centreX, pr.centreY)) {
          preycount--;
          p.on = false;
        }
      }
      //if creature is in pred mode, it eats prey
      if (!c.on) {
        if (p.contains(c.centreX, c.centreY)) {
          preycount--;
          points++;
          p.on = false;
        }
      }
      for (Prey pr : prey) {
        if (!(pr == p)) {
          if (p.contains(pr.centreX, pr.centreY)) {
            for (Prey prey : prey){
              if (!prey.on){
                prey.on = true;
              }
            }
          }
        }
      }
    }
  }
}

void Playerlife() {
  if (!c.tigform) {
    //Apex eats Player
    if (a.contains(c.centreX, c.centreY)) {
      GameOver = true;
    }
    for (Predator p : pred) {
      if (p.contains(c.centreX, c.centreY) && c.on) {
        GameOver = true;
      }
    }
  }
}

void Apexlife() {
  if (c.tigform) {
    //Player fights Apex
    if (a.contains(c.centreX, c.centreY)) {
      Victory = true;
    }
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
    time=0;
  }
}

void GameEnd() {
  background(0, 255, 0);
  float b;
  if (GameOver) {
    message = "Game Over";
  }
  if (Victory) {
    message = "Victory";
  }
  b = (width/2 - (textWidth(message)/2));
  text(message, b, height/2);

  message = "Points:" + points;
  b = (width/2 - (textWidth(message)/2));
  text(message, b, (5*height)/8);

  message = "Press space to play again";
  b = (width/2 - (textWidth(message)/2));
  text(message, b, (3*height)/4);
}

void Restart() {
  GameOver = false;
  Victory = false;
  points = 0;
  for (Plant p : plant) {
    p.on = true;
  }
  for (Prey p : prey) {
    p.on = true;
  }
  a.on = false;
}
