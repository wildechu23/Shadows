void setup() {
  size(1000,800);
  background(0);
}

void draw() {
  Game game = new Game();
  
  while(game.running()) {
    game.update();
    game.draw();
  }
}
