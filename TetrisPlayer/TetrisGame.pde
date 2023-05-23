class TetrisGame {
  int[][] displayBoard;
  int[][] setBoard;
  int[][] currentPieceBoard;
  int[][] tempBoard;
  
  public TetrisGame() {
    displayBoard = new int[10][20];
    setBoard = new int[10][20];
    currentPieceBoard = new int[10][20];
    tempBoard = new int[10][20];
  }
  
  boolean gameTick() {
    return true;
  }
  
  boolean copyOverBoard() {
    return true;
  }
  
  void newSetBoard() {
    setBoard = displayBoard;
    tempBoard = displayBoard;
  }
  
  int[][] getDisplayBoard() {
    return displayBoard;
  }
  
  void setPieceBoard(int[][] newPieceBoard) {
    currentPieceBoard = newPieceBoard;
  }
  
  void clearLines() {
  }
}
