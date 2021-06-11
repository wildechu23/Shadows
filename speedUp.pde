public class speedUp extends PowerUp {
  public speedUp(int x, int y) {
    super(x, y);
    sprite = loadImage("speed.png");
    sprite.resize(64, 0);
  }
}
