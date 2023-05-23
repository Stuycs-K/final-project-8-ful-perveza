class Piece{
<<<<<<< HEAD
  private int[][] pieceBoard;

  
  
  public Piece(){
    this.pieceBoard = new int[20][10];
    for(int i = 0; i < 20; i++){
      for(int j = 0; j < 10; j++){
        pieceBoard[i][j] = 0;
=======
  private int[][][] pieceBoard;
  private int[][] pieceBoardN;
  private int[][] pieceBoardR;
  private int[][] pieceBoardL;
  private int xorigin;
  private int yorigin;
  
  
  public Piece(){
    this.pieceBoardN = new int[10][20];
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 20; j++){
        pieceBoard[10][20] = 0;
>>>>>>> fc8f599623ea0cd48e51e6a1c4c44bb9a8f3615b
      }
    }
    this.pieceBoardL = new int[10][20];
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 20; j++){
        pieceBoard[10][20] = 0;
      }
    }
    this.pieceBoardR = new int[10][20];
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 20; j++){
        pieceBoard[10][20] = 0;
      }
    }
    this.pieceBoard = new int[][][] {pieceBoardN, pieceBoardL, pieceBoardR};
    xorigin = 10;
    yorigin = 0;
    
    
    
  }
  
<<<<<<< HEAD
=======
  public void rotateRight(){
    
  }
  
  public boolean shiftDown(){
    return true;
  }
  
  public boolean shiftLeft(){
    pieceBoardR = pieceBoardN;
    pieceBoardN = pieceBoardL;
  }
  
  public boolean shiftRight(){
    pieceBoardL = pieceBoardN;
    pieceBoardN = pieceBoardR;
  }
  
>>>>>>> fc8f599623ea0cd48e51e6a1c4c44bb9a8f3615b
  public int[][] getPiece(){
    return pieceBoardN;
  }
  
  public void newPiece(int[][] ary){
    ary = pieceBoard;
  }
  
  
  
}
