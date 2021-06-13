
Level l1; Level l2; Level l3; Level l4; Level l5; 
Level l6; Level l7; Level l8; Level l9; Level l10;

Button playButton; Button back;

Button lvl1; Button lvl2; Button lvl3; Button lvl4; Button lvl5;
Button lvl6; Button lvl7; Button lvl8; Button lvl9; Button lvl10;

String currentscreen;

//boolean win;
PImage current;

void setup(){
    size(440,680);
    PImage firstm = loadImage("playMenu.png");
    current = firstm;
    current.resize(440,0);
    image(current, 0,0);
    currentscreen="firstm";
    playButton = new Button(135,300,435,495);
}

void draw(){
 
   //back = new Button(7,65,555,630);
   //boolean toggle = false;
   //if (currentscreen.equals("levels")){ //displays the gameplays for each level
     //if (mouseX>=7 && mouseX<=65 && mouseY>=555 && mouseY<=630) {
     //  clear();
     //  l1 = new Level (1);
     ////  back.display("backIcon.png",0,0);
     //  currentscreen = "lvl1";
     }
    // else if (mouseX>=175 && mouseX<=230 && mouseY>=600 && mouseY<=690) {
    //   clear();
    //   l2 = new Level (2);
    ////   back.display("backIcon.png",0,0);
    //   currentscreen = "lvl2";
    // }
    // else if (mouseX>=325 && mouseX<=385 && mouseY>=560 && mouseY<=640){
    //   clear();
    //   l3 = new Level (3);
    ////   back.display("backIcon.png",0,0);
    //   currentscreen = "lvl3";
    // }
    // else if (mouseX>=380 && mouseX<=435 && mouseY>=430 && mouseY<=505){
    //   clear();
    //   l4 = new Level (4);
    ////   back.display("backIcon.png",0,0);
    //   currentscreen = "lvl4";
    // }
    // else if (mouseX>=310 && mouseX<=365 && mouseY>=315 && mouseY<=390){
    //   clear();
    //   l5 = new Level (5);
    // //  back.display("backIcon.png",0,0);
    //   currentscreen = "lvl5";
    // }
   
   
//   //allows player to go back to levels screen
   //if (mousePressed && currentscreen.contains("lvl")){
   //  if (mouseX>=10 && mouseX<=47 && mouseY<=47){
   // //   back.mouseClicked("backButton.png",0,0);
   //    currentscreen = "back";
   //    //toggle = true;
   //  }
   //}
   //if (mousePressed && currentscreen.equals("back")){
   //  if (mouseX>=135 && mouseX<=325 && mouseY>=530 && mouseY<=575){
   //    clear();
   //    l1 = null;
   //    l2 = null;
   //    l3 = null;
   //    l4 = null;
   //    l5 = null;
   // //   back.mouseClicked("levels.jpg",-20,-200); //returns to level page
   //    currentscreen = "levels";
   //  }
   //  else if (mouseX>=500){
   //    //resume level
   //  }
   //}
  //if(l1!=null)l1.display(width/2,height/2);
  //if(l2!=null)l2.display(width/2,height/2);
  //if(l3!=null)l3.display(width/2,height/2);
  //if(l4!=null)l4.display(width/2,height/2);
  //if(l5!=null)l5.display(width/2,height/2);

//}


void mouseClicked(){
    if (playButton!=null && currentscreen.equals("firstm")) {
      playButton.display("levels.jpg",-20,-200);
      lvl1 = new Button(7,65,555,630);
      lvl2 = new Button(175,230,555,630);
      lvl3 = new Button(325,385,560,640);
      lvl4 = new Button(380,435,430,505);
      lvl5 = new Button(310,365,315,390);
      lvl6 = new Button(180,235,290,365);
      lvl7 = new Button(150,205,290,365);
      lvl8 = new Button(0,0,0,0);
      lvl9 = new Button(0,0,0,0);
      lvl10 = new Button(0,0,0,0);
    }
    if (currentscreen.equals("levels")){
      lvl1.display(l1, 1);
      lvl2.display(l2, 2);
      lvl3.display(l3, 3);
      lvl4.display(l4, 4);
      lvl5.display(l5, 5);
      lvl6.display(l6, 6);
      lvl7.display(l7, 7);
      lvl8.display(l8, 8);
      lvl9.display(l9, 9);
      lvl10.display(l10, 10);
    }
 
  //  if (back!=null && currentscreen.equals("levels")) {
  //    back.display("backIcon.png",0,0); }
}
