public class Arrow extends Projectile {
  public Arrow(Enemy enemy, Player player) {
    super(enemy, player);
    sprite = loadImage("arrow.png");
    sprite.resize(64, 0);
  }
  
  public void draw() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    image(sprite, 0, 0);
    popMatrix();
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
