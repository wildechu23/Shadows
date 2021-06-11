public class Shuriken extends Projectile {
  public Shuriken(Player player) {
    super(player);
    sprite = loadImage("shuriken.png");
    sprite.resize(64, 0);
  }
  
  public boolean isColliding(Character character) {
    if ((x + 10 + 32 >= character.x && x - 10 +32 <= character.x + character.size && y + 10 + 32 >= character.y && y - 10 + 32<= character.y + character.size)) {
      character.tint = true;
      character.time2 = System.currentTimeMillis();
      character.hearts -= damage;
      return true;
    }
    return false;
  }
}
