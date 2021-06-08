Level l1; Level l2;
Level l3; Level l4;
Level l5; Level l6;
Button playButton; Button back;
String currentscreen;

//boolean win;
//PImage current;

void setup(){
    size(440,680);
    PImage firstm = loadImage("playMenu.png");
    //current = firstm;
    firstm.resize(440,0);
    image(firstm, 0,0);
    currentscreen="firstm";
    playButton = new Button(135,300,435,495);
}

void draw(){
 
    back = new Button(7,65,555,630);
//   boolean toggle = false;
//   //win = false;
//   if (currentscreen.equals("levels")){ //displays the gameplays for each level
//     if (mouseX>=7 && mouseX<=65 && mouseY>=555 && mouseY<=630) {
//       clear();
//       l1 = new Level (1);
//     //  back.display("backIcon.png",0,0);
//       currentscreen = "lvl1";
//     }
//     else if (mouseX>=175 && mouseX<=230 && mouseY>=600 && mouseY<=690) {
//       clear();
//       l2 = new Level (2);
//    //   back.display("backIcon.png",0,0);
//       currentscreen = "lvl2";
//     }
//     else if (mouseX>=325 && mouseX<=385 && mouseY>=560 && mouseY<=640){
//       clear();
//       l3 = new Level (3);
//    //   back.display("backIcon.png",0,0);
//       currentscreen = "lvl3";
//     }
//     else if (mouseX>=380 && mouseX<=435 && mouseY>=430 && mouseY<=505){
//       clear();
//       l4 = new Level (4);
//    //   back.display("backIcon.png",0,0);
//       currentscreen = "lvl4";
//     }
//     else if (mouseX>=310 && mouseX<=365 && mouseY>=315 && mouseY<=390){
//       clear();
//       l5 = new Level (5);
//     //  back.display("backIcon.png",0,0);
//       currentscreen = "lvl5";
//     }
//   }
   
//   //allows player to go back to levels screen
//   if (mousePressed && currentscreen.contains("lvl")){
//     if (mouseX>=10 && mouseX<=47 && mouseY<=47){
//    //   back.mouseClicked("backButton.png",0,0);
//       currentscreen = "back";
//       //toggle = true;
//     }
//   }
//   if (mousePressed && currentscreen.equals("back")){
//     if (mouseX>=135 && mouseX<=325 && mouseY>=530 && mouseY<=575){
//       clear();
//       l1 = null;
//       l2 = null;
//       l3 = null;
//       l4 = null;
//       l5 = null;
//    //   back.mouseClicked("levels.jpg",-20,-200); //returns to level page
//       currentscreen = "levels";
//     }
//     else if (mouseX>=500){
//       //resume level
//     }
//   }
//  //if(l1!=null && !toggle)l1.display(width/2,height/2);
//  //if(l2!=null && !toggle)l2.display(width/2,height/2);
//  //if(l3!=null && !toggle)l3.display(width/2,height/2);
//  //if(l4!=null && !toggle)l4.display(width/2,height/2);
//  //if(l5!=null && !toggle)l5.display(width/2,height/2);

}
void mouseClicked(){
  //if(l1!=null){
  //  l1.mouseTrack();
    if (playButton!=null && currentscreen.equals("firstm")) {
      playButton.display("levels.jpg",-20,-200);
      currentscreen = "levels"; }
    //if (back!=null && currentscreen.equals("levels")) {
    //  back.display("backIcon.png",0,0); }
  }
