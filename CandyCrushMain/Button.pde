public class Button{
  private int x;
  private int y;
  public Button(int xcor, int ycor){
    x = xcor;
    y = ycor;
  }
  void mouseClicked(){
    PImage levelm = loadImage("levels.jpg");
    levelm.resize(463,1000);
    image(levelm, 0,0);
  }
  void display(){
  }
}
