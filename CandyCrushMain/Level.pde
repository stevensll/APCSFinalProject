import java.util.ArrayList;
import java.util.*;

public class Level {
  ArrayList<ArrayList<Element>> map;
  int maxMoves, numBlockers;
  int xSize, ySize;
  float xOff, yOff;
  int xSpacing = 50;
  int ySpacing = 55;
  Element firstSelected;
  Tracker score;

  public Level(int level) {
    numBlockers = 0;
    map = new ArrayList<ArrayList<Element>>();
    init(level);
    updateNeighbors();
    display();
  }
  
  void updateNeighbors() {
    for (int i =0; i < ySize; i++) {
      for (int j = 0; j < xSize; j++) {
        if (map.get(i).get(j)!=null) {
          Element ref = map.get(i).get(j);
          if ( i > 0) {
            map.get(i).get(j).uN = map.get(i-1).get(j);
          }
          if (i < ySize-1) {
            map.get(i).get(j).dN = map.get(i+1).get(j);
          }
          if (j > 0) {
            map.get(i).get(j).lN = map.get(i).get(j-1);
          }
          if (j < xSize-1) {
            map.get(i).get(j).rN = map.get(i).get(j+1);
          }
        }
      }
    }
  }
  
  
  void display() {
    // score.display();
    if(maxMoves>0){
      rectMode(CENTER);
      stroke(120);
      fill(120);
      rect(width/2, height/2, this.xSize*(xSpacing*1.05), this.ySize *(ySpacing*1.05), 10, 10, 10, 10);
      //display the candies at their right pixel positions
      for (int y = 0; y < this.ySize; y++) {
        for (int x = 0; x < this.xSize; x++) {
          Element e = map.get(y).get(x);
          if (e!=null) {
            e.xPos = xOff+x*xSpacing;
            e.yPos = yOff+y*ySpacing;
            e.display(e.xPos, e.yPos);
          }
        }
      }


    } else {
      PImage end;
      if (numBlockers > 0){
        end = loadImage("loss.jpg");
      } else {
        end = loadImage("win.jpg");
      }
      end.resize(0,1000);
      image(end,0,0);
    }

  }
  
  void mouseTrack() {  
    //converts the mouse position to a possible list coordinate position
    float x = ((mouseX-xOff+xSpacing/2) / xSpacing);
    float y = ((mouseY-yOff+ySpacing/2) / ySpacing);

    if (x >= 0 && x<xSize && y>=0 && y<ySize) {    
      Element chosen =map.get((int)y).get((int)x);
      //check if clicked is valid
      if (chosen!=null && chosen instanceof Candy) {
        //if there is already a firstSelected: unselect if same candy, if not check if its a neighbor and swap if true
        if (firstSelected!=null) {
          if (chosen.equals(firstSelected)) {
            chosen.clicked();
            firstSelected = null;
            //swapping sequence: core of the program
          } else if (chosen.equals(firstSelected.dN) || chosen.equals(firstSelected.uN) || chosen.equals(firstSelected.rN) || chosen.equals(firstSelected.lN)) {
            chosen.clicked();
            swap(chosen, this.firstSelected);
            firstSelected = null;
            maxMoves--;
          }
          //if not, chosen is the firstSelected
        } else {
          firstSelected = chosen;
          chosen.clicked();
        }
      }
    }
}

void swap(Element chosen, Element firstSelected) {
    int sxPosL = firstSelected.xPosL;
    int syPosL = firstSelected.yPosL;
    //System.out.println( sxPosL + " " + syPosL);
  
    firstSelected.xPosL = chosen.xPosL;
    firstSelected.yPosL = chosen.yPosL;
  
  
    map.get(chosen.yPosL).set(chosen.xPosL, firstSelected);
  
    chosen.xPosL = sxPosL;
    chosen.yPosL = syPosL;
  
    map.get(syPosL).set(sxPosL, chosen);
    updateNeighbors();
}

  void init(int level) {
    String [] lines = loadStrings("level"+level+".txt");
    for (int i = 0; i<lines.length; i++) {
      if (i == 0) {
        String [] splitter = lines[0].split(" ");
        xSize = Integer.parseInt(splitter[0]);
        ySize = Integer.parseInt(splitter[1]);
        maxMoves = Integer.parseInt(splitter[2]);
      } else {
        ArrayList<Element> column = new ArrayList<Element>();
        for (int j = 0; j < xSize; j++) {
          String [] splitter = lines[i].split(" ");
          if (splitter[j].equals("E")) {
            column.add(null);
            System.out.print(" ");
          }
          if (splitter[j].equals("R")) {
            column.add(new Candy("red"));
          }
          if (splitter[j].equals("G")) {
            column.add(new Candy("green"));
          }
          if (splitter[j].equals("B")) {
            column.add(new Candy("blue"));
          }
          if (splitter[j].equals("Y")) {
            column.add(new Candy("yellow"));
          }
          if (splitter[j].equals("P")) {
            column.add(new Candy("purple"));
          }
          if (splitter[j].equals("O")) {
            column.add(new Candy("orange"));
          }
          if (splitter[j].equals("I")) {
            numBlockers++;
            column.add(new Icing());
          }
          if(splitter[j].equals("JB")) {
              numBlockers++;
              column.add(new Jelly());
            }
          if(splitter[j].equals("JR")) {
            numBlockers++;
            column.add(new Jelly());
          }
          if(splitter[j].equals("JO")) {
            numBlockers++;
            column.add(new Jelly());
          }
          if(splitter[j].equals("JP")) {
            numBlockers++;
            column.add(new Jelly());
          }
          if(splitter[j].equals("JG")) {
            numBlockers++;
            column.add(new Jelly());
          }


          //////////////////////////////
  
          //set the list positionings of the candies and init it with its scale
          if (column.get(j) == null) {
            // System.out.print(" ");
          } else {
            //System.out.print(column.get(j).toString() + " ");
            column.get(j).xPosL = j;
            column.get(j).yPosL = i-1;
            column.get(j).init(1);
          }
        }
        map.add(column);
      }
    }
    System.out.println(this);


    //xOff and yOff are offsets to determine how to offset the candy icons in relation to the board
    xOff = width/2 - (this.xSize * xSpacing / 2 - xSpacing/2);
    yOff = height/2 - (this.ySize * ySpacing / 2 - ySpacing/2);


    //display the background;
    PImage background = loadImage("background.png");
    background.resize(0,1000);
    image(background,0,0);


  }

  String toString() {
    String r = "";
    for (ArrayList<Element> column : map) {
      for (Element e : column) {
        if(e!=null)r+= e.toString() + " ";
        else r+=" ";
      }
      r+="\n";
    }
    return r;
  }

}
