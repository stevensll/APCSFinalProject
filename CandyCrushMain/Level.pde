import java.util.ArrayList;
import java.util.*;

public class Level {
  ArrayList<ArrayList<Element>> map;
  int maxMoves;
  int numBlockers;
  int xSize;
  int ySize;

  public Level(int level){
    numBlockers = 0;
    map = new ArrayList<ArrayList<Element>>();
    String [] lines = loadStrings("level"+level+".txt");
    for(int i = 0; i<lines.length; i++){
      System.out.println();
      if(i == 0){
        String [] splitter = lines[0].split(" ");
        xSize = Integer.parseInt(splitter[0]);
        ySize = Integer.parseInt(splitter[1]);
        maxMoves = Integer.parseInt(splitter[2]);
      }
      else{
        ArrayList<Element> column = new ArrayList<Element>();
        for(int j = 0; j < xSize; j++){
            String [] splitter = lines[i].split(" ");
            if(splitter[j].equals("E")) {
              column.add(new Icing());
              //System.out.print(0 + "");
            }
            if(splitter[j].equals("R")) {
              column.add(new Candy("red"));
              //System.out.print("R ");
            }
            if(splitter[j].equals("G")) {
              column.add(new Candy("green"));
              //System.out.print("G ");
            }
            if(splitter[j].equals("B")) {
              column.add(new Candy("blue"));
              //System.out.print("B ");
            }
            if(splitter[j].equals("Y")) {
              column.add(new Candy("yellow"));
              //System.out.print("Y ");
            }
            if(splitter[j].equals("P")) {
              column.add(new Candy("purple"));
              //System.out.print("P ");
            }
            if(splitter[j].equals("O")) {
              column.add(new Candy("orange"));
              //System.out.print("O ");
            }
            if(splitter[j].equals("I")) {
              numBlockers++;
              column.add(new Icing());
              //System.out.print("I ");
            }
        }
        map.add(column);

      }
    }
  }

  int getMaxMoves() {
    return maxMoves;
  }
  
  void decreaseBlockers() {
    numBlockers--;
  }
  
  void init(){
    for(ArrayList<Element> column : map){
      for(Element e: column){
        e.init();
      }
    }
  }
  
  void display(){
    for(int y = 0; y < this.ySize-1; y++){
      for(int x = 0; x < this.xSize-1; x++){
        map.get(y).get(x).display(x*50, y*50);
      }
    }
  }
  
}
