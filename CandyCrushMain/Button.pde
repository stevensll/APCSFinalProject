public class Button{
  int leftx; int rightx;
  int topy; int bottomy;
  public Button(int left, int right, int top, int bottom){
    leftx = left;
    rightx = right;
    topy = top;
    bottomy = bottom;
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
  void display(String filename, int loadonx, int loadony){ //checks coordinates and displays
    if (mouseX>=leftx && mouseX<=rightx && mouseY>=topy && mouseY<=bottomy){
    PImage load = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("backIcon.png")) load.resize(60,60);
    image(load,loadonx,loadony);
    }
  }
}
