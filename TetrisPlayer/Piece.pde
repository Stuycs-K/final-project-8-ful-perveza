class Piece{
  private int[][] pieceBoard;
  private int xorigin;
  private int yorigin;
  
  
  public Piece(){
    this.pieceBoard = new int[20][10];
  }
  
  public void rotateLeft(){
    
  }
  
  public void rotateRight(){
    
  }
  
  public boolean shiftDown(){
    delay(300);
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
  
  public void reset(){
  }
  
  public void makeGhost() {
    for(int i = 0; i < pieceBoard.length; i++) {
      for(int j = 0; j < pieceBoard.length; j++) {
        if(pieceBoard[i][j] > 0) {
          pieceBoard[i][j] = -1;
        }
      }
    }
  }
  
  
  
  
}
