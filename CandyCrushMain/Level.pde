import java.util.ArrayList;
import java.util.*;

public class Level {
  ArrayList<ArrayList<Element>> map;
  ArrayList<ArrayList<Element>> mapref;
  int[][] candyBackground;
  int maxMoves,numBlockers,points;
  int xSize, ySize;
  float xOff, yOff;
  int xSpacing = 50; int ySpacing = 55;
  Element firstSelected;
  Tracker score;
  boolean active; boolean clickable;
  PImage background;
  
  public Level(int level) {
    clickable = true;
    points = 0;
    numBlockers = 0;
    maxMoves = 0;
    score = new Tracker(this);
    map = new ArrayList<ArrayList<Element>>();
    mapref = new ArrayList<ArrayList<Element>>();
    init(level);
    updateNeighbors();
    active = true;
  }

  /*
  updates the map and redisplays it every tick
  heart of the program. every tick has a scheme of the following:
    1a) check if we can drop any candies - this is implied by the fact that the map may still have nulls
    2a) drop the candies
    3a) spawn new candies
    iterate 1a - 3a until we can't drop, then we proceed on the removing
    1b) flag every candy if they form a combo
    2b) remove them
  */
  void display() {
    if (active){
      if(maxMoves>0){
        background(background);
        score.display();
        //display the candies at their right pixel positions
        candyBackground();
        for (int y = 0; y < this.ySize; y++) {
          for (int x = 0; x < this.xSize; x++) {
            Element e = map.get(y).get(x);
            if (e!=null && !(e instanceof Empty)) {
              e.xPos = xOff+x*xSpacing;
              e.yPos = yOff+y*ySpacing;
              e.display(e.xPos, e.yPos);
            }
          }
        }

        if(droppable()){
          drop();
          spawn();
        } else {
          flagElements();
          candyBackground();
          for (int y = 0; y < this.ySize; y++) {
            for (int x = 0; x < this.xSize; x++) {
              Element e = map.get(y).get(x);
              if (e!=null && !(e instanceof Empty)) {
                e.xPos = xOff+x*xSpacing;
                e.yPos = yOff+y*ySpacing;
                e.display(e.xPos, e.yPos);
              }
            }
          }
          remove();
          clickable = true;
        }
      } else {
        PImage end;
        if (numBlockers > 0){
          end = loadImage("loss.jpg");
        } else {
          end = loadImage("win.jpg");
        }
        imageMode(CENTER);
        end.resize(0,1000);
        image(end,width/2,height/2);
        score = null;
        active = false;
      }
    }
  }

    
  //checks if the mouse has clicked on a candy and handle the necessary result
  void mouseTrack() {  
    //converts the mouse position to a possible list coordinate position
    float x = ((mouseX-xOff+xSpacing/2) / xSpacing);
    float y = ((mouseY-yOff+ySpacing/2) / ySpacing);

    if (clickable && active && x >= 0 && x<xSize && y>=0 && y<ySize) {    
      Element chosen =map.get((int)y).get((int)x);
      //check if the mouse has clicked a candy
      if (chosen!=null && chosen instanceof Candy) {
        //If there is a selected: unselect if same candy 
        //If not check if its a neighbor and swap if true
        if (firstSelected!=null) {
          //UNSELECT
          if (chosen.equals(firstSelected)) {
            chosen.clicked();
            firstSelected = null;
          //SWAPPING SEQUENCE
          } else if (chosen.equals(firstSelected.dN) || chosen.equals(firstSelected.uN) || chosen.equals(firstSelected.rN) || chosen.equals(firstSelected.lN)) {
            firstSelected.clicked();
            swap(chosen, this.firstSelected);
            flagElements();
            //if a possible combo can be made from the swap, run the break sequence. if not, swap them back.
            if(removable()){
              firstSelected = null;
              maxMoves--;
            //if no candies can be removed, then we swap back      
            } else{
              swap(firstSelected,chosen);
              firstSelected = null;
            }
          }
        //APPOINT A CANDY TO BE SELECTED
        } else {
          firstSelected = chosen;
          chosen.clicked();
        }
        System.out.println("1st selected " + firstSelected);
        System.out.println(this + ""+maxMoves);
      }
    }
  }

