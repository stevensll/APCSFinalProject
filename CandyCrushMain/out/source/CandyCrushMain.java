import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.ArrayList; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CandyCrushMain extends PApplet {


Level l1;
Level l2;

String currentscreen;

public void setup(){

    
    l1 = new Level(1);
   

}

public void draw(){
    l1.display();
}
abstract class Blocker extends Element{
  public Blocker(String file){
    super(file);
  }
  
}
public class Button{

  public Button(){
  }
  
  public void mouseClicked(String filename, int x, int y){
    PImage loadscreen = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("levels.jpg")) {
      loadscreen.resize(463,1000);
      image(loadscreen,x,y);
    }
    else{
      loadscreen.resize(100,0);
      image(loadscreen,x,y);
    }

  }
  public void display(String filename, int x, int y){ //just displays
    PImage load = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("backIcon.png")) load.resize(60,60);
    image(load,x,y);
  }
}
public class Candy extends Element{
  PImage clickedIcon;
  boolean isClicked;
  // neighbors
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
    clickedIcon = loadImage(c+"clicked.png"); 
    clickedIcon.resize(0, (int)(55*scale));
  }
  public @Override
  void clicked(){
    if(!isClicked){
      isClicked = true;
    }
    else {
      isClicked = false;
    }
    //System.out.println(xPos + " " + yPos + " clicked");

  }
  
  public void display(float x, float y){
    if(!isClicked){
       super.display(x,y);
    } else {
       image(clickedIcon,x,y);
    }
  }
  
  public String toString(){
    return c.substring(0,1);
  }
}
abstract class Element{
  PImage icon;
  String imagePath;
  String c;
  Element lN, rN, uN, dN;
  int[] chains = new int[]{0,0,0,0};
  float scale;
  
  //coordinates based on pixel positioning;
  float xPos, yPos;
  //coordinates based on list positioning;
  int xPosL, yPosL;

  public Element(String file){
    c = "";
    scale = 1;
    imagePath = file;
  }
  public void updateChains(String input, int value){
    if(input.equals("up")){  
      chains[0]+=value;
    }
    if(input.equals("down")){  
      chains[1]+=value;
    }
    if(input.equals("left")){  
      chains[2]+=value;
    }
    if(input.equals("right")){  
      chains[3]+=value;
    }
  }
  public void init(float factor){
    scale = factor;
    icon = loadImage(imagePath);
    icon.resize(0,PApplet.parseInt(55 * factor));
  }
  
  public void display(float x, float y){
    imageMode(CENTER);
    image(icon,x,y);
  }
  public void clicked(){}
  
  public abstract String toString();

  public void neighborTest(){
    if(lN!=null) System.out.println("l" + lN.getClass().getName());
    if(rN!=null)System.out.println("r" + rN.getClass().getName());
    if(uN!=null)System.out.println("up" + uN.getClass().getName());
    if(dN!=null)System.out.println("down"+ dN.getClass().getName());
  }
}
public class Icing extends Blocker{
  public Icing(){
    super("Icing.png");
  }
  public String toString(){
    return "I";
  }
}
public class Jelly extends Blocker{
  public Jelly(){
    super("jelly.png");
  }
  public String toString(){
    return "J";
  }
}



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
    //load the colorful background


    numBlockers = 0;

    map = new ArrayList<ArrayList<Element>>();
    
    init(level);

  }
  
  public void updateNeighbors() {
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
  
  
  public void display() {
    // score.display();
    if(maxMoves>0){
       rectMode(CENTER);
    stroke(120);
    fill(120);
    rect(width/2, height/2, this.xSize*(xSpacing*1.05f), this.ySize *(ySpacing*1.05f), 10, 10, 10, 10);
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
    }
  }
  
  public void mouseTrack() {
  
    //System.out.println(mouseX  + " " + mouseY);
    //converts the mouse position to a possible list coordinate position
    float x = ((mouseX-xOff+xSpacing/2) / xSpacing);
    float y = ((mouseY-yOff+ySpacing/2) / ySpacing);
  
    //System.out.println((mouseX-xOff+xSpacing/2) + " " + (mouseY-yOff+ySpacing/2));
    if (x >= 0 && x<xSize && y>=0 && y<ySize) {    
      Element chosen =map.get((int)y).get((int)x);
      //check if clicked is valid
      if (chosen!=null && chosen instanceof Candy) {

      }
    }
  }


  
  public void init(int level) {
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


    /////draw the grey box around the candies    score = new Tracker(this);
    PImage background = loadImage("background.png");
    background.resize(0,1000);
    image(background,0,0);
   

  }

  public String toString() {
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
public class MainMenu{
  
}
abstract class Popup{
  public Popup(){
  
  }
}
public class StripedCandy extends Candy{
  public StripedCandy(String c){
    super("striped"+c);
  }
}
public class Tracker{
  int maxMoves;
  int numBlockers;
  
  public Tracker(Level lvl){
    maxMoves = lvl.maxMoves;
    numBlockers = lvl.numBlockers;
  }

  public void display(){
    
    for (int i=100; i<width-100; i++){
      for (int j=0; j<=100; j++){
        int c = color(247,160,233);
        set(i,j,c);
      }
    }
    fill(0);
    textSize(15);
    textAlign(CENTER,CENTER);
    text("Moves Left: "+maxMoves,width/2, 30); //displays number of moves left
    
    fill(0);
    textSize(15);
    text("Blockers Left: "+numBlockers,width/2,65); //displays number of blockers left
    
    if (maxMoves==0){
      if (numBlockers==0){ //display win
        PImage win = loadImage("win.jpg");
        imageMode(CORNER);
        win.resize(463,0);
        image(win,-15,-100);
        
        //int backToLevels = millis() + 1000;
        //if (millis()>=backToLevels){
        //  Button back = new Button();
        //  back.display("levels.jpg",0,0);
        //}
      } 
      else{ //display loss
        PImage loss = loadImage("loss.jpg");
        imageMode(CORNER);
        loss.resize(463,0);
        image(loss,-15,-100);
      }
    }
  }
}
  public void settings() {  size(463,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CandyCrushMain" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
