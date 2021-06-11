public class UI {
  private Hearts hearts;
  private Inventory inventory;
  public UI() {
    hearts = new Hearts(5);
    inventory = new Inventory();
  }
  
  public void update(Player player) {
    hearts.update(player); 
    inventory.update(player);
  }
  
  public void draw() {
    hearts.draw();
    inventory.draw();
  }
}
