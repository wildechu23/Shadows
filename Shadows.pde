public Game game;
public int c;
void setup() {
  size(1664,896);
  noSmooth();
  frameRate(60);
  background(0);
  game = null;
  c = 180;
}

void draw() {
  if (game != null && game.isRunning && !game.pause) {
    game.update();
    background(0);
    game.draw();
  }
  else if (game != null && game.pause) {
    background(0);
    textSize(100);
    text("GAME PAUSED",width/2-300, height/2);
    game.draw();
  }
  else {
    game = null;
  }
  if (game == null) {
    background(0, 0, 0);
    fill(Math.abs(c));
    c--;
    if(c < -180) c = 180;
    textSize(100);
    text("Shadows",width/2-200, height/2-200);
    fill(255, 255, 255);
    rect(width / 2 - 45, height / 2, 90, 30);
    fill(0, 0, 0);
    textSize(20);
    text("Start", width / 2 - 20, height / 2 + 25);
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
  if (game != null) {
  if (mouseX >= width - 64 && mouseX <= width && mouseY >= 0 && mouseY <= 0 + 64){
    game.pause = !game.pause;
  }
  else if (game.pause == false)  
    game.click(mouseButton == LEFT);
  }
  else if (mouseX >= width / 2 - 20 && mouseX <= width / 2 + 90 && mouseY >= height / 2 && mouseY <= height / 2 + 30) {
    game = new Game(this);
  }
}
