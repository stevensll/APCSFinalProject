
Icing test = new Icing();

Candy test2 = new Candy("green");
Candy test3 = new Candy("red");
Candy test4 = new Candy("purple");
Candy test5 = new Candy("blue");
Candy test6 = new Candy("orange");
Candy test7 = new Candy("yellow");

String currentscreen;

void setup(){
  //try{
    size(463,1000);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,1000);
    image(firstm, 0,0);
    currentscreen="firstm";
   

}

void draw(){
  Button playButton = new Button();
  if (mousePressed && currentscreen.equals("firstm")){
      if (mouseX>=135 && mouseX<=320 && mouseY>=470 && mouseY<=520) playButton.mouseClicked("levels.jpg");
   } 
   //Button[] levels = new Button[10];
   //if (mousePressed){
   //  for (Button b : levels){
   //    if (mouseX<=100) b.mouseClicked();
   //  }
   //}
}
