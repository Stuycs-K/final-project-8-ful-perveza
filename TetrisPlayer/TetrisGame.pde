import java.util.*;
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
    boolean tick = copyOverBoard();
    if(tick) {
      displayBoard = new int[20][10];
      for(int i = 0; i < displayBoard.length; i++) {
        for(int j = 0; j < displayBoard[i].length; j++) {
          displayBoard[i][j] = tempBoard[i][j];
        }
      }
      return true;
    }
    return false;
  }
  
  boolean copyOverBoard() {
    // compare non-zero values of currentPieceBoard with tempBoard
    tempBoard = new int[20][10];
    for(int i = 0; i < currentPieceBoard.length; i++) {
      for(int j = 0; j < currentPieceBoard[i].length; j++) {
        tempBoard[i][j] = setBoard[i][j];
      }
    }
    for(int i = 0; i < currentPieceBoard.length; i++) {
      for(int j = 0; j < currentPieceBoard[i].length; j++) {
        if(currentPieceBoard[i][j] != 0) {
          if(tempBoard[i][j] != 0) {
            return false;
          }
          else {
          tempBoard[i][j] = currentPieceBoard[i][j];;
          }
        }
      }
    }
    return true;
  }
  
  void newSetBoard() {
    for(int i = 0; i < displayBoard.length; i++) {
      for(int j = 0; j < displayBoard[i].length; j++) {
         setBoard[i][j] = displayBoard[i][j];
      }
   }
  }
  
  int[][] getDisplayBoard() {
    return displayBoard;
  }
  
  int[][] getPiece() {
    return currentPieceBoard;
  }
  
  int[][] getTemp() {
    return tempBoard;
  }
  
  int[][] getSet() {
    return setBoard;
  }
  
  void setPieceBoard(int[][] newPieceBoard) {
    currentPieceBoard = new int[20][10];
    for(int i = 0; i < currentPieceBoard.length; i++) {
       for(int j = 0; j < currentPieceBoard[i].length; j++) {
         currentPieceBoard[i][j] = newPieceBoard[i][j];
       }
    }
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
