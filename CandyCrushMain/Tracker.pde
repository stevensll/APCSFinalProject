public class Tracker{
  int maxMoves;
  int numBlockers;
  
  public Tracker(Level lvl){
    maxMoves = lvl.maxMoves;
    numBlockers = lvl.numBlockers;
  }
  void tick(){
    
  }
  void display(){
    for (int i=0; i<width; i++){
      for (int j=0; j<=100; j++){
        color c = color(247,160,233);
        set(i,j,c);
      }
    }
    fill(0);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Moves Left: "+maxMoves,width/2, 30); //displays number of moves left
    
    fill(0);
    textSize(20);
    text("Blockers Left: "+numBlockers,width/2,65); //displays number of blockers left
  }
}
