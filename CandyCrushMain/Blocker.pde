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
    icon.resize(50,50);
    image(icon,x,y);
  }
}
