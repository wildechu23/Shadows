public class Bat extends Enemy {
  long time2, time3;
  private PImage[] animation;
  public Bat() {
    super("bat1.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    time2 = System.currentTimeMillis();
    time3 = System.currentTimeMillis() - 200;
    animation = new PImage[5];
    animation[0] = loadImage("bat1.png");
    animation[1] = loadImage("bat2.png");
    animation[2] = loadImage("bat3.png");
    animation[3] = loadImage("batAttack1.png");
    animation[4] = loadImage("batAttack2.png");
    animation[0].resize(64, 0);
    animation[1].resize(64, 0);
    animation[2].resize(64, 0);
  }
  public Bat(int x, int y) {
    super("bat1.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    this.x = x;
    this.y = y;
    time2 = System.currentTimeMillis() / 1000;
    time3 = System.currentTimeMillis() - 200;
    animation = new PImage[5];
    animation[0] = loadImage("bat1.png");
    animation[1] = loadImage("bat2.png");
    animation[2] = loadImage("bat3.png");
    animation[3] = loadImage("batAttack1.png");
    animation[4] = loadImage("batAttack2.png");
    animation[0].resize(64, 0);
    animation[1].resize(64, 0);
    animation[2].resize(64, 0);
  }
  
  public void move(Player player, Game game) {
    if (dist(x, y, player.getX(), player.getY()) >= 60) {
      float angle = atan2(player.getY() - y, player.getX() - x);
      x += cos(angle) * speed;
      y += sin(angle) * speed;
    }
    else {
      attack(player, game);
    }
  }
  public void attack(Player player, Game game) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      player.hearts -= 1;
      time3 = System.currentTimeMillis();
      time = System.currentTimeMillis() / 1000;
    }
  }
  public void draw(Player player) {
    if (System.currentTimeMillis() - time2 >= 750) {
      time2 = System.currentTimeMillis();
    }
    else if (System.currentTimeMillis() - time2 >= 500) {
      image(animation[2], x, y);
    }
    else if (System.currentTimeMillis() - time2 >= 250) {
      image(animation[1], x, y);
    }
    else {
      image(animation[0], x, y);
    }
    if (System.currentTimeMillis() - time3 <= 100) {
      player.tint = true;
      float angle = atan2(player.y - y, player.x - x);
      image(animation[3], x + 30 * cos(angle), y + 30 * sin(angle));
    }
    else if (System.currentTimeMillis() - time3 <= 200) {
      float angle = atan2(player.y - y, player.x - x);
      image (animation[4], x + 30 * cos(angle), y + 30 * sin(angle));
    }
    
    else if (System.currentTimeMillis() - time3 >= 500){
      player.tint = false;
    }
  }
}
