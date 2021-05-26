Icing test = new Icing();
Candy test2 = new Candy("blue");

void setup(){
  size(800,1000);
  test.initIcon();
  test2.initIcon();
}

void draw(){
  background(140);
  test.loadIcon(200,200);
  test2.loadIcon(300,300);
}
