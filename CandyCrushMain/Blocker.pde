abstract class Blocker{
  private PImage icon;
  private String imagePath;
  public Blocker(String file){
    imagePath = file;
  }
  void initIcon(){
    icon = loadImage(imagePath);
  }
  void loadIcon(int x, int y){
    image(icon,x,y);
  }
}