  //flag all elements in the board
  void flagElements(){
    flagCandies();
    flagStripedCandies();
    flagIcings();
  }

  //iterate and flag candies if they make a combo with each other
  void flagCandies(){
    // look at the candies 3 in a row throughout each row
    for(int y = 0; y < ySize; y++){
      for(int x = 0; x < xSize-2; x++){
        Element a = map.get(y).get(x);
        Element b = map.get(y).get(x+1);
        Element c = map.get(y).get(x+2);
        if(a instanceof Candy ){
          if(a.col.equals(b.col) && a.col.equals(c.col)){
            a.remove = true;
            b.remove = true;
            c.remove = true;
          }
        }
      }
    }
    //look at candies in a 3 in a column throughout each column
    for(int y = 0; y < ySize-2; y++){
      for(int x = 0; x < xSize; x++){
        Element a = map.get(y).get(x);
        Element b = map.get(y+1).get(x);
        Element c = map.get(y+2).get(x);
        if(a instanceof Candy){
          if(a.col.equals(b.col) && a.col.equals(c.col)){
            a.remove = true;
            b.remove = true;
            c.remove = true;
          }
        }
      }
    }
  }

  //after candies are flagged, check again to see if striped candies will cause further flagging
  void flagStripedCandies(){
     for(int y = 0; y < ySize; y++){
      for(int x = 0; x < xSize; x++){
        Element ref = map.get(y).get(x);
        if(ref instanceof StripedCandy && ref.remove){
          if(ref.direction.equals("hori")){
            for(int i = 0; i < xSize;i++){
              if(!(map.get(y).get(i) instanceof Empty)) map.get(y).get(i).remove = true;
            }
          }
          else if (ref.direction.equals("vert")){
            for(int i = 0; i < ySize;i++){
              if(!(map.get(i).get(x) instanceof Empty)) map.get(i).get(x).remove = true;
            }
          }
        }
      }
     }
  }

  //after all candies are flagged, check to see if any icings are adjacents to flagged candies
  void flagIcings(){
    for(int y = 0; y < ySize; y++){
      for(int x = 0; x < xSize; x++){
        Element a = map.get(y).get(x);
        if(a instanceof Icing){
          if (a.lN!=null && a.lN.remove && a.lN instanceof Candy 
          || a.rN!=null && a.rN.remove && a.rN instanceof Candy 
          || a.uN!=null && a.uN.remove && a.uN instanceof Candy
          || a.dN!=null &&a.dN.remove && a.dN instanceof Candy){
            if(!a.remove){
              a.remove = true;
            }
          }           
        }
      }
    }
  }

  //checks if there are any flags and if the board needs to remove candies
  boolean removable(){
    int count = 0;
    for(int y = 0; y < ySize; y++){
      for(int x = 0; x<xSize; x++){
        if(map.get(y).get(x).remove){
          count++;
        }
      }
    }
    return count > 2;
  }
  
  //removes every flagged candy in the board. adds the necessary points and decreases the numBlockers
  //60 per candy, 120 per striped, 100 per icing
  boolean remove(){
    clickable = false;
    int count = 0;
    for(int y = 0; y < ySize; y++){
      for(int x = 0; x<xSize; x++){
        if(map.get(y).get(x)!=null && map.get(y).get(x).remove){
          count++;
          if(map.get(y).get(x) instanceof Icing){
            numBlockers--;
            points+=100;
          }
          if(map.get(y).get(x)instanceof StripedCandy){
            points+=120;
          }
          else {
            points+=60;
          }
          map.get(y).set(x, null);
        }
      }
    }
    updateNeighbors();
    return count > 2;
  }

