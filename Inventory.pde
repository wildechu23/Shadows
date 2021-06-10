public class Inventory {
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp powerUp;
  private PImage shurikens;
  
  public Inventory() {
    //shurikens = loadImage("shurikens.png");
  }
  
  public void update(Player player) {
    primaryWeapon = player.getPrimary();
    secondaryWeapon = player.getSecondary();
    powerUp = player.getPower();
  }
  
  public void draw() {
    
  }
}
