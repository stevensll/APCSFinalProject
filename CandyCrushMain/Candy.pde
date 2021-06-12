public class Candy extends Element{
  
  PImage clickedIcon;
  boolean isClicked;
  // neighbors
  public Candy(String c){
    super(c+".png");
    this.col = c;
    this.isClicked = false;
    clickedIcon = loadImage(col+"clicked.png"); 
    clickedIcon.resize(0, (int)(55*scale));
  }

  @Override
  void clicked(){
    if(!isClicked){
      isClicked = true;
    }
    else {
      isClicked = false;
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
    if(remove) return "r";
    else return col.substring(0,1);
  }
}
