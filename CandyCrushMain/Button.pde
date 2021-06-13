public class Button{
  int leftx; int rightx;
  int topy; int bottomy;
  
  public Button(int left, int right, int top, int bottom){
    leftx = left;
    rightx = right;
    topy = top;
    bottomy = bottom;
  }
  
  void mouseClicked(String screen){ 
    if (mouseX>=leftx && mouseX<=rightx && mouseY>=topy && mouseY<=bottomy){
      //mouseClicked(filename, loadonx, loadony);
      currentscreen=screen;
     // if (screen.equals())
    }
    
  }
  void display(String filename, int loadonx, int loadony){ 
    //System.out.println(mouseX + " " + mouseY);
    PImage loadscreen = loadImage(filename);
    imageMode(CORNER);
    if (filename.equals("levels.jpg")) {
      loadscreen.resize(463,1000);
    }
    else{
      loadscreen.resize(463,0);
    }
    image(loadscreen,loadonx,loadony);
  }

  void display(Level l, int n) { //displaying levels
    //System.out.println(mouseX + " " + mouseY);
    //rect(leftx, topy, rightx-leftx, bottomy-topy);
    clear();
    l = new Level(n);
    l.display(width/2, height/2);
    currentscreen = "gameplay";
}
