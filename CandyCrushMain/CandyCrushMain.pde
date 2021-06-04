Level l1; Level l2;
Level l3; Level l4;
Level l5; Level l6;

String currentscreen;
//PImage current;

void setup(){
    size(440,680);

    PImage firstm = loadImage("playMenu.png");
    //current = firstm;
    firstm.resize(440,0);
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
      if (mouseX>=135 && mouseX<=300 && mouseY>=435 && mouseY<=495) {
        playButton.mouseClicked("levels.jpg",-20,-200);
        currentscreen = "levels";
      }
   } 
   Button back = new Button();
   Tracker test;
   if (currentscreen.equals("levels") && mousePressed){ //displays the gameplays for each level
     if (mouseX>=7 && mouseX<=65 && mouseY>=555 && mouseY<=630) {
       clear();
       l1.display(width/2,height/2); 
       test = new Tracker(l1); test.display();
       back.display("backIcon.png",0,0);
       currentscreen = "lvl1";
     }
     else if (mouseX>=175 && mouseX<=230 && mouseY>=600 && mouseY<=690) {
       clear();
       l2.display(width/2, height/2);
       test = new Tracker(l2); test.display();
       back.display("backIcon.png",0,0);
       currentscreen = "lvl2";
     }
     else if (mouseX>=325 && mouseX<=385 && mouseY>=560 && mouseY<=640){
       clear();
       l3.display(width/2, height/2);
       test = new Tracker(l3); test.display();
       back.display("backIcon.png",0,0);
       currentscreen = "lvl3";
     }
     else if (mouseX>=380 && mouseX<=435 && mouseY>=430 && mouseY<=505){
       clear();
       l4.display(width/2, height/2);
       test = new Tracker(l4); test.display();
       back.display("backIcon.png",0,0);
       currentscreen = "lvl4";
     }
     else if (mouseX>=310 && mouseX<=365 && mouseY>=315 && mouseY<=390){
       clear();
       l5.display(width/2, height/2);
       test = new Tracker(l5); test.display();
       back.display("backIcon.png",0,0);
       currentscreen = "lvl5";
     }
     
     
     //level 6
     //else if (mouseX<=400){
     //  clear();
     //  l6.display(width/2, height/2);
     //  currentscreen = "level6";
     //}
   }
   
   //allows player to go back to levels screen
   if (mousePressed && currentscreen.contains("lvl")){
     if (mouseX>=10 && mouseX<=47 && mouseY<=47){
       back.mouseClicked("backButton.png",0,0);
       currentscreen = "back";
     }
   }
   if (mousePressed && currentscreen.equals("back")){
     if (mouseX>=135 && mouseX<=325 && mouseY>=530 && mouseY<=575){
       clear();
       back.mouseClicked("levels.jpg",-20,-200); //returns to level page
       currentscreen = "levels";
     }
     else if (mouseX>=500){
       //resume level
     }
   }

}
