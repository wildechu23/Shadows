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
  }
  
  public void draw() {
    cRoom.draw();
  }
  
  public void update() {
    //cRoom.update();
  }
}