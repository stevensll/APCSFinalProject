public class Jelly extends Blocker{
  public Jelly(String c){
    super(c+".png");
    this.col = c;
  }
  String toString(){
    return "J"+col.substring(0,1);
  }
}
