public class Candy extends Element{
  String c;
  boolean isClicked;
  // neighbors
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
  }
  @Override
  void mouseClicked(){
    if(!isClicked){
      isClicked = true;
        PImage clickedIcon = loadImage(c+"clicked.png"); 
        clickedIcon.resize(0, (int)(55*scale));
        image(clickedIcon, xPos, yPos);
    }
    else {
      isClicked = false;
    }
    //System.out.println(xPos + " " + yPos + " clicked");

  }
  
  void display(float x, float y){
    //if(isClicked){
    //    PImage clickedIcon = loadImage(c+"clicked.png"); 
    //    clickedIcon.resize(0, (int)(55*scale));
    //    image(clickedIcon, xPos, yPos);
    //} else {
       super.display(x,y);
  }
  
  String toString(){
    return c.substring(0,1);
  }
}
