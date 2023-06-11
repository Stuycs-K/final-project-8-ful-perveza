import java.util.*;
import processing.sound.*;

int score;
SoundFile file;
SoundFile file2;
SoundFile file3;
int highScore;
int level;
boolean paused;
String scoreName = "";
int play;
int lines;
int passed;
int scoreTime;
LinkedList<Piece> nextPieces;
ArrayList<Piece> generatedPieces;
Piece heldPiece;
boolean heldPieceEmpty;
boolean heldPieceThisTurn;
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
int[][] sidePieces;
int[][] heldPieceDisplay;
PImage bg;
int mode;
String modeName;
int time;
boolean zone;
int zoneCooldown;
boolean zoneFull;
int zoneLines;
SoundFile file4;
SoundFile file5;
SoundFile file6;
SoundFile file7;
public static final int I = 1;
public static final int O = 2;
public static final int T = 3;
public static final int S = 4;
public static final int Z = 5;
public static final int J = 6;
public static final int L = 7;

void setup() {
  bg = loadImage("tetris3.png");
  size(800, 800);
  file = new SoundFile(this, "Tetris.wav");
  file2 = new SoundFile(this, "vine-boom.wav");
  file3 = new SoundFile(this, "clear.wav");
  file4 = new SoundFile(this, "Nope-Sound-Effect.wav");
  file5 = new SoundFile(this,"WOW.wav");
  file6 = new SoundFile(this,"kool-aid-oh-yeah.wav");
  file7 = new SoundFile(this,"roblox.wav");
  file.loop();
  startGame();
}

void draw() {
  zoneCooldown--;
  if (zoneCooldown < 0 && zone) {
    file7.play();
    zone = false;
    zoneFull = false;
  }
  hardDropCooldown--;
  if (cooldown > 0) {
    cooldown--;
  }
  if (started == false) {
    // start screen
    textSize(50);
    textAlign(CENTER);
    text("TETRIS (press any key to start)", 400, 40);
    textSize(30);

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
    //fill(255);
    //background(196);
  }
  if (isGameOver) {
    if (highScore <= score) {
      highScore = score;
      String hi = str(highScore);
      String[] scoreKeep = split(hi, ' ');
      saveStrings("score.txt", scoreKeep);
    }
    play++;
    background(bg);
    textSize(30);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER (SCORE: " + score +") PRESS ANY KEY TO RESTART", 400, 40);
    drawBoard(game.getDisplayBoard());
    gameOverCooldown--;
  }
  if (started && !isPaused && fallCooldown > 0 && !isGameOver && !zone) {
    fallCooldown--;
  } else if (started && !isPaused && fallCooldown == 0) {
    fallCooldown = game.setNewCooldown(level);
    //  if(lines - 10*(level) >= 0){
    //  //lines = 0;
    //  level++;
    //  fallCooldown -= 20;
    //  //fallCooldown-=10;
    //}
    if (!currentPiece.shiftDown()) {
      newPiece();
      drawBoard(game.getDisplayBoard());
    } else {
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        newPiece();
        drawBoard(game.getDisplayBoard());
      }
    }
    drawBoard(game.getDisplayBoard());
  }
  if (started && !isPaused && frameCount % 6 == 0 && !isGameOver) {
    // enter game loop
    background(bg);
    String zoneProg = "";
    textSize(50);
    fill(255);
    textAlign(CENTER);
    text("TETRIS", 400, 40);
    if (mode == 1) {
      text("HOLD", 105, 70);
    }
    text("SCORE", 100, 250);
    text(score, 100, 320);
    text("LINES", 100, 400);
    text(lines, 100, 470);
    if (zoneFull && mode == 1) {
      zoneProg = "FULL!";
    }
    if (zone && mode == 1) {
      zoneProg = "ZONE!";
    }
    if(mode == 1){
    text(zoneProg, 100, 700);
    }
    text("LEVEL", 100, 550);
    text(level, 100, 630);
    text("HIGH", 700, 130);
    text("SCORE", 700, 170);
    text(highScore, 700, 240);
    text(scoreName, 700, 300);
    textSize(30);
    if (mode == 1) {
      text("NEXT PIECES", 700, 390);
    }
    // game stuff here
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
      if (!currentPiece.shiftDown()) {
        newPiece();
      } else {
        if (zone) {
          score+=2;
        } else {
          score++;
        }
        if (play == 0 && highScore == 0) {
          if (zone) {
            highScore+=2;
          } else {
            highScore++;
          }
        }
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
    if (mode == 1) {
      drawSidePieces();
      drawHeldPiece();
    }
  }
}

