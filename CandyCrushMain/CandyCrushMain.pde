
Level l1;
Level l2;

void setup(){

    size(463,1000);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,1000);
    image(firstm, 0,0);


}

void draw(){
  Button playButton = new Button();
  if (mousePressed){
      if (mouseX>=135 && mouseX<=320 && mouseY>=470 && mouseY<=520) playButton.mouseClicked();
    }

  //test.loadIcon(200,200);
  //test2.loadIcon(300,300);
  //test3.loadIcon(365,300);
  //test4.loadIcon(300,200);
  //test5.loadIcon(365,200);
  //test6.loadIcon(500,300);
  //test7.loadIcon(430,300);
}
