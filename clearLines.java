import java.util.*;

public class clearLines{

  public static void main(String[] args){
    int[][] ary = { {1,0,0}, {5,6,3}, {1,1,1}, {0,1,1}};
    clearLines(ary);
    System.out.println(Arrays.deepToString(ary));

    ary = new int[][]{ {1,1,1}, {5,0,3}, {1,1,1}, {1,1,1}};
    clearLines(ary);
    System.out.println(Arrays.deepToString(ary));
  }

  public static void clearLines(int[][] ary){
    int counter = 0;
    for(int i = 0; i < ary.length; i++){
      for(int j = 0; j < ary[0].length; j++){
        if(ary[i][j] != 0){
          counter++;
        }
      }
      if(counter == ary[0].length){
        for(int o = 0; o < ary[i].length; o++){
          ary[i][o] = 0;
        }
        int w = i;
        for(int a = i; a >= 1; a--){
          for(int p = 0; p < ary[0].length; p++){
            ary[a][p] = ary[a-1][p];
            ary[a-1][p] = 0;
          }
        }
        i--;
        counter = 0;
      }
      counter = 0;
    }
  }

}
