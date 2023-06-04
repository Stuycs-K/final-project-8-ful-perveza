import java.util.*;
import processing.sound.*;

int score;
SoundFile file;
int highScore;
int level;
String scoreName = "";
int play;
int lines;
int passed;
int scoreTime;
ArrayDeque<Piece> nextPieces;
ArrayList<Piece> generatedPieces;
boolean isPaused;
boolean started;
boolean isGameOver;
Piece currentPiece;
TetrisGame game;
Controller keyboardInput;
int cooldown;
int fallCooldown;
int gameOverCooldown;
int hardDropCooldown;
public static final int I = 1;
public static final int O = 2;
public static final int T = 3;
public static final int S = 4;
public static final int Z = 5;
public static final int J = 6;
public static final int L = 7;

void setup() {
  size(800, 800);
  file = new SoundFile(this, "Tetris.wav");
  file.loop();
  startGame();
}

void draw() {
  hardDropCooldown--;
  if (started == false) { // start screen
    textSize(50);
    textAlign(CENTER);
    text("TETRIS (press any key to start)", 400, 40);
    //rect(200,40,20,20);
    
    if (frameCount % 10 == 0) {
      int[][] testBoard = new int[20][10];
      Random rng = new Random();
      for (int i = 0; i < testBoard.length; i++) {
        for (int j = 0; j < testBoard[i].length; j++) {
          testBoard[i][j] = rng.nextInt(8);
        }
      }
      drawBoard(testBoard);
    }
    
  }
  if(isGameOver) {
    if(highScore <= score){
      highScore = score;
    }
    play++;
    background(196);
    textSize(30);
    fill(0, 0, 0);
    textAlign(CENTER);
    text("GAME OVER (SCORE: " + score +") PRESS ANY KEY TO RESTART", 400, 40);
    drawBoard(game.getDisplayBoard());
    gameOverCooldown--;
  }
  if (started && !isPaused && fallCooldown > 0 && !isGameOver) {
    fallCooldown--;
  } 
  else if (started && !isPaused && fallCooldown == 0) {
    fallCooldown = game.setNewCooldown(level);
  //  if(lines - 10*(level) >= 0){
  //  //lines = 0;
  //  level++;
  //  fallCooldown -= 20;
  //  //fallCooldown-=10;
  //}
    if (!currentPiece.shiftDown()) {
      newPiece();
    } 
    else {
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        newPiece();
      }
    }
    drawBoard(game.getDisplayBoard());
  }
  if (started && !isPaused && frameCount % 6 == 0 && !isGameOver) {
    // enter game loop
    background(196);
    textSize(50);
    fill(0,0,0);
    textAlign(CENTER);
    text("TETRIS",400,40);
    text("SCORE",100,200);
    text(score,100,270);
    text("LINES",100,350);
    text(lines,100,420);
    text("LEVEL",100,550);
    text(level,100,630);
    text("HIGH", 700,270);
    text("SCORE", 700,310);
    text(highScore,700,380);
    text(scoreName,700,550);
    // game stuff here
    if (cooldown > 0) {
      cooldown--;
    }
    if (keyboardInput.isPressed(Controller.P1_LEFT)) {
      currentPiece.shiftLeft();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.shiftRight();
      }
      drawBoard(game.getDisplayBoard());
    }
    if (keyboardInput.isPressed(Controller.P1_RIGHT)) {
      currentPiece.shiftRight();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.shiftLeft();
      }
      drawBoard(game.getDisplayBoard());
    }
    if (keyboardInput.isPressed(Controller.P1_DOWN)) {
      score++;
      if(play == 0){
        highScore++;
      }
      if (!currentPiece.shiftDown()) {
        newPiece();
      } else {
        game.setPieceBoard(currentPiece.getPiece());
        boolean tick = game.gameTick();
        if (!tick) {
          newPiece();
        }
        drawBoard(game.getDisplayBoard());
      }
    }
    if (keyboardInput.isPressed(Controller.P1_DROP) && hardDropCooldown <= 0) {
      hardDropCooldown = 15;
      hardDrop();
    }
    drawBoard(game.getDisplayBoard());
  }
}

void keyPressed() {
  if (started == false) {
    started = true;
  } 
  else if(isGameOver && gameOverCooldown <= 0) {
    startGame();
  }
  else if (cooldown == 0) {
    cooldown = 1;
    if (keyCode == 'Z') {
      currentPiece.rotateLeft();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.rotateRight();
      }
      drawBoard(game.getDisplayBoard());
    } 
    else if (keyCode == 'X') {
      currentPiece.rotateRight();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.rotateLeft();
      }
      drawBoard(game.getDisplayBoard());
    } 
    else {
      keyboardInput.press(keyCode);
    }
  }
}

