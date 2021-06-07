public class Player extends Character{
  private int shields, dashCooldown, dx, dy, speed;
  float attackCD;
  //private Weapon primaryWeapon, secondaryWeapon;
  //private PowerUp currentPower;
  public boolean isPowerActive;
  private PImage[] sprites;
  private int spriteNum;
  public boolean isAlive;
  public Player() {
    sprites = new PImage[2];
    sprite[0] = loadImage("ninja.png");
    sprite[1] = loadImage("mirrorNinja.png");
    for(PImage sprite : sprites) {
      resize(sprite, 64, 0);
    }
    spriteNum = 0;
    speed = 8;
    x = 500;
    y = 400;
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
  
  public void move() {
    x += dx * speed; 
    y += dy * speed;
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
    image(sprite[spriteNum], x, y);
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
}
