public class Button{

  public Button(){
  }
  
  void mouseClicked(String filename){
    PImage loadscreen = loadImage(filename);
    if (filename.equals("levels.jpg")) {
      loadscreen.resize(463,1000);
      image(loadscreen,-20,-200);
    }
    else{
      loadscreen.resize(463,0);
      image(loadscreen,0,0);
    }

  }
  void display(){

  }
}