  //checks if any candies need to be dropped//moved
  boolean droppable(){
    for(int i = 0; i < ySize; i++){
      for(int j = 0; j< xSize; j++){
        if(map.get(i).get(j)==null) return true;
      }
    }
    return false;
  }

  //Gravity function for candies
  void drop(){
    clickable = false;
    for(int i=ySize-2; i>=0; i--){
      for(int j = 0; j < xSize; j++){
        Element ref = map.get(i).get(j);
        if(ref!=null && ref instanceof Candy){
          //If down neighbor is empty, drop down
          if(ref.dN == null){
            map.get(i+1).set(j,ref);
            map.get(i).set(j,null);
            ref.xPosL = j;
            ref.yPosL+=1;
          //Slide to the right or left if down neighbor exists, but the current left or right neighbors are a blocker/empty )
          //this allows us to fill up diagonals squares when the board isn't rectangular
          } 
          else if (j!=xSize-1 && ref.rN != null && ref.rN instanceof Blocker&& ref.dN.rN == null){
              map.get(i+1).set(j+1,ref);
              map.get(i).set(j,null);
              ref.xPosL+=1;
              ref.yPosL+=1;
          } 
          else if(j!=0 && ref.lN != null &&  ref.lN instanceof Blocker && ref.dN.lN==null){
            map.get(i+1).set(j-1,ref);
            map.get(i).set(j,null);
            ref.xPosL-=1;
            ref.yPosL+=1;
          } 
          else if(ref.uN !=null && ref.uN instanceof Blocker && ref.dN instanceof Blocker){
            if(j!=xSize-1&&ref.rN == null){
              map.get(i).set(j+1, ref);
              map.get(i).set(j,null);
              ref.xPosL+=1;
            } 
            else if (j!=0&&ref.lN == null){
              map.get(i).set(j-1, ref);
              map.get(i).set(j,null);
              ref.xPosL-=1;
            }
            updateNeighbors();
          }
          updateNeighbors();
        }
      }
    }
  }
  
  //spawn candies at the first row randomly
  void spawn(){
    for(int i=0; i<1; i++){
      for(int j = 0; j < xSize; j++){
        Element ref = map.get(i).get(j);
        if(ref==null){
          String col = "";
          double n  = Math.random() * 6;
          double s = Math.random() * 6;
          double d = Math.random()*2;
          if(n >= 0){col =  "orange";}
          if(n >= 1){col = "purple";}
          if(n >= 2){col = "red";}
          if(n >= 3){col = "blue";}
          if(n >= 4){col = "green";}
          // if(n >= 5){col = "yellow";}
          if(s <= 1){
            if(d <=1){
              map.get(i).set(j, new StripedCandy(col,"vert"));
            } else map.get(i).set(j, new StripedCandy(col,"hori"));
          }
          else map.get(i).set(j, new Candy(col));
          map.get(i).get(j).init(1);
          map.get(i).get(j).xPosL = j;
          map.get(i).get(j).yPosL = i;
        }
      }
    }
    updateNeighbors();
  }

  //swaps the selected candy and the one that was clicked on
  void swap(Element chosen, Element selected) {
    int sxPosL = selected.xPosL;
    int syPosL = selected.yPosL;
    //System.out.println( sxPosL + " " + syPosL);
  
    selected.xPosL = chosen.xPosL;
    selected.yPosL = chosen.yPosL;
  
  
    map.get(chosen.yPosL).set(chosen.xPosL, selected);
  
    chosen.xPosL = sxPosL;
    chosen.yPosL = syPosL;
  
    map.get(syPosL).set(sxPosL, chosen);
    System.out.println("1st selected" + firstSelected);

    updateNeighbors();
  }

  //update the neighbors of each candy appropriately. this should occur any time candies are removed or swapped.
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

