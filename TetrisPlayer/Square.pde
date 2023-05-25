class Square extends Piece{
  private int[][] pieceBoard;
  private int xorigin;
  private int yorigin;
  private int[][][] rotations;
  private int currentRotation;
  public Square(){
    this.pieceBoard = new int[20][10];
    xorigin = 0;
    yorigin = 3;
    currentRotation = 0;
    rotations = new int[][][]{
      { 
        {0,0,0,0},
        {0,O,O,0},
        {0,O,O,0},
        {0,0,0,0},
      },
      {
        {0,0,0,0},
        {0,O,O,0},
        {0,O,O,0},
        {0,0,0,0},
      },
      {
        {0,0,0,0},
        {0,O,O,0},
        {0,O,O,0},
        {0,0,0,0},
      },
      {
        {0,0,0,0},
        {0,O,O,0},
        {0,O,O,0},
        {0,0,0,0},
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
    boolean isShifted = false;
    if(yorigin < 16) {
      yorigin++;
    }
    for(int row = pieceBoard.length - 1; row > 0; row--) {
      for(int col = 0; col < pieceBoard[row].length; col++) {
        if(pieceBoard[row][col] == 0 && pieceBoard[row - 1][col] != 0) {
          isShifted = true;
          int temp = pieceBoard[row - 1][col];
          pieceBoard[row - 1][col] = 0;
          pieceBoard[row][col] = temp;
        }
      }
    }
    return isShifted;
  }
  
  public boolean shiftLeft(){
    boolean isShifted = false;
    if(xorigin != 0) {
      xorigin--;
    }
    for(int row = 0; row < pieceBoard.length; row++) {
      for(int col = 1; col < pieceBoard[row].length; col++) {
        if(pieceBoard[row][col - 1] == 0 && pieceBoard[row][col] != 0) {
          isShifted = true;
          int temp = pieceBoard[row][col];
          pieceBoard[row][col - 1] = temp;
          pieceBoard[row][col] = 0;
        }
      }
    }
    return isShifted;
  }
  
  public boolean shiftRight(){
    boolean isShifted = false;
    if(xorigin < 6) {
      xorigin++;
    }
    for(int row = 0; row < pieceBoard.length; row++) {
      for(int col = pieceBoard[row].length - 2; col > -1; col--) {
        if(pieceBoard[row][col + 1] == 0 && pieceBoard[row][col] != 0) {
          isShifted = true;
          int temp = pieceBoard[row][col];
          pieceBoard[row][col + 1] = temp;
          pieceBoard[row][col] = 0;
        }
      }
    }
    return isShifted;
  }
  
  public int[][] getPiece(){
    return pieceBoard;
  }
  
  public void setPiece(){
    
  }
  
}
