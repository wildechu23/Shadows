public class Necromancer extends Enemy{
  public Necromancer() {
    super("Necromancer.png");
    attackCD = 10;
    time = System.currentTimeMillis() / 1000 - attackCD;
    hearts = 10;
  }
  public void move(Player player, Game game) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      attack(player, game);
      time = System.currentTimeMillis() / 1000;
    }
  }
  
  public void attack(Player player, Game game) {
    for (int i = 0; i < 3; i++) {
      int type = round((float)((Math.random() * 1) + 1));
      if (type == 1) {
        game.enemies.add(new Skeleton((int)(Math.random() * (width - 64)), (int)(Math.random() * (height - 64))));
 
      }
      if (type == 2) {
        game.enemies.add(new Bat((int)(Math.random() * (width - 64)), (int)(Math.random() * (height - 64))));
      }}   }
}
