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
    map = new ArrayList<ArrayList<Object>>();
    String [] lines = loadStrings("level"+level+".txt");
    for(int i = 0; i<lines.length; i++){
      System.out.println();
      map.add(new ArrayList<Object>());
      if(i == 0){
        xSize = Integer.parseInt(lines[0].substring(0,1));
        ySize = Integer.parseInt(lines[0].substring(2,3));
        maxMoves = Integer.parseInt(lines[0].substring(4,5));
      }
      else{
        for(int j = 0; j < xSize; j+=2){
            if(lines[i].substring(j,j+1).equals("E")) {
              map.get(map.size()-1).add(new Integer(0));
              System.out.print(0 + "");
            }
            if(lines[i].substring(j,j+1).equals("R")) {
              map.get(map.size()-1).add(new Candy("red"));
              System.out.print("R ");
            }
            if(lines[i].substring(j,j+1).equals("G")) {
              map.get(map.size()-1).add(new Candy("green"));
              System.out.print("G ");
            }
            if(lines[i].substring(j,j+1).equals("B")) {
              map.get(map.size()-1).add(new Candy("blue"));
              System.out.print("B ");
            }
            if(lines[i].substring(j,j+1).equals("Y")) {
              map.get(map.size()-1).add(new Candy("yellow"));
              System.out.print("Y ");
            }
            if(lines[i].substring(j,j+1).equals("P")) {
              map.get(map.size()-1).add(new Candy("purple"));
              System.out.print("P ");
            }
            if(lines[i].substring(j,j+1).equals("O")) {
              map.get(map.size()-1).add(new Candy("Orange"));
              System.out.print("O ");
            }
            if(lines[i].substring(j,j+1).equals("i")) {
              map.get(map.size()-1).add(new Icing());
              System.out.print("I ");
            }
        }
      }
    }
    //reads the corresponding level file and displays upon construction
    
    //Scanner levelReader = new Scanner(new File(dataPath("level"+level+".txt")));
    //xSize = levelReader.nextInt();
    //ySize = levelReader.nextInt();
    //maxMoves = levelReader.nextInt();
    //while (levelReader.hasNextLine()) {
    //  Scanner line = new Scanner(levelReader.nextLine());
    //  map.add(new ArrayList<Object>());
    //  while (line.hasNext()) {
    //    String obj = line.next();
    //    if (obj.equals("E")) map.get(map.size()-1).add(new Integer(0));
    //    if (obj.equals("R")) map.get(map.size()-1).add(new Candy("red")); 
    //    if (obj.equals("G")) map.get(map.size()-1).add(new Candy("green"));
    //    if (obj.equals("B")) map.get(map.size()-1).add(new Candy("blue"));
    //    if (obj.equals("Y")) map.get(map.size()-1).add(new Candy("yellow"));
    //    if (obj.equals("O")) map.get(map.size()-1).add(new Candy("orange"));
    //    if (obj.equals("P")) map.get(map.size()-1).add(new Candy("purple"));
    //    if (obj.equals("I")) {
    //      map.get(map.size()-1).add(new Icing());
    //      numBlockers++;
    //    }
    //  }//if(obj.equals("J")) map.get(map.size()-1).add(new Jelly());
    //}
    //levelReader.close();
  }

  int getMaxMoves() {
    return maxMoves;
  }
  
  void decreaseBlockers() {
    numBlockers--;
  }
  
}
