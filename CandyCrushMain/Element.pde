abstract class Element{
  PImage icon;
  String imagePath;
  Element lN = null; 
  Element rN = null;
  Element uN = null;
  Element dN = null;
  public Element(String file){
    imagePath = file;
  }
  void init(){
    icon = loadImage(imagePath);
  }
  void display(int x, int y, float factor){
    icon.resize(0,int(55 * factor));
    imageMode(CENTER);
    image(icon,x,y);
  }
  void neighborTest(){
    System.out.println(lN.getClass().getName());
    System.out.println(rN.getClass().getName());
    System.out.println(uN.getClass().getName());
    System.out.println(dN.getClass().getName());
  }
}
