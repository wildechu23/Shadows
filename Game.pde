public class Game {
  private boolean isRunning;
  private Floor floor;
  private Player player;
  
  public Game() {
    isRunning = true;
    floor = new Floor();
    player = new Player();
  }
  
  public void draw() {
    //fill(255);
    //rect(50,50,100,100);
    //floor.draw();
    //player.move();
    player.makePlayer();
  }
  void keyPressed() {
    System.out.println("hello");
  }
  
  public void update() {
    floor.update();
  }
  
  public boolean running() {
    return isRunning;
  }
}
