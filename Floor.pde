public class Floor {
  private Room[][] roomArray;
  Room cRoom; // currentRoom
  int[] cRoomCoords; // [x, y]
  
  
  public Floor() {
    roomArray = new Room[5][5];
    roomGeneration();
    cRoomCoords = new int[]{4,0};
    cRoom = roomArray[cRoomCoords[0]][cRoomCoords[1]];
  }
  
  public void roomGeneration() {
    //for now, just manually add some rooms
    for (int i = 0; i < roomArray.length; i++) {
      for (int j = 0; j < roomArray[0].length; j++) {
        if (i == 0 && j == 0) roomArray[i][j] = (new Room(6));
        else if (i == 0 && j == 4) roomArray[i][j] = (new Room(8, 0));
        else if (i == 4 && j == 0) roomArray[i][j] = (new Room(4));
        else if (i == 4 && j == 4) roomArray[i][j] = (new Room(10));
        else if (i == 0) roomArray[i][j] = (new Room(11));
        else if (j == 0) roomArray[i][j] = (new Room(5));
        else if (i == 4) roomArray[i][j] = (new Room(7));
        else if (j == 4) roomArray[i][j] = (new Room(9));
        else roomArray[i][j] = (new Room(round((float)((Math.random() * 3)))));
      }
    }
  }
  
  public void draw() {
    cRoom.draw();
  }
  
  public void update() {
    //cRoom.update();
  }
}
