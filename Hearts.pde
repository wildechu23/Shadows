public class Hearts {
  private int num;
  private PImage sprite;
  public Hearts(int heartNum) {
    sprite = loadImage("heart.png");
    num = heartNum;
  }
  
  public void update(Player player) {
    num = player.getHearts();
  }
  
  public void draw() {
    for(int i = 0; i < num; i++) {
      image(sprite,i*80 + 20, 20); 
    }
  }
}
