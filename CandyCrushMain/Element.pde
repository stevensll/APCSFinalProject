abstract class Element{
  PImage icon;
  String imagePath;
  Element lN, rN, uN, dN;
  float scale;
  
  //coordinates based on pixel positioning;
  float xPos, yPos;
  //coordinates based on list positioning;
  int xPosL, yPosL;

  public Element(String file){
    scale = 1;
    imagePath = file;
  }
  
  void init(float factor){
    scale = factor;
    icon = loadImage(imagePath);
    icon.resize(0,int(55 * factor));
  }
  
  void display(float x, float y){
    imageMode(CENTER);
    image(icon,x,y);
  }
  void clicked(){}
  
  abstract String toString();

  void neighborTest(){
    if(lN!=null) System.out.println("l" + lN.getClass().getName());
    if(rN!=null)System.out.println("r" + rN.getClass().getName());
    if(uN!=null)System.out.println("up" + uN.getClass().getName());
    if(dN!=null)System.out.println("down"+ dN.getClass().getName());
  }
}
