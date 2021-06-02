public class Skeleton extends Enemy {
  public Skeleton() {
    super("Necromancer.png");
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 5;
  }
  
  public void move(Player player) {
    //attack(player);
  }
  public void attack(Player player, Game game) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      game.projectiles.add(new Shuriken(this, player));
      //println(game.projectiles);
      time = System.currentTimeMillis() / 1000;
    }
  }
}
