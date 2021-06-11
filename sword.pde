public class sword extends Weapon{
  int range;
  int damage;
  public sword() {
    super();
    range = 120;
    damage = 2;
  }
  public void attack(Game game) {
    float angle = atan2(mouseY - game.player.y, mouseX - game.player.x);
    for (Enemy enemy : game.floor.cRoom.enemies) {
      if (dist(enemy.x, enemy.y, game.player.x, game.player.y) <= range && Math.abs(angle - atan2(enemy.y - game.player.y, enemy.x - game.player.x)) <= 60) {
        enemy.tint = true;
        enemy.time2 = System.currentTimeMillis();
        enemy.hearts -= damage;
      }
    }
  }
}
