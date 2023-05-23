class Square extends Piece{
  private int[][] pieceAry;
  private int xorigin;
  private int yorigin;
  private int[][] PB;
  public Square(){
    this.PB = super.getPiece();
    this.xorigin = 0;
    this.yorigin = 5;
  }
  public void rotateLeft(){
    
  }
  
  public void rotateRight(){
    
  }
  
  public boolean shiftDown(){
    if (PB[xorigin+2][yorigin] == 0 && PB[xorigin+2][yorigin+1] == 0){
      xorigin = xorigin +2;
      return true;
    }
    return false;
  }
  
  public boolean shiftLeft(){
   if (PB[xorigin][yorigin-1] == 0 && PB[xorigin+1][yorigin-1] == 0){
      yorigin = yorigin - 1;
      return true;
    }
    return false;
  }
  
  public boolean shiftRight(){
    if (PB[xorigin][yorigin+2] == 0 && PB[xorigin+1][yorigin+2] == 0){
      yorigin = yorigin +1;
      return true;
    }
    return false;
  }
  
  public void setPiece(){
    if(PB[xorigin][yorigin] == 0 && PB[xorigin+1][yorigin] == 0 && PB[xorigin][yorigin+1] == 0 && PB[xorigin+1][yorigin+1] == 0){
      PB[xorigin][yorigin] =1;
      PB[xorigin+1][yorigin] =1;
      PB[xorigin][yorigin+1] =1;
      PB[xorigin+1][yorigin+1] =1;
      
    }
    
  }
  
  
}
