public class Tracker{
  int maxMoves;
  int numBlockers;
  
  public Tracker(Level lvl){
    maxMoves = lvl.maxMoves;
    numBlockers = lvl.numBlockers;
  }

  void display(){
    
    for (int i=100; i<width-100; i++){
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
