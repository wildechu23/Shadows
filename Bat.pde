public class Bat extends Enemy {
  long time2;
  private PImage[] animation;
  public Bat() {
    super("bat1.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    time2 = System.currentTimeMillis();
    animation = new PImage[3];
    animation[0] = loadImage("bat1.png");
    animation[1] = loadImage("bat2.png");
    animation[2] = loadImage("bat3.png");
    animation[0].resize(64, 64);
    animation[1].resize(64, 64);
    animation[2].resize(64, 64);
  }
  public Bat(int x, int y) {
    super("bat1.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    this.x = x;
    this.y = y;
    time2 = System.currentTimeMillis() / 1000;
    animation[0] = loadImage("bat1.png");
    animation[1] = loadImage("bat2.png");
    animation[2] = loadImage("bat3.png");
    animation[0].resize(64, 64);
    animation[1].resize(64, 64);
    animation[2].resize(64, 64);
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
      System.out.println("HIT");
      time = System.currentTimeMillis() / 1000;
    }
  }
  public void draw() {
    if (System.currentTimeMillis() - time2 >= 1500) {
      time2 = System.currentTimeMillis();
    }
    else if (System.currentTimeMillis() - time2 >= 1000) {
      image(animation[2], x, y);
    }
    else if (System.currentTimeMillis() - time2 >= 500) {
      image(animation[1], x, y);
    }
    else {
      image(animation[0], x, y);
    }
  }
}
