public class Candy extends Element{
  String c;
  boolean isClicked;
  int hNeighbors; 
  int vNeighbors;
  
  public Candy(String c){
    super(c+".png");
    this.c = c;
    this.isClicked = false;
  }
  String getColor(){
    return this.c;
  }
  int getHNeighbors(){
    return this.hNeighbors;
  }
  int getVNeighbors(){
    return this.vNeighbors;
  }
}
