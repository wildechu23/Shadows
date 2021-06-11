public class damageUp extends PowerUp {
  public damageUp(int x, int y) {
    super(x, y);
    sprite = loadImage("damage.png");
    sprite.resize(64, 0);
  }
}
