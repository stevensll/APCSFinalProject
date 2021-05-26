public class Candy{
  private String c;
  private PImage icon;
  
  public Candy(String c){
    this.c = c;
  }
  void initIcon(){
    if (c.equals("blue")) icon = loadImage("blue.png");
  }
  void loadIcon(int x, int y){
    image(icon,x,y);
  }
}
