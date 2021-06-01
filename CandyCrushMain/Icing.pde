public class Icing extends Blocker{
  public Icing(){
    super("Icing.png");
    
  }
  void display(int x, int y){
    icon.resize(46,50);
    image(icon,x,y);
  }
  
}
