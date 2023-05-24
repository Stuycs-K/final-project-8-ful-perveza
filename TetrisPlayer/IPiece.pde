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
