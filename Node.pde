public class Node {
  public float cost, x, y;
  public Node(Node node, Player player) {
    cost = node.cost + dist(player.getX(), player.getY(), x, y);
  }
  public Node(int x, int y, Enemy enemy) {
    this.x = x;
    this.y = y;
    cost = dist(x, y, enemy.x, enemy.y);
  }
}
