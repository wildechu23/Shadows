public class Game {
  private boolean isRunning;
  private Floor floor;
  
  public Game() {
    isRunning = true;
    floor = new Floor();
  }
  
  public void draw() {
    fill(255);
    rect(50,50,100,100);
    //floor.draw();
  }
  
  public void update() {
    floor.update();
  }
  
  public boolean running() {
    return isRunning;
  }
}
