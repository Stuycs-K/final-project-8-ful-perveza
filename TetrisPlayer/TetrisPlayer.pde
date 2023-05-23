import java.util.*;

int score;
int highScore;
int level;
ArrayDeque<Piece> nextPieces;
boolean isPaused;
Piece currentPiece;
TetrisGame game;

void setup() {
  size(800,800);
}

void draw() {
  drawBoard(new int[20][10]);
}

void keyPressed() {
}

void newPiece() {
}

void startGame() {
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
  // 300 size wide, starting 150, ending at 450
  // 600 size down, starting at 100, ending at 500
  for(int x = 225; x + squareSize <= 575; x += squareSize) {
    for(int y = 50; y + squareSize <= 750; y += squareSize) {
      square(x,y,squareSize);
    }
  }
 
  
}

Piece randPiece() {
  Piece randPiece = new Piece();
  return randPiece;
}
