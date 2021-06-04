import java.util.ArrayList;
import java.util.*;

public class Level {
  ArrayList<ArrayList<Element>> map;
  int maxMoves, numBlockers;
  int xSize, ySize;
  int screenW, screenL;
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
    score = new Tracker(this);
     PImage background = loadImage("background.png");
     background.resize(0,1000);
     image(background,0,0);
  }
  
  void updateNeighbors() {
    for (int i =0; i < ySize; i++) {
      for (int j = 0; j < xSize; j++) {
        if (map.get(i).get(j)!=null) {
          Element ref = map.get(i).get(j);
          for(int z=0; z<4;z++){
            ref.chains[z] = 0;
          }
          if ( i > 0) {
            map.get(i).get(j).uN = map.get(i-1).get(j);
            if(ref.uN!=null && ref.uN.c.equals(ref.c)){
              ref.updateChains("up",1);
            }
          }
          if (i < ySize-1) {
            map.get(i).get(j).dN = map.get(i+1).get(j);
            if(ref.dN!=null && ref.dN.c.equals(ref.c)){
              ref.updateChains("down",1);
            } 
          }
          if (j > 0) {
            map.get(i).get(j).lN = map.get(i).get(j-1);
            if(ref.lN!=null && ref.lN.c.equals(ref.c)){
              ref.updateChains("left",1);
            }
          }
          if (j < xSize-1) {
            map.get(i).get(j).rN = map.get(i).get(j+1);
            if(ref.rN!=null && ref.rN.c.equals(ref.c)){
              ref.updateChains("right",1);
            }
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
  
  void display(int w, int l) {
    score.display();
    if(maxMoves>0 || numBlockers>0){
      xOff = w - (this.xSize * xSpacing / 2 - xSpacing/2);
      yOff = l - (this.ySize * ySpacing / 2 - ySpacing/2);
      screenW = w;
      screenL = l;
      /////draw the rectangular box around the candies
      rectMode(CENTER);
      stroke(120);
      fill(120);
      rect(w, l, this.xSize*(xSpacing*1.05), this.ySize *(ySpacing*1.05), 10, 10, 10, 10);
    
      //offsets for centering the board
    
    
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
      updateNeighbors();
      spawnCandy();
      updateNeighbors();
      pushDown();
    }
  }
  
  void mouseTrack() {
  
    //System.out.println(mouseX  + " " + mouseY);
    //converts the mouse position to a possible list coordinate position
    float x = ((mouseX-xOff+xSpacing/2) / xSpacing);
    float y = ((mouseY-yOff+ySpacing/2) / ySpacing);
  
    //System.out.println((mouseX-xOff+xSpacing/2) + " " + (mouseY-yOff+ySpacing/2));
    if (x >= 0 && x<xSize && y>=0 && y<ySize) {    
      Element chosen =map.get((int)y).get((int)x);
      //check if clicked is valid
      if (chosen!=null && chosen instanceof Candy) {
  
        //if there is already a firstSelected: unselect if same candy, if not check if its a neighbor and swap if true
        if (firstSelected!=null) {
          System.out.println(Arrays.toString(firstSelected.chains));
          if (chosen.equals(firstSelected)) {
            chosen.clicked();
            firstSelected = null;
  
            //swapping sequence: core of the program
          } else if (chosen.equals(firstSelected.dN) || chosen.equals(firstSelected.uN) || chosen.equals(firstSelected.rN) || chosen.equals(firstSelected.lN)) {
            chosen.clicked();
            swap(chosen, this.firstSelected);
            updateNeighbors();
            if(chosen.chains[0] <= 0 && chosen.chains[1] <= 0 && chosen.chains[2] <= 0 && chosen.chains[3] <= 0){
              swap(this.firstSelected, chosen);
              chosen.clicked();
              firstSelected.clicked();
            } else {
              updateNeighbors();
            }
            updateCandies();
            //System.out.println(chosen);
            firstSelected = null;
            updateNeighbors();
            score.maxMoves--;
            maxMoves--;
          }
  
          //if not, chosen is the firstSelected
        } else {
          firstSelected = chosen;
          chosen.clicked();
        }
  
        //debug
        if (firstSelected!=null) {
          System.out.println("firstSelected: " + firstSelected + " " + firstSelected.xPosL + " " + firstSelected.yPosL );
        } else System.out.println(firstSelected);
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
    //System.out.println(this);
    firstSelected.clicked();
    chosen.clicked();
  }
  void spawnCandy(){
     for(int i=0; i<1; i++){
      for(int j = 0; j < xSize; j++){
        Element ref = map.get(i).get(j);
        if(ref==null){
          double n  = Math.random() * 6;
          if(n >= 0){
            map.get(i).set(j, new Candy("orange"));
          }
          if(n >= 1){
            map.get(i).set(j, new Candy("purple"));
          }
          if(n >= 2){
            map.get(i).set(j, new Candy("yellow"));
          }
          if(n >= 3){
            map.get(i).set(j, new Candy("red"));
          }
          if(n >= 4){
            map.get(i).set(j, new Candy("blue"));
          }
          if(n >= 5){
            map.get(i).set(j, new Candy("green"));
          }
          map.get(i).get(j).init(1);
          map.get(i).get(j).xPosL = j;
          map.get(i).get(j).yPosL = i;
        }
      }
    }
  }
  void pushDown(){
    for(int i=ySize-2; i>=0; i--){
      for(int j = 0; j < xSize; j++){
        Element ref = map.get(i).get(j);
        if(ref!=null && ref.dN == null){
          map.get(i+1).set(j,ref);
          map.get(i).set(j,null);
          ref.xPosL = j;
          ref.yPosL+=1;
          updateNeighbors();
        }
      }
    }
  }
  void updateCandies(){
    for(int i=ySize-1; i>=0; i--){
      for(int j = 0; j < xSize; j++){
        Element ref = map.get(i).get(j);
        removeElements(ref,-1);
        updateNeighbors();
      }
    }
  }
  void removeElements(Element input,int dir) {
    if(dir == 0 && (input.uN==null || !input.uN.c.equals(input.c))){
        map.get(input.yPosL).set(input.xPosL,null);
      }
    if(dir == 1 && (input.dN==null || !input.dN.c.equals(input.c))){
        map.get(input.yPosL).set(input.xPosL,null);
      }
    if(dir == 2 && (input.lN==null || !input.lN.c.equals(input.c))){
        map.get(input.yPosL).set(input.xPosL,null);
      }
    if(dir == 3 && (input.rN==null || !input.rN.c.equals(input.c))){
        map.get(input.yPosL).set(input.xPosL,null);
      }
    else {
      if( input!=null && input.chains[0] >=1 && input.chains[1] >=1){
        removeElements(input.uN,0);
        removeElements(input.dN,1);
        map.get(input.yPosL).set(input.xPosL,null);
      }
      if( input!=null && input.chains[2] >=1 && input.chains[3] >=1){
        removeElements(input.lN,2);
        removeElements(input.rN,3);
        map.get(input.yPosL).set(input.xPosL,null);
      }
      
    }
    
  }
  
  
  
  void init(int level) {
    String [] lines = loadStrings("level"+level+".txt");
    for (int i = 0; i<lines.length; i++) {
      System.out.println();
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
            System.out.print(" ");
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
