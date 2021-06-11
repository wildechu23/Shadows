public Game game;
void setup() {
  size(1664,896);
  frameRate(60);
  background(0);
  game = null;
}

void draw() {
  if (game != null && game.isRunning) {
    game.update();
    background(0);
    game.draw();
  }
  else {
    game = null;
  }
  if (game == null) {
    background(0, 0, 0);
    fill(255, 255, 255);
    rect(width / 2, height / 2, 90, 30);
    fill(0, 0, 0);
    text("start", width / 2, height / 2 + 25);
  }
  fill(255);
  textSize(20);
  text("FPS: " + frameRate,width-160,50);
}

void keyPressed() {
  if (game != null)
  game.player.pressed((key == 'w' || key == 'W'), (key == 'a' || key == 'A'),
                 (key == 's' || key == 'S'), (key == 'd' || key == 'D'));
    if (key == '1') {
      Weapon tempWeapon = game.player.primaryWeapon;
      game.player.primaryWeapon = game.player.secondaryWeapon;
      game.player.secondaryWeapon = tempWeapon;
    }
}

void keyReleased() {
  if (game != null)
  game.player.released((key == 'w' || key == 'W'), (key == 'a' || key == 'A'),
                 (key == 's' || key == 'S'), (key == 'd' || key == 'D'));
}

void mousePressed() {
  if (game != null)
  game.click(mouseButton == LEFT);
  else if (mouseX >= width / 2 && mouseX <= width / 2 + 100 && mouseY >= height / 2 && mouseY <= height / 2 + 100) {
    game = new Game(this);
  }
}
