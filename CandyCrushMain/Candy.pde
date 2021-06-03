public class Candy extends Element{
  String c;
  boolean isClicked;
  // neighbors

  //coordinates based on list positioning;
  int xPos;
  int yPos;
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
  }
  String getColor(){
    return this.c;
  }

}
