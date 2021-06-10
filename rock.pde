public class Rock {
  PImage sprite;
  int x, y;
  public Rock(int x, int y) {
    sprite = loadImage("tempRock.png");
    this.x = x;
    this.y = y;
  }
  
  public int[] isColliding(Player player) {
    int[] arr = new int[2];
    arr[0] = 1;
    arr[1] = 1;
    int xloc = player.x + player.dx * player.speed;
    //println("xloc: ", xloc);
    //println("x: ", x);
    int yloc = player.y + player.dy * player.speed;
    if ((xloc > x - 60 && xloc < x + 128 && player.y > y - 88 && player.y < y + 120)) {
      arr[0] = 0;
    }
    if ((player.x > x - 60 && player.x < x + 128 && yloc > y - 88 && yloc < y + 120)) {
      arr[1] = 0;
    }
    
    return arr;
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
