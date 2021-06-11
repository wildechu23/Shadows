public class Shurikens extends Weapon {
  public Shurikens() {
    this.name = "Shurikens";
    this.projectile = Shuriken.class;
    this.sprite = loadImage("Shurikens.png");
    this.sprite.resize(128,0);
  }
}
