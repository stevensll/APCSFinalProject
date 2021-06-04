public class Candy extends Element{
  String c;
  boolean isClicked;
  // neighbors
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
  }
  String getColor(){
    return this.c;
  }
  @Override
  void mouseClicked(){
    if(!isClicked){
      isClicked = true;
    }
    else {
      isClicked = false;
    }
    //System.out.println(xPos + " " + yPos + " clicked");

  }
  void display(int x, int y, float factor){
    if(isClicked){
        PImage clickedIcon = loadImage(c+"clicked.png"); 
        clickedIcon.resize(0, (int)(55*scale));
        image(clickedIcon, xPos, yPos);
    } else {
       super.display(x,y, factor);
    }
  }
}
