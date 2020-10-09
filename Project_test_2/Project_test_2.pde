Creature c;
Apex a;
Predator[] pred;
Prey[] prey;
Plant[] plant;
Tree[] tree;
int seasons;
int time;
int absolutetime;
boolean GameOver;
boolean Victory;
String message;

void setup() {
  size(600, 600);
  background(255);
  time = 0;
  GameOver = false;
  Victory = false;
  seasons = 0;

  //initialise animals
  initanimals();
}

void draw() {
  Seasons();

  fill(10, 10, 10);
  for (int i = 0; i < 4; i++) {
    circle(width, height, 200 - (50 * i));
    fill(50*(1+i));
  }

  textSize(10);
  message = "Points:" + points;
  float b = (width - textWidth(message) - 10);
  text(message, b, (height)/16);

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

void Seasons() {
  //winter
  if (absolutetime > 20) {
    absolutetime = 0;
    background(255);
    seasons = 0;
  }
  //autumn
  else if (absolutetime > 15) {
    background(204, 170, 0);
    seasons = 3;
  }
  //summer
  else if (absolutetime > 10) {
    background(0, 179, 0);
    seasons = 2;
  }
  //spring
  else if (absolutetime > 5) {
    background(150, 255, 150);
    seasons = 1;
    planttime = 0;
    for (Plant p : plant) {
      if (!p.on) {
        p.centreX = random(plantrad, width - plantrad);
        p.centreY = random(plantrad, height - plantrad);
        p.on = true;
      }
    }
  }
  //winter
  else if (absolutetime >= 0) {
    background(255);
    seasons = 0;
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
  tree = new Tree[4];
  for (int t = 0; t < 4; t++) {
    tree[t] = new Tree();
  }
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
  //every so often, plants regrow
  if (planttime > 2) {
    for (Plant p : plant) {
      if (!p.on) {
        p.centreX = random(plantrad, width - plantrad);
        p.centreY = random(plantrad, height - plantrad);
        p.on = true;
      }
    }
    planttime = 0;
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
      //if rabbits run into each other, they breed
      //in reality, dead rabbits are being teleported and revived
      for (Prey pr : prey) {
        if (pr.on) {
          if (!(pr == p)) {
            if (preytime > 3) {
              if (p.contains(pr.centreX, pr.centreY)) {
                for (Prey prey : prey) {
                  if (!prey.on) {
                    prey.centreX = p.centreX;
                    prey.centreY = p.centreY;
                    prey.vx = random(1, 2);
                    prey.vy = random(1, 2);
                    prey.on = true;
                  }
                }
                preytime = 0;
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
  int a = 0;
  for (Tree t : tree) {
    if(a == 0){
      t.centreY = height/4;
    }
    if(a == 1){
      t.centreY = height/2;
    }
    if(a == 2){
      t.centreY = (3*height)/4;
    }
    if(a == 3){
      t.centreX = width;
      t.centreY = height/2;
    }
    t.display();
    a++;
  }
}

void time() {
  time++;
  if (time==60) {
    if ((seasons == 0) || (seasons == 3)) {
      planttime++;
    }
    preytime++;
    for (Predator p : pred) {
      p.time++;
    }
    absolutetime++;
    time=0;
  }
}

void GameEnd() {
  background(0, 255, 0);
  textSize(48);
  float b;
  if (GameOver) {
    background(255, 0, 0);
    message = "Game Over";
  }
  if (Victory) {
    background(0, 255, 0);
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
