public abstract class Enemy extends Character{
  public int speed, attackCD;
  public ArrayList<Projectile> projectiles;
  public PImage sprite;
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
  
  public void draw(Player player) {
    if (tint == true && System.currentTimeMillis() - time2 <= 500) {
      tint(0, 153, 100, 100);
    }
    else {
      tint = false;
    }
    image(sprite, x, y);
    noTint();
  }
  public void update() {
    if (hearts <= 0) {
      isAlive = false;
    }
  }
  public abstract void attack(Player player, Game game);
}
