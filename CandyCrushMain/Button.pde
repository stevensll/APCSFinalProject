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
      if (screen.equals("backmenu")) {
        menuShowing=!menuShowing;
      }
      else{
        if (screen.equals("levels")) menuShowing=false;
        currentscreen=screen;
        if (screen.equals("gameplay1")) l1 = new Level(1);
        if (screen.equals("gameplay2")) l2 = new Level(2);
        if (screen.equals("gameplay3")) l3 = new Level(3);
        if (screen.equals("gameplay4")) l4 = new Level(4);
        if (screen.equals("gameplay5")) l5 = new Level(5);
        if (screen.equals("gameplay6")) l6 = new Level(6);
        if (screen.equals("gameplay7")) l7 = new Level(7);
        if (screen.equals("gameplay8")) l8 = new Level(8);
        if (screen.equals("gameplay9")) l9 = new Level(9);
        if (screen.equals("gameplay10")) l10 = new Level(10); 
      }
    }
    
  }
  void display(String filename, int loadonx, int loadony){ 
    PImage loadscreen = loadImage(filename);
    if (filename.equals("backIcon.png")) loadscreen.resize(60,60);
    imageMode(CORNER);
    image(loadscreen,loadonx,loadony);
  }
}
