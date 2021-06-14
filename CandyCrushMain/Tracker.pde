public class Tracker{
  int maxMoves, numBlockers, points;
  Level parent;
  public Tracker(Level lvl){
    parent = lvl;
  }

  void display(){
    maxMoves = parent.maxMoves;
    numBlockers=parent.numBlockers;
    points = parent.points;
    if (maxMoves!=0){
      color c = color(247,160,233);
      fill(c);
      stroke(c);
      rectMode(CENTER);
      rect(width/2,30,175,60,10,10,10,10);
      fill(0);
      textSize(15);
      textAlign(CENTER,CENTER);
      text("Moves Left: "+maxMoves,width/2, 15); //displays number of moves left
      text("Blockers Left: "+numBlockers,width/2,30); //displays number of blockers left
      text("Points: " +points,width/2,45);
    }
  }
}
