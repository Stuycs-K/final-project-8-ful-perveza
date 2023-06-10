import java.util.*;
class TetrisGame {
  int[][] displayBoard;
  int[][] setBoard;
  int[][] currentPieceBoard;
  int[][] tempBoard;
  int[][] tempPieceBoard;

  public TetrisGame() {
    displayBoard = new int[20][10];
    setBoard = new int[20][10];
    currentPieceBoard = new int[20][10];
    tempBoard = new int[20][10];
    tempPieceBoard = new int[20][10];
  }

  boolean gameTick() {
    boolean tick = copyOverBoard();
    if (tick) {
      displayBoard = new int[20][10];
      for (int i = 0; i < displayBoard.length; i++) {
        for (int j = 0; j < displayBoard[i].length; j++) {
          displayBoard[i][j] = tempBoard[i][j];
        }
      }
      makeOutline();
      return true;
    }
    return false;
  }

  boolean copyOverBoard() {
    // compare non-zero values of currentPieceBoard with tempBoard
    tempBoard = new int[20][10];
    for (int i = 0; i < currentPieceBoard.length; i++) {
      for (int j = 0; j < currentPieceBoard[i].length; j++) {
        tempBoard[i][j] = setBoard[i][j];
      }
    }
    for (int i = 0; i < currentPieceBoard.length; i++) {
      for (int j = 0; j < currentPieceBoard[i].length; j++) {
        if (currentPieceBoard[i][j] != 0) {
          if (tempBoard[i][j] > 0) {
            return false;
          } else {
            tempBoard[i][j] = currentPieceBoard[i][j];
          }
        }
      }
    }
    return true;
  }

  boolean copyOverBoardTemp() {
    // compare non-zero values of tempPieceBoard with tempBoard
    tempBoard = new int[20][10];
    for (int i = 0; i < tempPieceBoard.length; i++) {
      for (int j = 0; j < tempPieceBoard[i].length; j++) {
        tempBoard[i][j] = setBoard[i][j];
      }
    }
    for (int i = 0; i < tempPieceBoard.length; i++) {
      for (int j = 0; j < tempPieceBoard[i].length; j++) {
        if (tempPieceBoard[i][j] != 0) {
          if (tempBoard[i][j] > 0) {
            return false;
          }
        }
      }
    }
    return true;
  }

  void newSetBoard() {
    for (int i = 0; i < displayBoard.length; i++) {
      for (int j = 0; j < displayBoard[i].length; j++) {
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

  void makeOutline() {
    tempPieceBoard = new int[20][10];
    for (int i = 0; i < currentPieceBoard.length; i++) {
      for (int j = 0; j < currentPieceBoard[i].length; j++) {
        tempPieceBoard[i][j] = currentPieceBoard[i][j];
      }
    }
    while (true) {
      if (!shiftPieceDown()) {
        break;
      } 
      else {
        boolean tick = copyOverBoardTemp();
        if (!tick) {
          shiftUp();
          break;
        }
      }
    }
    for (int i = 0; i < tempPieceBoard.length; i++) {
        for (int j = 0; j < tempPieceBoard[i].length; j++) {
          if (tempPieceBoard[i][j] != 0) {
            if(displayBoard[i][j] == 0) {
              displayBoard[i][j] = -1;
            }
          }
        }
      }
    for (int i = 0; i < currentPieceBoard.length; i++) {
      for (int j = 0; j < currentPieceBoard[i].length; j++) {
        if (currentPieceBoard[i][j] != 0) {
          if (displayBoard[i][j] == -1) {
            displayBoard[i][j] = currentPieceBoard[i][j];
          }
        }
      }
    }
  }

  boolean shiftPieceDown() {
    boolean isShifted = false;
    for (int i = 0; i  < tempPieceBoard[0].length; i++) {
      if (tempPieceBoard[19][i] != 0) {
        return false;
      }
    }
    for (int row = tempPieceBoard.length - 1; row > 0; row--) {
      for (int col = 0; col < tempPieceBoard[row].length; col++) {
        if (tempPieceBoard[row][col] == 0 && tempPieceBoard[row - 1][col] != 0) {
          isShifted = true;
          int temp = tempPieceBoard[row - 1][col];
          tempPieceBoard[row - 1][col] = 0;
          tempPieceBoard[row][col] = temp;
        }
      }
    }
    return isShifted;
  }

  boolean shiftUp() {
    boolean isShifted = false;
    //for (int i = 0; i  < tempPieceBoard[0].length; i++) {
    //  if (tempPieceBoard[3][i] != 0) {
    //    return false;
    //  }
    //}
    for (int row = 1; row < tempPieceBoard.length; row++) {
      for (int col = 0; col < tempPieceBoard[row].length; col++) {
        if (tempPieceBoard[row - 1][col] == 0 && tempPieceBoard[row][col] != 0) {
          isShifted = true;
          int temp = tempPieceBoard[row][col];
          tempPieceBoard[row - 1][col] = temp;
          tempPieceBoard[row][col] = 0;
        }
      }
    }
    return isShifted;
  }

  void setPieceBoard(int[][] newPieceBoard) {
    currentPieceBoard = new int[20][10];
    for (int i = 0; i < currentPieceBoard.length; i++) {
      for (int j = 0; j < currentPieceBoard[i].length; j++) {
        currentPieceBoard[i][j] = newPieceBoard[i][j];
      }
    }
  }

  int clearLines() {
    int lines = 0;
    int counter = 0;
    for (int i = 0; i < setBoard.length; i++) {
      for (int j = 0; j < setBoard[0].length; j++) {
        if (setBoard[i][j] > 0) {
          counter++;
        }
      }
      if (counter == setBoard[0].length) {
        lines ++;
        for (int o = 0; o < setBoard[i].length; o++) {
          setBoard[i][o] = 0;
        }
        int w = i;
        for (int a = i; a >= 1; a--) {
          for (int p = 0; p < setBoard[0].length; p++) {
            setBoard[a][p] = setBoard[a-1][p];
            setBoard[a-1][p] = 0;
          }
        }
        i--;
        counter = 0;
      }
      counter = 0;
    }
    return lines;
  }
  
  int clearZone() {
    int lines = 0;
    int counter = 0;
    for (int i = 0; i < setBoard.length; i++) {
      for (int j = 0; j < setBoard[0].length; j++) {
        if (setBoard[i][j] > 0) {
          counter++;
        }
      }
      if (counter == setBoard[0].length) {
        lines ++;
        for (int o = 0; o < setBoard[i].length; o++) {
          setBoard[i][o] = 255;
        }
        i--;
        counter = 0;
      }
      counter = 0;
    }
    return lines;
  }

  int scoreAdd(int level, int lines) {
    if (lines == 1) {
      return 100*(level);
    }
    if (lines == 2) {
      return 300*(level);
    }
    if (lines == 3) {
      return 500*(level);
    }
    if (lines == 4) {
      return 800*(level);
    } else {
      return 0;
    }
  }

  int setNewCooldown(int level) {
    if(level <= 12){
    return 60-(level-1)*5;
    }
    else{
      return 60-(12-1)*5;
    }
  }

  String setLinesName(int lines) {
    if (lines == 1) {
      return "SINGLE!";
    }
    if (lines == 2) {
      return "DOUBLE!";
    }
    if (lines == 3) {
      return "TRIPLE!";
    }
    if (lines == 4) {
      return "TETRIS!";
    }
    else if(lines > 4){
      return "NICE!";
    }
    else{
      return "";
    }
  }
}
