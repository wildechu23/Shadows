public class Floor {
  private Room[][] roomArray;
  Room cRoom; // currentRoom
  int[] cRoomCoords; // [x, y]
  
  
  public Floor() {
    roomArray = new Room[5][5];
    roomGeneration();
    cRoomCoords = new int[]{3,3};
    cRoom = roomArray[cRoomCoords[0]][cRoomCoords[1]];
  }
  
  public void roomGeneration() {
    //for now, just manually add some rooms
    for (int i = 0; i < roomArray.length; i++) {
      for (int j = 0; j < roomArray[0].length; j++) {
        roomArray[i][j] = new Room(1);
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
