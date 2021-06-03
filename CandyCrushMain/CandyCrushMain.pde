
Level l1;
Level l2;

String currentscreen;

void setup(){
    size(463,1000);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,1000);
    image(firstm, 0,0);
    currentscreen="firstm";
    l1 = new Level(1);
    l1.init();
}

void draw(){
  Button playButton = new Button();
  if (mousePressed && currentscreen.equals("firstm")){
      if (mouseX>=135 && mouseX<=320 && mouseY>=470 && mouseY<=520) {
        playButton.mouseClicked("levels.jpg");
        currentscreen = "levels";
      }
   } 
   if (mousePressed && currentscreen.equals("levels")){
     if (mouseX<=200 && mouseY<=1000) {
       l1.display(width/2,height/2); }
   }
}
