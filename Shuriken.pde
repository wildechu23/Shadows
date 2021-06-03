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
    if ((x >= character.x && x <= character.x + 64 && y >= character.y && y <= character.y + 64) || (x + 64 >= character.x && x + 64 <= character.x + 64 && y + 64 >= character.y && y + 64 <= character.y + 64)) {
      character.hearts -= damage;
      return true;
    }
    return false;
  }
}
