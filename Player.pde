public class Player extends Character{
  private int shields, dashCooldown, dx, dy, speed, normal;
  float attackCD;
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp currentPower;
  public boolean isPowerActive;
  private PImage[] animation;
  private int spriteNum;
  public boolean isAlive, isMirror;
  double time3;
  public Player() {
    animation = new PImage[4];
    animation[0] = loadImage("ninja.png");
    animation[1] = loadImage("swordstance.png");
    animation[2] = loadImage("swordslash2.png");
    animation[3] = loadImage("swordslash3.png");
    primaryWeapon = new Sword();
    animation[0].resize(64, 0);
    animation[1].resize(64, 0);
    animation[2].resize(64, 0);
    animation[3].resize(64, 0);
    if (primaryWeapon instanceof Sword) {
      normal = 1;
    }
    else {
      normal = 0;
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
    time3 = System.currentTimeMillis();
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
      //else {
        if (floor.cRoom.rocks.get(i).isColliding(this)[0] == 0) {
          canMovex = false;
        }
        if (floor.cRoom.rocks.get(i).isColliding(this)[1] == 0) {
          canMovey = false;
        }
      //}
    }
    if (canMovex == true) {
      x += dx * speed;
    }
    if (canMovey == true) {
      y += dy * speed;
    }
    //println(canMovex, canMovey);
  }
  public void update() {
    if (hearts <= 0) {
      isAlive = false;
    }
  }
  public void pressed(boolean w, boolean a, boolean s, boolean d) { 
    if (a) {
      dx = -1;
      isMirror = true;
      //spriteNum = 0;
    }
    if (d) {
      dx = 1;
      isMirror = false;
      //spriteNum = 1;
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
    int index = normal;
    if (tint == true && System.currentTimeMillis() - time2 <= 500) {
      tint(0, 153, 100, 100);
    }
    else {
      tint = false;
    }
    if (System.currentTimeMillis() - time3 <= 250) {
      index = 2;
    }
    else if (System.currentTimeMillis() - time3 <= 500) {
      index = 3;
    }
    pushMatrix();
    if(isMirror) {
      scale(-1,1);
      translate(-(2*x + animation[index].width),0);
    }
    image(animation[index], x, y);
    popMatrix();
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
