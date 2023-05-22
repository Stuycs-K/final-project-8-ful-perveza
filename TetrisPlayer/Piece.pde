class Piece{
  private int[][] pieceBoard;
  private int xorigin;
  private int yorigin;
  
  
  public Piece(){
    this.pieceBoard = new int[10][20];
    for(int i = 0; i < 10; i++){
      for(int j = 0; j < 20; j++){
        pieceBoard[10][20] = 0;
      }
    }
    
  }
  
  public void rotateLeft(){
    
  }
  
  public void rotateRight(){
    
  }
  
  public boolean shiftDown(){
    return true;
  }
  
  public boolean shiftLeft(){
    return true;
  }
  
  public boolean shiftRight(){
    return true;
  }
  
  public int[][] getPiece(){
    return pieceBoard;
  }
  
  public void setPiece(){
    
  }
  
  
  
  
}
