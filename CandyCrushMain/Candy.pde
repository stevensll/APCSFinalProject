public class Candy extends Element{
  PImage clickedIcon;
  boolean isClicked;
  // neighbors
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
    clickedIcon = loadImage(c+"clicked.png"); 
    clickedIcon.resize(0, (int)(55*scale));
  }
  @Override
  void clicked(){
    if(!isClicked){
      isClicked = true;
      display(this.xPos,this.yPos);
    }
    else {
      isClicked = false;
      display(this.xPos,this.yPos);
    }
    //System.out.println(xPos + " " + yPos + " clicked");

  }
  
  void display(float x, float y){
    if(!isClicked){
       super.display(x,y);
    } else {
       image(clickedIcon,x,y);
    }
  }
  
  String toString(){
    return c.substring(0,1);
  }
}
