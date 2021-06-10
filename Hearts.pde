public class Hearts {
  private int num;
  private PImage heart, half;
  public Hearts(int heartNum) {
    heart = loadImage("heart.png");
    half = loadImage("halfHeart.png");
    num = heartNum;
  }
  
  public void update(Player player) {
    num = player.getHearts();
  }
  
  public void draw() {
    for(int i = 0; i < num; i += 2) {
      if(i + 1 < num) {
        image(heart,i*40 + 20, 20); 
      } else {
        image(half, i*40 + 20, 20);
      }   
    }
  }
}
