public class Tracker{
  int maxMoves;
  int numBlockers;
  Level parent;
  public Tracker(Level lvl){
    parent = lvl;
  }

  void display(){
    maxMoves = parent.maxMoves;
    numBlockers=parent.numBlockers;
    if (maxMoves!=0){
      color c = color(247,160,233);
      fill(c);
      stroke(c);
      rectMode(CENTER);
      rect(width/2,25,200,50,10,10,10,10);
      fill(0);
      textSize(15);
      textAlign(CENTER,CENTER);
      text("Moves Left: "+maxMoves,width/2, 20); //displays number of moves left
      fill(0);
      textSize(15);
      text("Blockers Left: "+numBlockers,width/2,35); //displays number of blockers left
    }
  }
}
