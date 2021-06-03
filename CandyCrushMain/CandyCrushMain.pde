
Level l1;
Level l2;

String currentscreen;

void setup(){

    size(463,1000);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,1000);
    image(firstm, 0,0);
<<<<<<< HEAD


=======
    currentscreen="firstm";
   

>>>>>>> origin/buttonDev
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