void keyPressed() {
  if (keyCode == 'P' && started) {
    pauseGame();
  }
  if (started == false) {
    started = true;
  } else if (isGameOver && gameOverCooldown <= 0) {
    startGame();
  } else if (cooldown == 0) {
    cooldown = 1;
    if (keyCode == 'Z') {
      currentPiece.rotateLeft();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.rotateRight();
      }
      drawBoard(game.getDisplayBoard());
    } else if (keyCode == 'X') {
      currentPiece.rotateRight();
      game.setPieceBoard(currentPiece.getPiece());
      boolean tick = game.gameTick();
      if (!tick) {
        currentPiece.rotateLeft();
      }
      drawBoard(game.getDisplayBoard());
    } else if (keyCode == 'C' && mode == 1) {
      setHeldPiece();
    } else if (keyCode == 'A' && mode == 1) {
      if(zoneFull || zone){
        file5.play();
      zone = true;
      zoneCooldown = 1200;
      }
      else{
        //text("NOT YET!", 100, 700);
         file4.play();
        }

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
  //delay(500);
  game.newSetBoard();
  int x = game.clearLines();
  if (x > 0 && mode == 1) {
    file3.play();
  }
  if (x > 0 && mode == 2) {
    file2.play();
  }
  lines += x;
  if(!zone){
  zoneLines += x;
  }
  if (millis() - passed > scoreTime) {
    boolean empty = true;
    for (int i = 0; i < game.getDisplayBoard().length; i++) {
      for (int j = 0; j < game.getDisplayBoard()[i].length; j++) {
        if (game.getDisplayBoard()[i][j] != 0) {
          empty = false;
        }
      }
    }
    if (empty && zone) {
      scoreName = "PERFECT CLEAR";
    } else {
      scoreName = game.setLinesName(x);
    }
    passed = millis();
  }
  if (lines - 10*(level) >= 0) {
    level++;
  }
  if (zoneLines == 5 && !zone) {
    zoneLines = 0;
    zoneFull = true;
    file6.play();
  }

  //if(lines - 10*(level) >= 0){
  //  //lines = 0;
  //  level++;
  //  //fallCooldown-=10;
  //}
  if (zone) {
    score+= 2 * game.scoreAdd(level, x);
  } else {
    score+= game.scoreAdd(level, x);
  }
  if (play == 0 && highScore == 0) {
    if (zone) {
      highScore+= 2 * game.scoreAdd(level, x);
    } else {
      highScore+= game.scoreAdd(level, x);
    }
  }
  currentPiece = nextPieces.removeFirst();
  game.setPieceBoard(currentPiece.getPiece());
  if (mode == 1) {
    nextPieces.add(betterRandPiece());
  } else {
    nextPieces.add(randPiece());
  }
  setSidePieceDisplay();
  boolean gameOver = game.gameTick();
  if (!gameOver) {
    isGameOver = true;
  }
  heldPieceThisTurn = false;
}

void hardDrop() {
  while (true) {
    if (!currentPiece.shiftDown()) {
      newPiece();
      break;
    } else {
      score+=2;
      if (play == 0 && highScore == 0) {
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
  isPaused = !isPaused;
  if (isPaused == true) {
    fill(255);
    text("GAME IS PAUSED, CLICK AGAIN TO RESUME!", 400, 780);
  }
}

void startGame() {
  background(bg);
  game = new TetrisGame();
  passed = millis();
  //time = millis();
  zone = false;
  zoneFull = false;
  scoreName = "";
  //highScore = 0;
  zoneLines = 0;
  scoreTime = 500;
  String[] scores = loadStrings("score.txt");
  highScore = Integer.parseInt(scores[0]);
  //highScore = 0;
  isPaused = false;
  paused = false;
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
  nextPieces = new LinkedList<Piece>();
  mode = 1;
  modeName = "HEAVEN";
  for (int i = 0; i < 3; i++) {
    nextPieces.add(betterRandPiece());
  }
  sidePieces = new int[12][4];
  setSidePieceDisplay();
  heldPieceDisplay = new int[4][4];
  heldPiece = new Piece();
  heldPieceEmpty = true;
  heldPieceThisTurn = false;
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
        fill(231, 240, 17);
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
      } else if (currentColor == -1) {
        fill(128, 128, 128);
      } else {
        fill(255, 255, 255);
      }
      square(x, y, squareSize);
    }
  }

  //rect(110,340,20,20);
  if (!started) {
    fill(255);
    text("SELECT A LEVEL", 110, 300);
    fill(196);
    rect(90, 310, 40, 40);
    fill(255);
    String s = level + "";
    text(s, 110, 340);
    fill(255);
    text("UP", 50, 370);
    text("DOWN", 170, 370);

    textAlign(CENTER);
    text("SELECT A MODE", 110, 500);
    text("HEAVEN OR HELL", 110, 540);
    if (mode == 1) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }
    rect(50, 570, 120, 40);
    fill(255);
    text(modeName, 110, 600);

    fill(0, 0, 255);
    rect(50, 620, 50, 50);
    fill(255, 0, 0);
    rect(120, 620, 50, 50);
    fill(255);
  }

  if (started && !isGameOver) {
    fill(255);
    rect(675, 15, 50, 50);
    fill(0);
    text("P", 700, 50);
  }
}



