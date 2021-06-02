public class Bat extends Enemy {
  public Bat() {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
  }
  
  public void move(Player player) {
    if (dist(x, y, player.getX(), player.getY()) <= 65) {
      attack(player);
    }
    if (dist(x, y, player.getX(), player.getY()) >= 60) {
      float angle = atan2(player.getY() - y, player.getX() - x);
      x += cos(angle) * speed;
      y += sin(angle) * speed;
    }
  }
  public void attack(Player player) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      player.hearts -= 1;
      System.out.println("HIT");
      time = System.currentTimeMillis() / 1000;
    }
  }
}
