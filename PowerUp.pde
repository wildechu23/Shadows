public class PowerUp extends Rock{
  PImage sprite;
  public PowerUp(int x, int y) {
    super(x, y);
    sprite = loadImage("ninja.png");
    sprite.resize(128, 0);
  }
  public void draw() {
    image(sprite, x, y);
  }
}
