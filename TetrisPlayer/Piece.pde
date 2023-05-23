class Piece{
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
  
  public void rotateLeft(){
    
  }
  
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
  
  public int[][] getPiece(){
    return pieceBoardN;
  }
  
  public void setPiece(){
    
  }
  
  
  
  
}
