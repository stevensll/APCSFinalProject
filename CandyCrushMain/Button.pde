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
  void display(String filename, int x, int y){ //just displays
    PImage load = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("backIcon.png")) load.resize(60,60);
    image(load,x,y);
  }
}
