public class rock {
  PImage sprite;
  int x, y;
  public rock(int x, int y) {
    sprite = loadImage("tempRock.png");
    this.x = x;
    this.y = y;
  }
  
  public boolean isColliding(Player player) {
    int xloc = player.x + player.dx + player.speed;
    int yloc = player.y + player.dy + player.speed;
    if ((xloc >= x && xloc <= x + 128 && yloc >= y && yloc <= y + 128) || (xloc + 64 >= x && xloc + 64 <= x + 128 && yloc + 64 >= y && yloc + 64 <= y + 128)) {
      return true;
    }
    return false;
  }
  public boolean isColliding(Projectile projectile) {
    float xloc = projectile.x + cos(projectile.angle) * projectile.speed;
    float yloc = projectile.y + sin(projectile.angle) * projectile.speed;
    if ((xloc >= x && xloc <= x + 128 && yloc >= y && yloc <= y + 128) || (xloc + 64 >= x && xloc + 64 <= x + 128 && yloc + 64 >= y && yloc + 64 <= y + 128)) {
      return true;
    }
    return false;
  }
}
