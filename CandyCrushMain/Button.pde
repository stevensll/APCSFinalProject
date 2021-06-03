public class Button{

  public Button(){
  }
  
  void mouseClicked(String filename){
    PImage levelm = loadImage(filename);
    levelm.resize(463,1000);
    image(levelm, 0,0);

  }
  void display(){

  }
}
