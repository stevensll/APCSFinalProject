
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
}
