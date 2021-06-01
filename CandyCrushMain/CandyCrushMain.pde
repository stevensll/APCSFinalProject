
//Icing test = new Icing();

//Candy test2 = new Candy("green");
//Candy test3 = new Candy("red");
//Candy test4 = new Candy("purple");
//Candy test5 = new Candy("blue");
//Candy test6 = new Candy("orange");
//Candy test7 = new Candy("yellow");
Level l1;
Level l2;

void setup(){
  l1 = new Level(2);
  l1.init();
  System.out.println(l1.getMaxMoves());
  //System.out.println(l1.map.size() + " " + l1.map.get(0).size());

  //System.out.println(l1.xSize + " " + l1.ySize);
  //System.out.println(l1.numBlockers);


  size(800,1000);
  //test.init();
  //test2.init();
  //test3.init();
  //test4.init();
  //test5.init();
  //test6.init();
  //test7.init();
}

void draw(){
  background(140);
  l1.display(width/2, height/2);
  //for(int i= 0; i < l1.map.size();i++){
    
  //}
  //test.display(200,200);
  //test2.display(300,300);
  //test3.display(365,300);
  //test4.display(300,200);
  //test5.display(365,200);
  //test6.display(500,300);
  //test7.display(430,300);
}
