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
  
  void clearLines(int[][] ary){
    int counter = 0;
    for(int i = 0; i < ary.length; i++){
      for(int j = 0; j < ary[0].length; j++){
        if(ary[i][j] != 0){
          counter++;
        }
      }
      if(counter == ary[0].length){
        for(int o = 0; o < ary[i].length; o++){
          ary[i][o] = 0;
        }
        int w = i;
        for(int a = i; a >= 1; a--){
          for(int p = 0; p < ary[0].length; p++){
            ary[a][p] = ary[a-1][p];
            ary[a-1][p] = 0;
          }
        }
        i--;
        counter = 0;
      }
      counter = 0;
    }
  }
}
