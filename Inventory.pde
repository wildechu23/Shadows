public class Inventory {
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp powerUp;
  
  public Inventory() {
  }
  
  public void update(Player player) {
    primaryWeapon = player.getPrimary();
    secondaryWeapon = player.getSecondary();
    primaryWeapon.sprite.resize(128,0);
    secondaryWeapon.sprite.resize(64,0);
    powerUp = player.getPower();
  }
  
  public void draw() {
    noFill();
    stroke(180);
    strokeWeight(3);
    rect(width-220, 650, 168, 128,10);
    text("1", width-210,680);
    rect(width-220, 790, 168, 64,10);
    text("2", width-210,820);
    image(primaryWeapon.sprite, width - 180, 650);
    image(secondaryWeapon.sprite, width - 150, 790);
  }
}
