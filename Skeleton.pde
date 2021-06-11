public class Skeleton extends Enemy {
  public double time3;
  public PImage animation;
  public Skeleton() {
    super("skeleton.png");
    animation = loadImage("skeleton2.png");
    animation.resize(64, 0);
    sprite.resize(64, 0);
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    time2 = System.currentTimeMillis();
    time3 = System.currentTimeMillis() - 500;
    hearts = 5;
    size = 64;
  }
  public Skeleton(int x, int y) {
    super("skeleton.png");
    animation = loadImage("skeleton2.png");
    animation.resize(64, 0);
    sprite.resize(64, 0);
    attackCD = 5;
    time = System.currentTimeMillis() / 1000 - attackCD;
    time2 = System.currentTimeMillis();
    time3 = System.currentTimeMillis() - 250;
    hearts = 5;
    this.x = x;
    this.y = y;
    size = 64;
  }
  
  public void draw(Player player) {
    if (tint == true && System.currentTimeMillis() - time2 <= 500) {
      tint(0, 153, 100, 100);
    }
    else {
      tint = false;
    }
    if (System.currentTimeMillis() - time3 <= 500) {
      image(animation, x, y);
    }
    else {
      image(sprite, x, y);
    }
    noTint();
  }
  
  public void move(Player player, Game game) {
    attack(player, game);
  }
  public void attack(Player player, Game game) {
    if (System.currentTimeMillis() / 1000 - time >= attackCD) {
      game.projectiles.add(new Arrow(this, player));
      //println(game.projectiles);
      time = System.currentTimeMillis() / 1000;
      time3 = System.currentTimeMillis();
    }
  }
}
