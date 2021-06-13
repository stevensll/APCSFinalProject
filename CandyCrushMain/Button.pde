public class Button{
  int leftx; int rightx;
  int topy; int bottomy;
  
  public Button(int left, int right, int top, int bottom){
    leftx = left;
    rightx = right;
    topy = top;
    bottomy = bottom;
  }
  
  void mouseClicked(String filename, int x, int y){ //displays image and resizes
    PImage loadscreen = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("levels.jpg")) {
      loadscreen.resize(463,1000);
    }
    else if (filename.equals("backIcon.png")) loadscreen.resize(60,60);
    else{
      loadscreen.resize(463,0);
    }
    image(loadscreen,x,y);
  }
  void display(String filename, int loadonx, int loadony){ //checks coordinates and calls mouseClicked
    //rect(leftx,topy,rightx-leftx,bottomy-topy);
    if (mouseX>=leftx && mouseX<=rightx && mouseY>=topy && mouseY<=bottomy){
      mouseClicked(filename, loadonx, loadony);
    }
  }
  void mouseClicked(Level l, int n){
    clear();
    l = new Level(n);
    l.display(width/2, height/2);
  }
  void display(Level l, int n) { //displaying levels
    rect(leftx,topy,rightx-leftx,bottomy-topy);
    if (mouseX>=leftx && mouseX<=rightx && mouseY>=topy && mouseY<=bottomy){
      rect(mouseX,mouseY,10,10);
      mouseClicked(l, n); }
  }
}
