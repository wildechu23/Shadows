public class Room {
  private PImage tileMap;
  private PImage ground, rock, upWall, leftWall, downWall, rightWall, tlCorner, trCorner, dlCorner, drCorner;
  private int[][] tileArray;
  private ArrayList<Rock> rocks;
  public ArrayList<Enemy> enemies;
 
  public Room(int roomNum) {
    rocks = new ArrayList<Rock>();
    enemies = new ArrayList<Enemy>();
    this.tileArray = loadTileArray(roomNum);
    int numEnemy = (int)(Math.random() * 4) + 2;
    for (int i = 0; i < numEnemy; i++) {
      int type = round((float)((Math.random() * 1) + 1));
      switch(type) {
        case 1:
          enemies.add(new Skeleton());
          break;
        case 2:
          enemies.add(new Bat());
          break;
      }
      int x = (int)(Math.random() * 9) + 1;
      int y = (int)(Math.random() * 5) + 1;
      while (tileArray[y][x] == 1) {
        x = (int)(Math.random() * 9) + 1;
        y = (int)(Math.random() * 5) + 1;
      }
      enemies.get(i).x = 128 * x;
      enemies.get(i).y = 128 * y;
    }
    ground = loadImage("tempGround.png");
    rock = loadImage("tempRock.png");
    upWall = loadImage("upWall.png");
    leftWall = loadImage("leftWall.png");
    downWall = loadImage("downWall.png");
    rightWall = loadImage("rightWall.png");
    tlCorner = loadImage("TLcorner.png");
    trCorner = loadImage("TRcorner.png");
    dlCorner = loadImage("DLcorner.png");
    drCorner = loadImage("DRcorner.png");
    ground.resize(128,0);
    rock.resize(128,0);
    upWall.resize(128,0);
    leftWall.resize(128,0);
    rightWall.resize(128,0);
    downWall.resize(128,0);
    tlCorner.resize(128,0);
    trCorner.resize(128,0);
    dlCorner.resize(128,0);
    drCorner.resize(128,0);
  }
  
  public void draw() {
    for(int i = 0; i < tileArray.length; i++) {
      for(int j = 0; j < tileArray[i].length; j++) {
        int tile = tileArray[i][j];
        int x = (j)*128;
        int y = i*128;
        switch(tile) {
          case 0:
            image(ground, x, y);
            break;
          case 1:
            image(rock, x, y);
            break;
          case 2:
            image(upWall, x, y);
            break;
          case 3:
            image(leftWall, x, y);
            break;
          case 4:
            image(downWall, x, y);
            break;
          case 5:
            image(rightWall, x, y);
            break;
           case 6:
             image(tlCorner, x, y);
             break;
           case 7:
             image(trCorner, x, y);
             break;
           case 8:
             image(dlCorner, x, y);
             break;
           case 9:
             image(drCorner, x, y);
             break;
           case 10:
             image(rock, x, y);
             break;
          default:
            throw new RuntimeException("Does not recognize tile number: " + tile);
        }
      }
    }
  }
  
  public void update() {
    //for(int i = 0; i < tileArray.length; i++) {
    //  for(int j = 0; j < tileArray[i].length; j++) {
    //    print(tileArray[i][j]);
    //  }
    //  print("\n");
    //}
    //print("\n");
  }
  
  private int[][] loadTileArray(int roomNum) {
    int[][] array = new int[7][13];
    BufferedReader reader;
    String line;
    reader = createReader("rooms.txt");
    int count = 0;
    try {
      while(count < roomNum + 1) {
        line = reader.readLine();
        if(line.substring(0,1).equals("*")) {
          count++;
        }
      }
      for(int i = 0; i < 7; i++) {
        line = reader.readLine();
        for(int j = 0; j < 13; j++) {
          if (line.substring(j, j+1).equals("d")) {
            array[i][j] = 10;
          }
          else {
            array[i][j] = Integer.parseInt(line.substring(j,j+1));
          }
          if (array[i][j] != 0 && array[i][j] != 10) {
            rocks.add(new Rock(j * 128, i * 128));
          }
          else if (array[i][j] == 10) {
            System.out.println("door");
            if (i == 0) rocks.add(new Door(j * 128, i * 128, "left"));
            if (i == array.length - 1) rocks.add(new Door(j * 128, i * 128, "right"));
            if (j == 0) rocks.add(new Door(j * 128, i * 128, "up"));
            if (j == array[0].length - 1) rocks.add(new Door(j * 128, i * 128, "down"));
          }
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return array;
  }
}
