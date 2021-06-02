public class Shuriken extends Projectile {
  public Shuriken(Player player) {
    super(player);
    sprite = loadImage("Necromancer.png");
  }
  public Shuriken(Enemy enemy, Player player) {
    super(enemy, player);
    sprite = loadImage("Necromancer.png");
  }
  
  public boolean isColliding(Character character) {
    if (x >= character.x && x <= character.x + 64 && y >= character.y && y <= character.y + 64) {
      character.hearts -= 1;
      return true;
    }
    return false;
  }
}
