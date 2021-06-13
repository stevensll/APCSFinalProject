abstract class Element{
  PImage icon;
  String imagePath;
  String col;
  Element lN, rN, uN, dN;
  boolean remove;
  float scale;
  
  //coordinates based on pixel positioning;
  float xPos, yPos;
  //coordinates based on list positioning;
  int xPosL, yPosL;

  public Element(String file){
    col = "";
    scale = 1;
    imagePath = file;
    remove = false;
  }
  void init(float factor){
    scale = factor;
    icon = loadImage(imagePath);
    icon.resize(0,(int)(55 * factor));
  }
  
  void display(float x, float y){
    imageMode(CENTER);
    image(icon,x,y);
  }
  void clicked(){}
  
  abstract String toString();

}
