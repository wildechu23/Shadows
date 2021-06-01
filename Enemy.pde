public class Enemy {
  public int hearts, x, y, speed;
  private PImage sprite;
  public Enemy(String str) {
    x = 0;
    y = 0;
    speed = 3;
    sprite = loadImage(str);
  }
  public void move(Player player) {
  }
  
  public void draw() {
    image(sprite, x, y);
  }
}
