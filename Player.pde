public class Player {
  private int hearts, shields, dashCooldown, x, y, dx, dy, speed;
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp currentPower;
  private boolean isPowerActive;
  private PImage sprite;
  public boolean isAlive;
  public Player() {
    sprite = loadImage("Necromancer.png");
    speed = 8;
    x = 500;
    y = 400;
    dx = 0;
    dy = 0;
    isAlive = true;
    hearts = 10;
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
  
  public void pressed(boolean w, boolean a, boolean s, boolean d) { 
    if (a) dx = -1;
    if (d) dx = 1;
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
    image(sprite, x, y);
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  public void setHearts(int newHeart) {
    hearts = newHeart;
    if (hearts <= 0) {
      isAlive = false;
    }
  }
  public int getHearts() {
    return hearts;
  }
}
