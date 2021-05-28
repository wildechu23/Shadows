public class Shuriken extends Projectile {
  public Shuriken(Player player) {
    super(player);
    sprite = loadImage("Necromancer.png");
  }
  
  public boolean isColliding() {
    return false;
  }
}
