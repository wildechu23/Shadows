public class PowerUp{
  int x, y;
  PImage sprite;
  public PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    sprite = loadImage("ninja.png");
    sprite.resize(64, 0);
  }
  public void draw() {
    image(sprite, x, y);
  }
  
  public int[] isColliding(Player player) {
    int[] arr = new int[2];
    arr[0] = 1;
    arr[1] = 1;
    int xloc = player.x + player.dx * player.speed;
    //println("xloc: ", xloc);
    //println("x: ", x);
    int yloc = player.y + player.dy * player.speed;
    if ((xloc > x - 60 && xloc < x + 64 && player.y > y - 64 && player.y < y + 64)) {
      arr[0] = 0;
    }
    if ((player.x > x - 64 && player.x < x + 64 && yloc > y - 64 && yloc < y + 64)) {
      arr[1] = 0;
    }
    
    return arr;
  }
}
