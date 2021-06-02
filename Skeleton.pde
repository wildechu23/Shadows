public class Skeleton extends Enemy {
  public Skeleton() {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    projectiles = new ArrayList<Projectile>();
    hearts = 5;
  }
  
  public void move(Player player) {
    attack(player);
  }
  public void attack(Player player) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      projectiles.add(new Shuriken(this, player));
      time = System.currentTimeMillis() / 1000;
    }
  }
}
