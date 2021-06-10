import java.lang.reflect.*;

public class Game {
  public boolean isRunning;
  private Floor floor;
  private UI ui;
  public Player player;
  public ArrayList<Enemy> enemies;
  public ArrayList<Projectile> projectiles;
  private Shadows shadows;
  
  public Game(Shadows shadows) {
    this.shadows = shadows;
    isRunning = true;
    floor = new Floor();
    ui = new UI();
    player = new Player();
    enemies = new ArrayList<Enemy>();
    projectiles = new ArrayList<Projectile>();
    enemies.add(new Necromancer());
    enemies.get(0).x = 400;
    enemies.get(0).y = 400;
  }
  
  public void draw() {
    //fill(255);
    //rect(50,50,100,100);
    floor.draw();
    player.draw();
    for (Enemy enemy : enemies) {
      enemy.draw(player);
    }
    for(Projectile proj : projectiles) {
      proj.draw();
    }
    ui.draw();
  }
  
  public void update() {
    for(int i = 0; i < projectiles.size(); i++) {
      Projectile proj = projectiles.get(i);
      for (Rock rocks : floor.roomArray[3][3].rocks) {
        if (projectiles.size() > 0 && rocks.isColliding(proj)) {
          projectiles.remove(i);
          continue;
        }
      }
      proj.update();
      if(proj.getX() < -100 || proj.getX() > width + 100 || proj.getY() < -100 || proj.getY() > height + 100) {
        projectiles.remove(i);
      }
      //println(proj.getCharacter().getClass());
      for (Enemy enemy : enemies) {
        if ((projectiles.size() > 0 && proj.getCharacter() instanceof Player && proj.isColliding(enemy))) {
          projectiles.remove(i);
          break;
        }
      }
      if (projectiles.size() > 0 && (proj.getCharacter() instanceof Enemy && proj.isColliding(player))) {
        projectiles.remove(i);
      }
    }
   if (player.isAlive == false) {
      isRunning = false;
    }
    player.update();
    floor.update();
    player.move(floor.roomArray[3][3]);
    for (int i = 0; i < enemies.size(); i++) {
      if (enemies.get(i).isAlive == false) {
        enemies.remove(i);
        continue;
      }
      enemies.get(i).move(player, this);
      enemies.get(i).update();
    }
    //println("Projectiles size: ", projectiles.size()); 
    
    ui.update(player);
    //if (enemy != null) {
    //  for(int i = 0; i < enemy.projectiles.size(); i++) {
    //    Projectile proj = enemy.projectiles.get(i);
    //    proj.update();
    //    if(proj.getX() < -100 || proj.getX() > width + 100 || proj.getY() < -100 || proj.getY() > height + 100) {
    //      enemy.projectiles.remove(i);
    //    }
    //    if (proj.isColliding(player)) {
    //      enemy.projectiles.remove(i);
    //    }
    //  }
    //}
  }
  
  public boolean running() {
    return isRunning;
  }
  
  public void click(boolean mouseLeft) {
    if(mouseLeft && System.currentTimeMillis() / 1000 - player.time >= player.attackCD) {
      Weapon p = player.primaryWeapon;
      Class c = p.projectile;
      try {
        //Constructor<Projectile>[] constructors = c.getDeclaredConstructors();
        //for(Constructor<Projectile> con : constructors) {
        //  println(con);
        //}
        Constructor<Projectile> constructor = c.getDeclaredConstructor(new Class[]{Shadows.class, Player.class});
        projectiles.add(constructor.newInstance(shadows, player));
      } catch(Exception e) {
        e.printStackTrace();
      }
      player.time = System.currentTimeMillis() / 1000;
      //print(projectiles.size());
    }
  }
}
