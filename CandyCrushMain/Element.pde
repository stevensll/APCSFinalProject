abstract class Element{
  PImage icon;
  String imagePath;
  public Element(String file){
    imagePath = file;
  }
  void init(){
    icon = loadImage(imagePath);
  }
  void display(int x, int y, float factor){
    icon.resize(int(50 * factor), 0);
    imageMode(CENTER);
    image(icon,x,y);
  }
}
