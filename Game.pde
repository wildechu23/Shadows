import java.lang.reflect.*;

public class Game {
  public boolean isRunning, pause;
  private Floor floor;
  private UI ui;
  public Player player;
  public ArrayList<Projectile> projectiles;
  private Shadows shadows;
  private PImage button;
  
  public Game(Shadows shadows) {
    this.shadows = shadows;
    isRunning = true;
    pause = false;
    floor = new Floor();
    ui = new UI();
    player = new Player();
    projectiles = new ArrayList<Projectile>();
    button = loadImage("pause.png");
    button.resize(64, 0);
  }
  
  public void draw() {
    if(pause == false) {
      //fill(255);
      //rect(50,50,100,100);
      floor.draw();
      player.draw();
      for (Enemy enemy : floor.cRoom.enemies) {
        enemy.draw(player);
      }
      for(Projectile proj : projectiles) {
        proj.draw();
      }
      ui.draw();
    }
    image(button, width - 74, 10);
  }
  
  public void update() {
    for(int i = 0; i < projectiles.size(); i++) {
      Projectile proj = projectiles.get(i);
      for (Rock rocks : floor.cRoom.rocks) {
        if (projectiles.size() > 0 && rocks.isColliding(proj)) {
          
          projectiles.remove(i);
          continue;
        }
      }
      proj.update();
      if(proj.getX() < -100 || proj.getX() > width + 100 || proj.getY() < -100 || proj.getY() > height + 100) {
        projectiles.remove(i);
        continue;
      }
      //println(proj.getCharacter().getClass());
      for (Enemy enemy : floor.cRoom.enemies) {
        if ((projectiles.size() > 0 && proj.getCharacter() instanceof Player && proj.isColliding(enemy))) {
          
          projectiles.remove(i);
          break;
        }
      }
      if (projectiles.size() > 0 && (proj.getCharacter() instanceof Enemy && proj.isColliding(player))) {
        
        projectiles.remove(i);
        continue;
      }
    }
   if (player.isAlive == false) {
      isRunning = false;
    }
    player.update();
    floor.update();
    player.move(floor);
    for (int i = 0; i < floor.cRoom.rocks.size(); i++) {
      if (floor.cRoom.enemies.size() == 0 && floor.cRoom.rocks.get(i) instanceof Door && (floor.cRoom.rocks.get(i).isColliding(player)[0] == 0 || floor.cRoom.rocks.get(i).isColliding(player)[1] == 0)) {
        switch(floor.cRoom.rocks.get(i).direction) {
          case "left":
            floor.cRoomCoords[1] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            player.x = 11 * 128;
            player.y = 3 * 128;
            break;
          case "right":
            floor.cRoomCoords[1] += 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            player.x = 1 * 128;
            player.y = 3 * 128;
            break;
          case "up":
            floor.cRoomCoords[0] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            player.x = 6 * 128;
            player.y = 5 * 128;
            break;
          case "down":
            floor.cRoomCoords[0] += 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            player.x = 6 * 128;
            player.y = 1 * 128;
            break;
        }
      }
      else if (floor.cRoom.enemies.size() == 0 && floor.cRoom.rocks.get(i) instanceof Door) {
        switch (floor.cRoom.rocks.get(i).direction) {
          case "left":
            floor.cRoom.leftDoor = loadImage("leftDoor.png");
            floor.cRoom.leftDoor.resize(128, 0);
            break;
          case "right":
            floor.cRoom.rightDoor = loadImage("rightDoor.png");
            floor.cRoom.rightDoor.resize(128, 0);
            break;
          case "up":
            floor.cRoom.upDoor = loadImage("upDoor.png");
            floor.cRoom.upDoor.resize(128, 0);
            break;
          case "down":
            floor.cRoom.downDoor = loadImage("downDoor.png");
            floor.cRoom.downDoor.resize(128, 0);
            break;
        }
      }
    }
    for (int i = 0; i < floor.cRoom.powerups.size(); i++) {
      if (floor.cRoom.powerups.get(i).isColliding(player)[0] == 0 || floor.cRoom.powerups.get(i).isColliding(player)[1] == 0) {
        if (floor.cRoom.powerups.get(i) instanceof damageUp) {
          player.damage += 1;
        }
        if (floor.cRoom.powerups.get(i) instanceof speedUp) {
          player.speed += 1;
        }
        if (floor.cRoom.powerups.get(i) instanceof Heart && player.hearts < 10) {
          player.hearts += 1;
        }
        floor.cRoom.powerups.remove(i);
      }
    }
    
    for (int i = 0; i < floor.cRoom.enemies.size(); i++) {
      if (floor.cRoom.enemies.get(i).isAlive == false) {
        floor.cRoom.enemies.remove(i);
        
        continue;
      }
      floor.cRoom.enemies.get(i).move(player, this);
      floor.cRoom.enemies.get(i).update(floor);
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
      if (!(p instanceof Sword)) {
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
      }
      else {
        p.attack(this);
      }
      player.time = System.currentTimeMillis() / 1000;
      //print(projectiles.size());
    }
  }
}
