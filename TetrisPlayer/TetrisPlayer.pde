import java.util.*;

int score;
int highScore;
int level;
ArrayDeque<Piece> nextPieces;
boolean isPaused;
boolean started;
Piece currentPiece;
TetrisGame game;
public static final int I = 1;
public static final int O = 2;
public static final int T = 3;
public static final int S = 4;
public static final int Z = 5;
public static final int J = 6;
public static final int L = 7;

void setup() {
  size(800,800);
  game = new TetrisGame();
  isPaused = false;
  started = false;
  currentPiece = new LPiece();
  //for(int i = 0; i < 3; i++) {
  //  nextPieces.add(randPiece());
  //}
}

void draw() {
  if(started == false) { // start screen
    textSize(50);
    text("TETRIS (press any key to start)", 100, 40);
    if(frameCount % 10 == 0) {
      int[][] testBoard = new int[20][10];
      Random rng = new Random();
      for(int i = 0; i < testBoard.length; i++) {
        for(int j = 0; j < testBoard[i].length; j++) {
          testBoard[i][j] = rng.nextInt(8);
        }
      }
      drawBoard(testBoard);
    }
  }
  else if(started && !isPaused) {
    // enter game loop
    background(196);
    textSize(50);
    fill(0,0,0);
    text("TETRIS",335,40);
    
    // game stuff here
    drawBoard(currentPiece.getPiece());
  }
}

void keyPressed() {
  if(started == false) {
    started = true;
  }
  else if(started) {
    if(key == 'z' || key == 'Z') {
      currentPiece.rotateLeft();
    }
    else if(key == 'x' || key == 'X') {
      currentPiece.rotateRight();
    }
  }
}

void newPiece() {
}

void pauseGame() {
}

boolean checkGameOver() {
  return true;
}

void drawBoard(int[][] board) {
  int rows = board.length;
  int cols = board[0].length;
  int squareSize = 35;
  // dimensions: 20 rows of blocks, 10 cols of blocks
  // 350 size wide, starting 225, ending at 575
  // 700 size down, starting at 50, ending at 750
  for(int x = 225; x + squareSize <= 575; x += squareSize) {
    for(int y = 50; y + squareSize <= 750; y += squareSize) {
      int currentColor = board[(y- 50) / squareSize][(x - 225) / squareSize];
      if(currentColor == I) { // I tetrominoe is cyan
        fill(0,255,255);
      }
      else if(currentColor == O) { // O is yellow
        fill(255,255,0);
      }
      else if(currentColor == T) { // T is purple
        fill(255,0,255);
      }
      else if(currentColor == S) { // S is green
        fill(0,255,0);
      }
      else if(currentColor == Z) { // Z is red
        fill(255,0,0);
      }
      else if(currentColor == J) { // J is blue
        fill(0,0,255);
      }
      else if(currentColor == L) { // L is orange
        fill(255,127,0);
      }
      else {
        fill(255,255,255);
      }
      square(x,y,squareSize);
    }
  }
 
  
}

Piece randPiece() {
  Piece randPiece = new Piece();
  return randPiece;
}
