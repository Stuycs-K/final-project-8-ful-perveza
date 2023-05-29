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
  
  void clearLines() {
  }
}
