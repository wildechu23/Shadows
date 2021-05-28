public class Room {
  private PImage tileMap;
  private int[][] tileArray;
  
  public Room(int roomNum) {
    this.tileArray = loadTileArray(roomNum);
  }
  
  public void draw() {
    PImage ground = loadImage("tempGround.png");
    PImage rock = loadImage("tempRock.png");
    ground.resize(128,0);
    rock.resize(128,0);
    for(int i = 0; i < tileArray.length; i++) {
      for(int j = 0; j < tileArray[i].length; j++) {
        int tile = tileArray[i][j];
        switch(tile) {
          case 0:
            image(ground, (j+1)*128, i*128);
            break;
          case 1:
            image(rock, (j+1)*128, i*128);
            break;
          default:
            throw new RuntimeException("Does not recognize tile number");
        }
      }
    }
  }
  
  public void update() {
    for(int i = 0; i < tileArray.length; i++) {
      for(int j = 0; j < tileArray[i].length; j++) {
        print(tileArray[i][j]);
      }
      print("\n");
    }
    print("\n");
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
          array[i][j] = Integer.parseInt(line.substring(j,j+1));
        }
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
    return array;
  }
}
