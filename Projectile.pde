public abstract class Projectile {
  public int damage, speed, range, x, y;
  public float angle;
  public PImage sprite;
  private Character character;
  
  public Projectile(Player player) {
    this.character = player;
    x = character.x;
    y = character.y;
    angle = atan2(mouseY - y, mouseX - x);
    //print(angle);
    speed = 10;
    damage = 1;
  }
  
  public Projectile(Enemy enemy, Player player) {
    character = enemy;
    x = character.x;
    y = character.y;
    angle = atan2(player.y - y, player.x - x);
    speed = 10;
    damage = 1;
  }
  
  public Projectile(Enemy enemy, int targetX, int targetY) {
    character = enemy;
    x = character.x;
    y = character.y;
    angle = atan2(targetY - y, targetX - x);
    speed = 10;
  }
  
  public void update() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
  }
  
  public void draw() {
    image(sprite, x, y);
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public Character getCharacter() {
    return character;
  }
  
  public abstract boolean isColliding(Character character);
}
