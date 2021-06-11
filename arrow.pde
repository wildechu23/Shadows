public class Arrow extends Projectile {
  public Arrow(Enemy enemy, Player player) {
    super(enemy, player);
    sprite = loadImage("arrow.png");
    sprite.resize(64, 0);
  }
  
  public void draw() {
    pushMatrix();
    translate(x+32, y+32);
    rotate(angle);
    image(sprite, 0, 0);
    popMatrix();
  }
  public boolean isColliding(Character character) {
    if ((x + 20 >= character.x && x -20 <= character.x + character.size && y + 20 >= character.y && y - 20 <= character.y + character.size))  {
      character.tint = true;
      character.time2 = System.currentTimeMillis();
      character.hearts -= damage;
      return true;
    }
    return false;
  }
}
