class Piece{
  private int[][] pieceBoard;

  
  
  public Piece(){
    this.pieceBoard = new int[20][10];
    for(int i = 0; i < 20; i++){
      for(int j = 0; j < 10; j++){
        pieceBoard[i][j] = 0;
      }
    }
    
  public int[][] getPiece(){
    return pieceBoard;
  }
  
  public void setBoard(int[][]ary){
    pieceBoard = ary;
  }
    

  
  
  
}
