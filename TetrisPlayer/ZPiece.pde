class ZPiece extends Piece{
  private int[][] pieceBoard;
  private int xorigin;
  private int yorigin;
  private int[][][] rotations;
  private int currentRotation;
  public ZPiece(){
    this.pieceBoard = new int[20][10];
    xorigin = 0;
    yorigin = 3;
    currentRotation = 0;
    rotations = new int[][][]{
      { 
        {0,0,0,0},
        {Z,Z,0,0},
        {0,Z,Z,0},
        {0,0,0,0},
      },
      {
        {0,0,0,0},
        {0,Z,0,0},
        {Z,Z,0,0},
        {Z,0,0,0},
      },
      {
        {0,0,0,0},
        {0,0,0,0},
        {Z,Z,0,0},
        {0,Z,Z,0},
      },
      {
        {0,0,0,0},
        {0,0,Z,0},
        {0,Z,Z,0},
        {0,Z,0,0},
      }
    };
    pieceBoard[xorigin][yorigin] = rotations[currentRotation][0][0];
    pieceBoard[xorigin + 1][yorigin] = rotations[currentRotation][1][0];
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[xorigin + i][yorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[xorigin][yorigin] = 5;
  }
  
  public void rotateLeft(){
    if(currentRotation == 3) {
      currentRotation = 0;
    }
    else {
      currentRotation++;
    }
    pieceBoard = new int[20][10];
    pieceBoard[xorigin][yorigin] = rotations[currentRotation][0][0];
    pieceBoard[xorigin + 1][yorigin] = rotations[currentRotation][1][0];
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[xorigin + i][yorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[xorigin][yorigin] = 5;
  }
  
  public void rotateRight(){
    if(currentRotation == 0) {
      currentRotation = 3;
    }
    else {
      currentRotation--;
    }
    pieceBoard = new int[20][10];
    pieceBoard[xorigin][yorigin] = rotations[currentRotation][0][0];
    pieceBoard[xorigin + 1][yorigin] = rotations[currentRotation][1][0];
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[xorigin + i][yorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[xorigin][yorigin] = 5;
  }
  
  public boolean shiftDown(){
    return true;
  }
  
  public boolean shiftLeft(){
    return true;
  }
  
  public boolean shiftRight(){
    return true;
  }
  
  public int[][] getPiece(){
    return pieceBoard;
  }
  
  public void setPiece(){
    
  }
}
