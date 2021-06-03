public Game game;
void setup() {
  size(1920,1080);
  frameRate(60);
  background(0);
  game = new Game();
}

void draw() {
  if (game.isRunning) {
    game.update();
    background(0);
    game.draw();
  }
  text(frameRate,width-20,20);
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
