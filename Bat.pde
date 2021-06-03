public class Bat extends Enemy {
  public Bat() {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
  }
  public Bat(int x, int y) {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    this.x = x;
    this.y = y;
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
}
