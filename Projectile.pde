public abstract class Projectile {
  public int damage, speed, range, x, y;
  public float angle;
  public PImage sprite;
  private Player player;
  
  public Projectile(Player player) {
    this.player = player;
    x = player.getX();
    y = player.getY();
    angle = atan2(mouseY - y, mouseX - x);
    //print(angle);
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
  
  public abstract boolean isColliding();
}
