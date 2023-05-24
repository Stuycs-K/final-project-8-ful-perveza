class IPiece extends Piece {
  private int[][] pieceBoard;
  private int xorigin;
  private int yorigin;
  private int[][][] rotations;
  private int currentRotation;
  
  
  public IPiece(){
    this.pieceBoard = new int[20][10];
    xorigin = 3;
    yorigin = 0;
    currentRotation = 0;
    rotations = new int[][][]{
      { 
        {0,0,0,0},
        {I,I,I,I},
        {0,0,0,0},
        {0,0,0,0},
      },
      {
        {0,I,0,0},
        {0,I,0,0},
        {0,I,0,0},
        {0,I,0,0},
      },
      {
        {0,0,0,0},
        {0,0,0,0},
        {I,I,I,I},
        {0,0,0,0},
      },
      {
        {0,0,I,0},
        {0,0,I,0},
        {0,0,I,0},
        {0,0,I,0},
      }
    };
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[yorigin + i][xorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[yorigin][xorigin] = 5;
  }
  
  public void rotateLeft(){
    if(currentRotation == 3) {
      currentRotation = 0;
    }
    else {
      currentRotation++;
    }
    pieceBoard = new int[20][10];
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[yorigin + i][xorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[yorigin][xorigin] = 5;
  }
  
  public void rotateRight(){
    if(currentRotation == 0) {
      currentRotation = 3;
    }
    else {
      currentRotation--;
    }
    pieceBoard = new int[20][10];
    for(int i = 0; i < 4; i++) {
      for(int j = 0; j < 4; j++) {
        pieceBoard[yorigin + i][xorigin + j] = rotations[currentRotation][i][j];
      }
    }
    pieceBoard[yorigin][xorigin] = 5;
  }
  
  public boolean shiftDown(){
    return true;
  }
  
  public boolean shiftLeft(){
    if(xorigin != 0) {
      xorigin--;
    }
    for(int row = 0; row < pieceBoard.length; row++) {
      for(int col = 1; col < pieceBoard[row].length; col++) {
        if(pieceBoard[row][col - 1] == 0) {
          int temp = pieceBoard[row][col];
          pieceBoard[row][col - 1] = temp;
          pieceBoard[row][col] = 0;
        }
      }
    }
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
