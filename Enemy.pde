public class Enemy extends Character{
  public int speed;
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
  public void move(Player player) {
  }
  
  public void draw() {
    image(sprite, x, y);
  }
  public void update() {
    if (hearts <= 0) {
      isAlive = false;
    }
  }
}