abstract class Element{
  PImage icon;
  String imagePath;
  String col;
  String direction;
  Element lN, rN, uN, dN;
  boolean remove;
  float scale;
  
  //coordinates based on pixel positioning;
  float xPos, yPos;
  //coordinates based on list positioning;
  int xPosL, yPosL;

  public Element(String file){
    direction = "";
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
    if(remove){
      color c = 200;
      if(col.equals("red")) c =  color(179,2,5);
      if(col.equals("orange")) c =  color(230,121,5);
      if(col.equals("green")) c =  color(0,145,10);
      if(col.equals("purple")) c =  color(102,0,145);
      if(col.equals("yellow")) c =  color(266,230,5);
      if(col.equals("blue")) c =  color(5,91,230);
      c=120;
      rectMode(CENTER);
      stroke(c);
      fill(c);
      rect(x,y,40,40,5,5,5,5);
    } else {
      imageMode(CENTER);
      image(icon,x,y);
    }

 
  }
  void clicked(){}
  
  abstract String toString();

}
