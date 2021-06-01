public class Button{
  private int x;
  private int y;
  private int len;
  private int wid;
  
  public Button(int xcor, int ycor, int l, int w){
    x = xcor;
    y = ycor;
    len = l;
    wid = w;
  }
  void mouseClicked(){
    PImage levelm = loadImage("levels.jpg");
    levelm.resize(463,1000);
    image(levelm, 0,0);
    display();
  }
  void display(){
    ellipse(x,y,len,wid);
  }
}
