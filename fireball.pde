public class fireball extends Projectile{
  public fireball(Player player) {
    super(player);
    sprite = loadImage("Fdireball.png");
    sprite.resize(64, 0);
  }
  public fireball(Enemy enemy, Player player) {
    super(enemy, player);
    sprite = loadImage("Fireball.png");
    sprite.resize(64, 0);
  }
  public boolean isColliding(Character character) {
    if ((x >= character.x && x <= character.x + character.size && y >= character.y && y <= character.y + character.size) || (x + 64 >= character.x && x + 64 <= character.x + character.size && y + 64 >= character.y && y + 64 <= character.y + character.size)) {
      character.tint = true;
      character.time2 = System.currentTimeMillis();
      character.hearts -= damage;
      return true;
    }
    return false;
  }
}
