import java.util.ArrayList;
import java.util.Scanner;
import java.io.*;


public class Level {
  private ArrayList<ArrayList<Object>> map;
  private int maxMoves;
  private int numBlockers;
  private int xSize;
  private int ySize;

  public Level(int level) throws FileNotFoundException{
    map = new ArrayList<ArrayList<Object>>();
    //reads the corresponding level file and displays upon construction
    Scanner levelReader = new Scanner(new File(dataPath("level"+level+".txt")));
    xSize = levelReader.nextInt();
    ySize = levelReader.nextInt();
    maxMoves = levelReader.nextInt();
    while (levelReader.hasNextLine()) {
      Scanner line = new Scanner(levelReader.nextLine());
      map.add(new ArrayList<Object>());
      while (line.hasNext()) {
        String obj = line.next();
        if (obj.equals("0")) map.get(map.size()-1).add(new Integer(0));
        if (obj.equals("R")) map.get(map.size()-1).add(new Candy("red")); 
        if (obj.equals("G")) map.get(map.size()-1).add(new Candy("green"));
        if (obj.equals("B")) map.get(map.size()-1).add(new Candy("blue"));
        if (obj.equals("Y")) map.get(map.size()-1).add(new Candy("yellow"));
        if (obj.equals("O")) map.get(map.size()-1).add(new Candy("orange"));
        if (obj.equals("P")) map.get(map.size()-1).add(new Candy("purple"));
        if (obj.equals("I")) {
          map.get(map.size()-1).add(new Icing());
          numBlockers++;
        }
      }//if(obj.equals("J")) map.get(map.size()-1).add(new Jelly());
    }
  }

  int getMaxMoves() {
    return maxMoves;
  }
  
  void decreaseBlockers() {
    numBlockers--;
  }
}
