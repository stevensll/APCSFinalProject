import java.util.ArrayList;
//import java.util.Scanner;
//import java.io.*;


public class Level {
  private ArrayList<ArrayList<Object>> map;
  private int maxMoves;
  private int numBlockers;
  private int xSize;
  private int ySize;

  public Level(int level){
    numBlockers = 0;
    map = new ArrayList<ArrayList<Object>>();
    String [] lines = loadStrings("level"+level+".txt");
    for(int i = 0; i<lines.length; i++){
      System.out.println();
      map.add(new ArrayList<Object>());
      if(i == 0){
        String [] splitter = lines[0].split(" ");
        xSize = Integer.parseInt(splitter[0]);
        ySize = Integer.parseInt(splitter[1]);
        maxMoves = Integer.parseInt(splitter[2]);
      }
      else{
        for(int j = 0; j < xSize; j++){
            String [] splitter = lines[i].split(" ");
            if(splitter[j].equals("E")) {
              map.get(map.size()-1).add(new Integer(0));
              System.out.print(0 + "");
            }
            if(splitter[j].equals("R")) {
              map.get(map.size()-1).add(new Candy("red"));
              System.out.print("R ");
            }
            if(splitter[j].equals("G")) {
              map.get(map.size()-1).add(new Candy("green"));
              System.out.print("G ");
            }
            if(splitter[j].equals("B")) {
              map.get(map.size()-1).add(new Candy("blue"));
              System.out.print("B ");
            }
            if(splitter[j].equals("Y")) {
              map.get(map.size()-1).add(new Candy("yellow"));
              System.out.print("Y ");
            }
            if(splitter[j].equals("P")) {
              map.get(map.size()-1).add(new Candy("purple"));
              System.out.print("P ");
            }
            if(splitter[j].equals("O")) {
              map.get(map.size()-1).add(new Candy("Orange"));
              System.out.print("O ");
            }
            if(splitter[j].equals("i")) {
              numBlockers++;
              map.get(map.size()-1).add(new Icing());
              System.out.print("I ");
            }
        }
      }
    }
  }

  int getMaxMoves() {
    return maxMoves;
  }
  
  void decreaseBlockers() {
    numBlockers--;
  }
  
  void load(){
    for(int y = 0; y < ySize; y++){
      for(int x = 0; x < xSize; x++){
        if(map.get(y).get(x) instanceof Element){
        }
      }
    }
  }
  
}
