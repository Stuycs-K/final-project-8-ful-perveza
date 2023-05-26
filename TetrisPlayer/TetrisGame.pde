class TetrisGame {
  int[][] displayBoard;
  int[][] setBoard;
  int[][] currentPieceBoard;
  int[][] tempBoard;
  
  public TetrisGame() {
    displayBoard = new int[20][10];
    setBoard = new int[20][10];
    currentPieceBoard = new int[20][10];
    tempBoard = new int[20][10];
  }
  
  boolean gameTick() {
    return true;
  }
  
  boolean copyOverBoard() {
    // compare non-zero values of currentPieceBoard with tempBoard
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
