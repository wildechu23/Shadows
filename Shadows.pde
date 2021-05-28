Game game;
Player player;
boolean w;
boolean a;
boolean s;
boolean d;
void setup() {
  size(1920,1080);
  background(0);
  player = new Player();
  game = new Game();
}

void draw() {
  game.update();
  background(0);
  game.draw();
}

void keyPressed() {
  game.player.pressed((key == 'w' || key == 'W'), (key == 'a' || key == 'A'),
                 (key == 's' || key == 'S'), (key == 'd' || key == 'D'));
}

void keyReleased() {
  game.player.released((key == 'w' || key == 'W'), (key == 'a' || key == 'A'),
                 (key == 's' || key == 'S'), (key == 'd' || key == 'D'));
}

void mousePressed() {
  game.click(mouseButton == LEFT);
}