  //creates the grey outline background for the candies
  void candyBackground(){
    rectMode(CENTER);
    stroke(120);
    fill(120);
    for (int y = 0; y < this.ySize; y++) {
      for (int x = 0; x < this.xSize; x++) {
        if (candyBackground[y][x]==1) {
          float rectx = xOff+x*xSpacing;
          float recty = yOff+y*ySpacing;
          rect(rectx, recty, (xSpacing*1.1), (ySpacing*1.1), 5, 5, 5, 5);
        }
      }
    }
  }

  //parse the appropriate level text file, create new candies and add it to the map. also sets up the background and display offsets.
  void init(int level) {
    String [] lines = loadStrings("level"+level+".txt");
    for (int i = 0; i<lines.length; i++) {
      if (i == 0) {
        String [] splitter = lines[0].split(" ");
        xSize = Integer.parseInt(splitter[0]);
        ySize = Integer.parseInt(splitter[1]);
        maxMoves = Integer.parseInt(splitter[2]);
        candyBackground = new int[ySize][xSize];
      } else {
        ArrayList<Element> column = new ArrayList<Element>();
        for (int j = 0; j < xSize; j++) {
          String [] splitter = lines[i].split(" ");
          //////////////////////////////ADD THE CORRESPONDING ELEMENT//////////////////////////////
          candyBackground[i-1][j] = 1;
          if (splitter[j].equals("E")) {
            column.add(new Empty());
            candyBackground[i-1][j] = 0;
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
              column.add(new Jelly("blue"));
            }
          if(splitter[j].equals("JR")) {
            numBlockers++;
            column.add(new Jelly("red"));
          }
          if(splitter[j].equals("JO")) {
            numBlockers++;
            column.add(new Jelly("orange"));
          }
          if(splitter[j].equals("JP")) {
            numBlockers++;
            column.add(new Jelly("purple"));
          }
          if(splitter[j].equals("JG")) {
            numBlockers++;
            column.add(new Jelly("green"));
          }
          
          if (splitter[j].equals("RH")) {
            column.add(new StripedCandy("red","hori"));
          }
          if (splitter[j].equals("RV")) {
            column.add(new StripedCandy("red","vert"));
          }
          if (splitter[j].equals("BH")) {
            column.add(new StripedCandy("blue","hori"));
          }
          if (splitter[j].equals("BV")) {
            column.add(new StripedCandy("blue","vert"));
          }
          if (splitter[j].equals("GH")) {
            column.add(new StripedCandy("green","hori"));
          }
          if (splitter[j].equals("GV")) {
            column.add(new StripedCandy("green","vert"));
          }
          if (splitter[j].equals("OH")) {
            column.add(new StripedCandy("orange","hori"));
          }
          if (splitter[j].equals("OV")) {
            column.add(new StripedCandy("orange","vert"));
          }
          if (splitter[j].equals("PH")) {
            column.add(new StripedCandy("purple","hori"));
          }
          if (splitter[j].equals("PV")) {
            column.add(new StripedCandy("purple","vert"));
          }
          if (splitter[j].equals("YH")) {
            column.add(new StripedCandy("yellow","hori"));
          }
          if (splitter[j].equals("YV")) {
            column.add(new StripedCandy("yellow","vert"));
          }
          //////////////////////////////////////////////////////////////////////////////////////////
  
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
        mapref.add(column);
      }
    }
    //xOff and yOff are offsets to determine how to offset the candy icons in relation to the board
    xOff = width/2 - (this.xSize * xSpacing / 2 - xSpacing/2);
    yOff = height/2 - (this.ySize * ySpacing / 2 - ySpacing/2);
    //display the background;
    background = loadImage("background.png");
    background.resize(width,height);
    image(background,0,0);


    System.out.println(this);
  }

  //prints out the map
  String toString() {
    String r = "";
    for (ArrayList<Element> column : map) {
      for (Element e : column) {
        if(e!=null)r+= e.toString() + " ";
        else r+="  ";
      }
      r+="\n";
    }
    return r;
  }

}
