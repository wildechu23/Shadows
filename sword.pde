public class Sword extends Weapon{
  int range;
  int damage;
  public Sword() {
    super();
    range = 120;
    damage = 2;
  }
  public void attack(Game game) {
    float angle = atan2(mouseY - game.player.y, mouseX - game.player.x);
    if (angle >= PI / 2 && angle <= 3 * PI / 2) game.player.isMirror = true;
    else if (game.player.isMirror == true) game.player.isMirror = false;
    for (Enemy enemy : game.floor.cRoom.enemies) {
      if (dist(enemy.x, enemy.y, game.player.x, game.player.y) <= range && Math.abs(angle - atan2(enemy.y - game.player.y, enemy.x - game.player.x)) <= PI / 3) {
        enemy.tint = true;
        enemy.time2 = System.currentTimeMillis();
        enemy.hearts -= damage;
      }
    }
    game.player.time3 = System.currentTimeMillis();
  }
}
