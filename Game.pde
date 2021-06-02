public class Game {
  public boolean isRunning;
  private Floor floor;
  public Player player;
  public Enemy enemy;
  private ArrayList<Projectile> projectiles;
  
  public Game() {
    isRunning = true;
    floor = new Floor();
    player = new Player();
    enemy = new Bat();
    projectiles = new ArrayList<Projectile>();
  }
  
  public void draw() {
    //fill(255);
    //rect(50,50,100,100);
    floor.draw();
    player.draw();
    if (enemy != null) {
      enemy.draw();
    }
    for(Projectile proj : projectiles) {
      proj.draw(); 
    }
  }
  
  public void update() {;
   if (player.isAlive == false) {
      isRunning = false;
    }
    floor.update();
    player.move();
    if (enemy != null && enemy.isAlive == false) {
      enemy = null;
    }
    if (enemy != null) {
      enemy.move(player);
      enemy.update();
    }
    for(int i = 0; i < projectiles.size(); i++) {
      Projectile proj = projectiles.get(i);
      proj.update();
      if(proj.getX() < -100 || proj.getX() > width + 100 || proj.getY() < -100 || proj.getY() > height + 100) {
        projectiles.remove(i);
      }
      if (enemy != null && proj.isColliding(enemy)) {
        projectiles.remove(i);
      }
    }
    if(enemy != null && !enemy.isAlive) {
      enemy = null;
    }
  }
  
  public boolean running() {
    return isRunning;
  }
  
  public void click(boolean mouseLeft) {
    if(mouseLeft) {
      projectiles.add(new Shuriken(player));
      //print(projectiles.size());
    }
  }
}
