
Icing test = new Icing();

Candy test2 = new Candy("green");
Candy test3 = new Candy("red");
Candy test4 = new Candy("purple");
Candy test5 = new Candy("blue");
Candy test6 = new Candy("orange");
Candy test7 = new Candy("yellow");


void setup(){
    Level l1 = new Level(1);
    System.out.println(l1.getMaxMoves());
    System.out.println(l1.numBlockers);


  size(800,1000);
  test.initIcon();
  test2.initIcon();
  test3.initIcon();
  test4.initIcon();
  test5.initIcon();
  test6.initIcon();
  test7.initIcon();
}

void draw(){
  background(140);
  for(int i= 0; i < l1.size();i++){
  
  }
  test.loadIcon(200,200);
  test2.loadIcon(300,300);
  test3.loadIcon(365,300);
  test4.loadIcon(300,200);
  test5.loadIcon(365,200);
  test6.loadIcon(500,300);
  test7.loadIcon(430,300);
}
