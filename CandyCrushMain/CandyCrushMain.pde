
Level l1; Level l2;
Level l3; Level l4;
Level l5; Level l6;

String currentscreen;

void setup(){
    size(463,1000);

    PImage firstm = loadImage("playMenu.png");
    firstm.resize(463,1000);
    image(firstm, 0,0);
    currentscreen="firstm";
    l1 = new Level(1); l1.init();
    l2 = new Level(2); l2.init();
    l3 = new Level(3); l3.init();
    l4 = new Level(4); l4.init();
    l5 = new Level(5); l5.init();
    l6 = new Level(6); l6.init();
}

void draw(){
  Button playButton = new Button();
  if (mousePressed && currentscreen.equals("firstm")){
      if (mouseX>=135 && mouseX<=320 && mouseY>=470 && mouseY<=520) {
        playButton.mouseClicked("levels.jpg");
        currentscreen = "levels";
      }
   } 

   if (mousePressed && currentscreen.equals("levels")){ //displays the gameplays for each level
   //coordinates not accurate
     if (mouseX<=200 && mouseY>=200) {
       clear();
       l1.display(width/2,height/2); 
       currentscreen = "level1";
     }
     else if (mouseX<=400 && mouseX>=200 && mouseY>=500) {
       clear();
       l2.display(width/2, height/2);
       currentscreen = "level2";
     }
     else if (mouseX<=500 && mouseX>=400 && mouseY>=500){
       clear();
       l3.display(width/2, height/2);
       currentscreen = "level3";
     }
     else if (mouseX<100){
       clear();
       l4.display(width/2, height/2);
       currentscreen = "level4";
     }
     else if (mouseX<=300){
       clear();
       l5.display(width/2, height/2);
       currentscreen = "level5";
     }
     else if (mouseX<=400){
       clear();
       l6.display(width/2, height/2);
       currentscreen = "level6";
     }
   }


}
