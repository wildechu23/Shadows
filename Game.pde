public class Game {
  private boolean isRunning;
  private Floor floor;
  public Player player;
  public Enemy enemy;
  private ArrayList<Projectile> projectiles;
  
  public Game() {
    isRunning = true;
    floor = new Floor();
    player = new Player();
    enemy = new Enemy();
    projectiles = new ArrayList<Projectile>();
  }
  
  public void draw() {
    //fill(255);
    //rect(50,50,100,100);
    //floor.draw();
    player.draw();
    enemy.draw();
    for(Projectile proj : projectiles) {
      proj.draw(); 
    }
  }
  
  public void update() {
    floor.update();
    player.move();
    enemy.move();
    for(int i = 0; i < projectiles.size(); i++) {
      Projectile proj = projectiles.get(i);
      proj.update();
      if(proj.getX() < -100 || proj.getX() > width + 100 || proj.getY() < -100 || proj.getY() > height + 100) {
        projectiles.remove(i);
      };
    }
  }
  
  public boolean running() {
    return isRunning;
  }
  
  public void click(boolean mouseLeft) {
    if(mouseLeft) {
      projectiles.add(new Shuriken(player));
      print(projectiles.size());
    }
  }
}