void keyReleased() {
  keyboardInput.release(keyCode);
}

void newPiece() {
  delay(500);
  game.newSetBoard();
  int x = game.clearLines();
  
  lines += x;
  if(millis() - passed > scoreTime){
    scoreName = game.setLinesName(x);
    passed = millis();
  }
  if(lines - 10*(level) >= 0){
    level++;
  }
  
  //if(lines - 10*(level) >= 0){
  //  //lines = 0;
  //  level++;
  //  //fallCooldown-=10;
  //}
  score+=game.scoreAdd(level,x);
  if(play == 0){
    highScore+=game.scoreAdd(level,x);
  }
  currentPiece = nextPieces.removeLast();
  game.setPieceBoard(currentPiece.getPiece());
  nextPieces.add(betterRandPiece());
  boolean gameOver = game.gameTick();
  if(!gameOver) {
    isGameOver = true;
  }
}

void hardDrop() {
  while(true) {
    if (!currentPiece.shiftDown()) {
      newPiece();
      break;
    } 
    else {
      score+=2;
      if(play == 0){
        highScore += 2;
      }
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        newPiece();
        break;
      }
    }
  }
  drawBoard(game.getDisplayBoard());
}

void pauseGame() {
}

void startGame() {
  background(196);
  game = new TetrisGame();
  passed = millis();
  scoreName = "";
  //highScore = 0;
  scoreTime = 2000;
  //highScore = 0;
  isPaused = false;
  started = false;
  isGameOver = false;
  generatePieces();
  currentPiece = betterRandPiece();
  game.setPieceBoard(currentPiece.getPiece());
  keyboardInput = new Controller();
  cooldown = 0;
  fallCooldown = 0;
  gameOverCooldown = 60;
  hardDropCooldown = 30;
  level = 1;
  score = 0;
  //highScore = 0;
  lines = 0;
  nextPieces = new ArrayDeque<Piece>();
  for(int i = 0; i < 3; i++) {
    nextPieces.add(betterRandPiece());
  }
}

void drawBoard(int[][] board) {
  int squareSize = 35;
  // dimensions: 20 rows of blocks, 10 cols of blocks
  // 350 size wide, starting 225, ending at 575
  // 700 size down, starting at 50, ending at 750
  for (int x = 225; x + squareSize <= 575; x += squareSize) {
    for (int y = 50; y + squareSize <= 750; y += squareSize) {
      int currentColor = board[(y- 50) / squareSize][(x - 225) / squareSize];
      if (currentColor == I) { // I tetrominoe is cyan
        fill(0, 255, 255);
      } else if (currentColor == O) { // O is yellow
        fill(255, 255, 0);
      } else if (currentColor == T) { // T is purple
        fill(255, 0, 255);
      } else if (currentColor == S) { // S is green
        fill(0, 255, 0);
      } else if (currentColor == Z) { // Z is red
        fill(255, 0, 0);
      } else if (currentColor == J) { // J is blue
        fill(0, 0, 255);
      } else if (currentColor == L) { // L is orange
        fill(255, 127, 0);
      } else {
        fill(255, 255, 255);
      }
      square(x, y, squareSize);
    }
  }
}

Piece randPiece() {
  ArrayList<Piece> pieces = new ArrayList<Piece>();
  Piece I = new IPiece();
  Piece J = new JPiece();
  Piece L= new LPiece();
  Piece O = new OPiece();
  Piece S = new SPiece();
  Piece Z = new ZPiece();
  Piece T= new TPiece();


  pieces.add(I);
  pieces.add(J);
  pieces.add(S);
  pieces.add(Z);
  pieces.add(T);
  pieces.add(O);
  pieces.add(L);


  Random rng = new Random();
  int choice = rng.nextInt(pieces.size());
  return pieces.get(choice);
}

Piece betterRandPiece() {
  if(generatedPieces.size() == 1) {
     Piece newPiece = generatedPieces.remove(0);
     generatePieces();
     return newPiece;
  }
  else {
    return generatedPieces.remove(0);
  }
}

void generatePieces() {
  generatedPieces = new ArrayList<Piece>();
  generatedPieces.add(new IPiece());
  generatedPieces.add(new JPiece());
  generatedPieces.add(new LPiece());
  generatedPieces.add(new OPiece());
  generatedPieces.add(new SPiece());
  generatedPieces.add(new ZPiece());
  generatedPieces.add(new TPiece());
  
  Collections.shuffle(generatedPieces);
}
