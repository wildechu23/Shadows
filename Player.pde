public class Player {
  private int hearts, shields, dashCooldown, x, y, speed;
  private Weapon primaryWeapon, secondaryWeapon;
  private PowerUp currentPower;
  private boolean isPowerActive;
  private PImage sprite;
  public Player() {
    sprite = loadImage("Necromancer.png");
    speed = 5;
    x = 500;
    y = 400;
  }
  public void setSpeed(int newSpeed) {
    speed = newSpeed;
  }
  public int getSpeed() {
    return speed;
  }
  public void move(boolean w, boolean a, boolean s, boolean d) {
  if (w == true && a == true) {
    x -= speed;
    y -= speed;
  }
  else if (w == true && d == true) {
    x += speed;
    y -= speed;
  }
  else if (s == true && a == true) {
    x -= speed;
    y += speed;
  }
  else if (s == true && d == true) {
    x += speed;
    y += speed;
  }
  else if (w == true) {
    y -= speed;
  }
  else if (d == true) {
    x += speed;
  }
  else if (a == true) {
    x -= speed;
  }
  else if (s == true) {
    y += speed;
  }
  }
  public void makePlayer() {
    image(sprite, x, y);
  }
}
