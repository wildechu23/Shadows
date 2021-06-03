public abstract class Enemy extends Character{
  public int speed, attackCD;
  long time;
  public ArrayList<Projectile> projectiles;
  private PImage sprite;
  boolean isAlive;
  public Enemy(String str) {
    x = 0;
    y = 0;
    speed = 3;
    hearts = 5;
    isAlive = true;
    sprite = loadImage(str);
  }
  public abstract void move(Player player, Game game);
  
  public void draw() {
    image(sprite, x, y);
  }
  public void update() {
    if (hearts <= 0) {
      isAlive = false;
    }
  }
  public abstract void attack(Player player, Game game);
}
