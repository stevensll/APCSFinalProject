public class Candy{
  private String c;
  private PImage icon;
  
  public Candy(String c){
    this.c = c;
  }
  void initIcon(){
    String[] files = {"red", "orange", "yellow", "green", "blue", "purple"};
    for (int i=0; i<files.length; i++){
      if (c.equals(files[i])) icon = loadImage(files[i]+".png");
    }
  }
  void loadIcon(int x, int y){
    image(icon,x,y);
  }
}
