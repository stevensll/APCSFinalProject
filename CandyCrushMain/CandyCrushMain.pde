
Icing test = new Icing();

Candy test2 = new Candy("green");
Candy test3 = new Candy("red");
Candy test4 = new Candy("purple");
Candy test5 = new Candy("blue");
Candy test6 = new Candy("orange");
Candy test7 = new Candy("yellow");

void setup(){
  //try{
    size(463,1000);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,800);
    image(firstm, 0,0);
    
    //mouseClicked();
    //Level l1 = new Level(1);
    //System.out.println(l1.getMaxMoves());
    //System.out.println(l1.numBlockers);

//} catch(FileNotFoundException e){
//    e.printStackTrace();
//  }
  //size(800,1000);
  //test.initIcon();
  //test2.initIcon();
  //test3.initIcon();
  //test4.initIcon();
  //test5.initIcon();
  //test6.initIcon();
  //test7.initIcon();
}

void draw(){
  Button playButton = new Button(0,0,100,100);
  if (mousePressed){
      if (mouseX>=135 && mouseX<=320 && mouseY>=370 && mouseY<=420) playButton.mouseClicked();
    }
  //background(140);
  //test.loadIcon(200,200);
  //test2.loadIcon(300,300);
  //test3.loadIcon(365,300);
  //test4.loadIcon(300,200);
  //test5.loadIcon(365,200);
  //test6.loadIcon(500,300);
  //test7.loadIcon(430,300);
}
