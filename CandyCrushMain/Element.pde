abstract class Element{
  PImage icon;
  String imagePath;
  int iconDimensions;
  public Element(String file){
    iconDimensions = 50;
    imagePath = file;
  }
  void init(){
    icon = loadImage(imagePath);
  }
  void display(int x, int y){
    icon.resize(iconDimensions,iconDimensions);
    image(icon,x,y);
  }
}