void drawSidePieces() {
  int squareSize = 25;
  // dimensions: 12 rows of blocks, 4 cols of blocks
  for (int x = 650; x + squareSize <= 750; x += squareSize) {
    for (int y = 400; y + squareSize <= 700; y += squareSize) {
      int currentColor = sidePieces[(y- 400) / squareSize][(x - 650) / squareSize];
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

void drawHeldPiece() {
  int squareSize = 25;
  // dimensions: 4 rows of blocks, 4 cols of blocks
  for (int x = 55; x + squareSize <= 155; x += squareSize) {
    for (int y = 90; y + squareSize <= 190; y += squareSize) {
      int currentColor = heldPieceDisplay[(y- 90) / squareSize][(x - 55) / squareSize];
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

void setHeldPiece() {
  if (heldPieceEmpty) {
    heldPieceEmpty = false;
    heldPieceThisTurn = true;
    heldPiece = currentPiece;
    heldPiece.reset();
    int[][] ary = heldPiece.getPiece();
    for (int i = 3; i <= 6; i++) {
      for (int j = 0; j <= 3; j++) {
        heldPieceDisplay[j][i - 3] = ary[j][i];
      }
    }

    currentPiece = nextPieces.removeFirst();
    game.setPieceBoard(currentPiece.getPiece());
    nextPieces.add(betterRandPiece());
    setSidePieceDisplay();
    boolean gameOver = game.gameTick();
    if (!gameOver) {
      isGameOver = true;
    }
  } else if (heldPieceThisTurn == false) {
    heldPieceThisTurn = true;
    Piece temp = heldPiece;
    heldPiece = currentPiece;
    heldPiece.reset();
    int[][] ary = heldPiece.getPiece();
    for (int i = 3; i <= 6; i++) {
      for (int j = 0; j <= 3; j++) {
        heldPieceDisplay[j][i - 3] = ary[j][i];
      }
    }
    currentPiece = temp;
    game.setPieceBoard(currentPiece.getPiece());
    boolean gameOver = game.gameTick();
    if (!gameOver) {
      isGameOver = true;
    }
  }
  drawBoard(game.getDisplayBoard());
}

void mouseClicked() {
  if (!started) {
    if (mouseX <= 70 && mouseX >=40 && mouseY <=400 && mouseY >= 350 && level + 1 < 13) {
      level++;
    } else if (mouseX <= 190 && mouseX >=120 && mouseY <=400 && mouseY >= 350 && level - 1 > 0) {
      level--;
    }

    if (mouseX >= 50 && mouseX <= 100 && mouseY >= 620 && mouseY <= 670) {
      mode = 1;
      modeName = "HEAVEN";
      generatePieces();
      currentPiece = betterRandPiece();
      nextPieces = new LinkedList<Piece>();
      for (int i = 0; i < 3; i++) {
        nextPieces.add(betterRandPiece());
      }
    } else if (mouseX >= 120 && mouseX <= 170 && mouseY >= 620 && mouseY <= 670) {
      mode = 2;
      modeName = "HELL";
      currentPiece = randPiece();
      nextPieces = new LinkedList<Piece>();
      for (int i = 0; i < 3; i++) {
        nextPieces.add(randPiece());
      }
    }
  }
  if (started && mouseX <= 810 && mouseX >=660 && mouseY <=170 && mouseY >= 10) {
    pauseGame();
  }
}

void setSidePieceDisplay() {
  Piece piece1 = nextPieces.get(0);
  Piece piece2 = nextPieces.get(1);
  Piece piece3 = nextPieces.get(2);

  int[][] ary1 = piece1.getPiece();
  int[][] ary2 = piece2.getPiece();
  int[][] ary3 = piece3.getPiece();

  for (int i = 3; i <= 6; i++) {
    for (int j = 0; j <= 3; j++) {
      sidePieces[j][i - 3] = ary1[j][i];
    }
  }
  for (int i = 3; i <= 6; i++) {
    for (int j = 0; j <= 3; j++) {
      sidePieces[4 + j][i - 3] = ary2[j][i];
    }
  }
  for (int i = 3; i <= 6; i++) {
    for (int j = 0; j <= 3; j++) {
      sidePieces[8 + j][i - 3] = ary3[j][i];
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
  if (generatedPieces.size() == 1) {
    Piece newPiece = generatedPieces.remove(0);
    generatePieces();
    return newPiece;
  } else {
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
