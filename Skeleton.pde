public class Skeleton extends Enemy {
  public Skeleton() {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
  }
  public Skeleton(int x, int y) {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
    this.x = x;
    this.y = y;
  }
  
  public void move(Player player, Game game) {
    attack(player, game);
  }
  public void attack(Player player, Game game) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      game.projectiles.add(new Shuriken(this, player));
      //println(game.projectiles);
      time = System.currentTimeMillis() / 1000;
    }
  }
}
