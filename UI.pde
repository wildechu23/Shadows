public class UI {
  private Hearts hearts;
  public UI() {
    hearts = new Hearts(5);
  }
  
  public void update(Player player) {
    hearts.update(player); 
  }
  
  public void draw() {
    hearts.draw();
  }
}
