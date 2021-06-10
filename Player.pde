public class Player extends Character{
  private int shields, dashCooldown, dx, dy, speed;
  float attackCD;
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp currentPower;
  public boolean isPowerActive;
  private PImage[] sprites;
  private int spriteNum;
  public boolean isAlive;
  public Player() {
    sprites = new PImage[2];
    sprites[0] = loadImage("ninja.png");
    sprites[1] = loadImage("mirrorNinja.png");
    primaryWeapon = new Shurikens();
    for(PImage sprite : sprites) {
      sprite.resize(64, 0);
    }
    spriteNum = 0;
    speed = 8;
    x = 400;
    y = 300;
    dx = 0;
    dy = 0;
    isAlive = true;
    hearts = 10;
    tint = false;
    attackCD = 0.5;
    time = System.currentTimeMillis() / 1000 - 1;
    time2 = System.currentTimeMillis();
    size = 64;
  }
  public void setSpeed(int newSpeed) {
    speed = newSpeed;
  }
  public int getSpeed() {
    return speed;
  }
  
  public void move(Floor floor) {
    boolean canMovex = true;
    boolean canMovey = true;
    for (int i = 0; i < floor.cRoom.rocks.size(); i++) {
      if (floor.cRoom.rocks.get(i) instanceof Door && (floor.cRoom.rocks.get(i).isColliding(this)[0] == 0 || floor.cRoom.rocks.get(i).isColliding(this)[1] == 0)) {
        System.out.println("hewwo");
        switch(floor.cRoom.rocks.get(i).direction) {
          case "left":
            floor.cRoomCoords[0] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            break;
          case "right":
            floor.cRoomCoords[0] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            break;
          case "up":
            floor.cRoomCoords[0] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            break;
          case "down":
            floor.cRoomCoords[0] -= 1;
            floor.cRoom = floor.roomArray[floor.cRoomCoords[0]][floor.cRoomCoords[1]];
            break;
        }
      }
      else {
        if (floor.cRoom.rocks.get(i).isColliding(this)[0] == 0) {
          canMovex = false;
        }
        if (floor.cRoom.rocks.get(i).isColliding(this)[1] == 0) {
          canMovey = false;
        }
      }
    }
    if (canMovex == true) {
      x += dx * speed;
    }
    if (canMovey == true) {
      y += dy * speed;
    }
  }
  public void update() {
    if (hearts <= 0) {
      isAlive = false;
    }
  }
  public void pressed(boolean w, boolean a, boolean s, boolean d) { 
    if (a) {
      dx = -1;
      spriteNum = 0;
    }
    if (d) {
      dx = 1;
      spriteNum = 1;
    }
    if (w) dy = -1;
    if (s) dy = 1;
  }
  public void released(boolean w, boolean a, boolean s, boolean d) { 
    if (a) dx = 0;
    if (d) dx = 0;
    if (w) dy = 0;
    if (s) dy = 0;
  }
  
  public void draw() {
    if (tint == true && System.currentTimeMillis() - time2 <= 500) {
      tint(0, 153, 100, 100);
    }
    else {
      tint = false;
    }
    image(sprites[spriteNum], x, y);
    noTint();
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public int getHearts() {
    return hearts;
  }
  
  public Weapon getPrimary() {
    return primaryWeapon;
  }
  
  public Weapon getSecondary() {
    return secondaryWeapon;
  }
  
  public PowerUp getPower() {
    return currentPower;
  }
}
