public class Heart extends PowerUp{
  public Heart(int x, int y) {
    super(x, y);
    sprite = loadImage("heart.png");
    sprite.resize(128, 0);
  }
}
