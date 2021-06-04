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
    init(level);
    setNeighbors();
  }
void setNeighbors(){
  for(int i =0; i < ySize; i++){
    for(int j = 0 ; j < xSize; j++){
     if(map.get(i).get(j)!=null){
       if( i > 0){
       map.get(i).get(j).uN = map.get(i-1).get(j); 
       }
       if(i < ySize-1){
         map.get(i).get(j).dN = map.get(i+1).get(j); 
       }
       if(j > 0){
         map.get(i).get(j).lN = map.get(i).get(j-1);
       }
       if(j < xSize-1){
         map.get(i).get(j).rN = map.get(i).get(j+1);
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
  
  void display(int w, int l){
    int xSpacing = 50;
    int ySpacing = 55;
    
    /////draw the rectangular box around the candies
    rectMode(CENTER);
    stroke(120);
    fill(120);
    rect(w,l,this.xSize*(xSpacing*1.05), this.ySize *(ySpacing*1.05), 10,10,10,10);
    
    //offsets for centering the board
    float xOff = w - (this.xSize * xSpacing / 2 - xSpacing/2);
    float yOff = l - (this.ySize * ySpacing / 2 - ySpacing/2);
    
    //display the candies at their right pixel positions
    for(int y = 0; y < this.ySize; y++){
      for(int x = 0; x < this.xSize; x++){
        Element e = map.get(y).get(x);
        if(e!=null){
            e.xPos = xOff+x*xSpacing;
            e.yPos = yOff+y*ySpacing;
            e.display(e.xPos, e.yPos);
        }
      }
    }
    mouseTrack(xOff, yOff, xSpacing,ySpacing);
  }
  
  void mouseTrack(float xOff, float yOff, int xSpacing, int ySpacing){
    if(mousePressed){

      //System.out.println(mouseX  + " " + mouseY);
      //converts the mouse position to a possible list coordinate position
      float x = ((mouseX-xOff+xSpacing/2) / xSpacing);
      float y = ((mouseY-yOff+ySpacing/2) / ySpacing);
      
      //System.out.println((mouseX-xOff+xSpacing/2) + " " + (mouseY-yOff+ySpacing/2));
      
      if(x >= 0 && x<xSize && y>=0 && y<ySize){
        if(map.get((int)y).get((int)x)!=null && map.get((int)y).get((int)x) instanceof Candy);
           map.get((int)y).get((int)x).mouseClicked();
      }
    }
  }
  
  void init(int level){
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
            }
            if(splitter[j].equals("G")) {
              column.add(new Candy("green"));
            }
            if(splitter[j].equals("B")) {
              column.add(new Candy("blue"));
            }
            if(splitter[j].equals("Y")) {
              column.add(new Candy("yellow"));
            }
            if(splitter[j].equals("P")) {
              column.add(new Candy("purple"));
            }
            if(splitter[j].equals("O")) {
              column.add(new Candy("orange"));
            }
            if(splitter[j].equals("I")) {
              numBlockers++;
              column.add(new Icing());
            }
            //////////////////////////////
            
            //set the list positionings of the candies and init it with its scale
            if(column.get(j) == null){
              System.out.print(" ");
            } else {
              System.out.print(column.get(j).toString() + " ");
              column.get(j).xPosL = j;
              column.get(j).yPosL = i;
              column.get(j).init(1);
            }
        }
        map.add(column);
      }
    }
  }
}
