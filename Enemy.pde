public class Enemy {
  public int hearts, x, y, speed;
  private PImage sprite;
  private Pathfinding path;
  public Enemy() {
    x = 0;
    y = 0;
    speed = 10;
    sprite = loadImage("Necromancer.png");
  }
  public void move() {
    
  }
  public void draw() {
    image(sprite, x, y);
  }
}
