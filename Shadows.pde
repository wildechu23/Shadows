Player player;
boolean w;
boolean a;
boolean s;
boolean d;
void setup() {
  size(1000,800);
  background(0);
  player = new Player();
}

void draw() {
  //Game game = new Game();
  
  //while(game.running()) {
  //  game.update();
  //  game.draw();
  //}
  background(0);
  player.makePlayer();
  player.move(w, a, s, d);
}
void keyPressed() {
  if (key == 'w') {
    w = true;
  }
  if (key == 'a') {
    a = true;
  }
  if (key == 's') {
    s = true;
  }
  if (key == 'd') {
    d = true;
  }  
}
void keyReleased() {
  if (key == 'w') {
    w = false;
  }
  if (key == 'a') {
    a = false;
  }
  if (key == 's') {
    s = false;
  }
  if (key == 'd') {
    d = false;
  }
}
