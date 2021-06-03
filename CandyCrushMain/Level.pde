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
              column.add(null);
              System.out.print(" ");
            }
            if(splitter[j].equals("R")) {
              column.add(new Candy("red"));
              System.out.print("R ");
            }
            if(splitter[j].equals("G")) {
              column.add(new Candy("green"));
              System.out.print("G ");
            }
            if(splitter[j].equals("B")) {
              column.add(new Candy("blue"));
              System.out.print("B ");
            }
            if(splitter[j].equals("Y")) {
              column.add(new Candy("yellow"));
              System.out.print("Y ");
            }
            if(splitter[j].equals("P")) {
              column.add(new Candy("purple"));
              System.out.print("P ");
            }
            if(splitter[j].equals("O")) {
              column.add(new Candy("orange"));
              System.out.print("O ");
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
        if(e!=null){
           e.init();
        }
      }
    }
  }
  
  void display(int w, int l){
    int xSpacing = 50;
    int ySpacing = 60;
    rectMode(CENTER);
    stroke(120);
    fill(120);
    rect(w,l,this.xSize*(xSpacing*1.05), this.ySize *(ySpacing*1.05), 10,10,10,10);
    //offsets for centering the board
    int xOff = w - (this.xSize * xSpacing / 2 - xSpacing/2);
    int yOff = l - (this.ySize * ySpacing / 2 - ySpacing/2);
    for(int y = 0; y < this.ySize; y++){
      for(int x = 0; x < this.xSize; x++){
        Element e = map.get(y).get(x);
        if(e!=null){
            e.display(xOff+x*50, yOff+y*50,1);
        }
      }
    }
  }
  
}
