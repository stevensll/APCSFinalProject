abstract class Element{
  PImage icon;
  String imagePath;
  Element lN; 
  Element rN;
  Element uN;
  Element dN;
  float scale;
  //coordinates based on list positioning;
  int xPos;
  int yPos;
  public Element(String file){
    imagePath = file;
  }
  void init(){
    icon = loadImage(imagePath);
  }
  void display(int x, int y, float factor){
    scale = factor;
    icon.resize(0,int(55 * factor));
    imageMode(CENTER);
    image(icon,x,y);
  }
  void mouseClicked(){}
  void neighborTest(){
    if(lN!=null) System.out.println("l" + lN.getClass().getName());
    if(rN!=null)System.out.println("r" + rN.getClass().getName());
    if(uN!=null)System.out.println("up" + uN.getClass().getName());
    if(dN!=null)System.out.println("down"+ dN.getClass().getName());
  }
}
