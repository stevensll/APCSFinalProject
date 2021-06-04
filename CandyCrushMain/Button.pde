public class Button{

  public Button(){
  }
  
  void mouseClicked(String filename, int x, int y){
    PImage loadscreen = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("levels.jpg")) {
      loadscreen.resize(463,1000);
      image(loadscreen,x,y);
    }
    else{
      loadscreen.resize(463,0);
      image(loadscreen,x,y);
    }

  }
  void display(){

  }
}
