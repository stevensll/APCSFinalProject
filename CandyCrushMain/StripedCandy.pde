public class StripedCandy extends Candy{
  public StripedCandy(String c, String direction){
    super("striped"+direction+c);
    this.col = c;
    this.direction = direction;
  }
  @Override
  String toString(){
    if (remove) return "*";
    else return col.substring(0,1) + direction.substring(0,1);
  }
}
