abstract class Element{
  PImage icon;
  String imagePath;
  int iconDimensions;
  public Element(String file){
    iconDimensions = 50;
    imagePath = file;
  }
  void initIcon(){
    icon = loadImage(imagePath);
  }
  void displayIcon(int x, int y){
    icon.resize(iconDimensions,iconDimensions);
    image(icon,x,y);
  }
  
}
