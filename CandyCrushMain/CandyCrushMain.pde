
Level l1; Level l2; Level l3; Level l4; Level l5; 
Level l6; Level l7; Level l8; Level l9; Level l10;

Button playButton = new Button(135,300,435,495);
Button back = new Button(5,45,14,52); 
Button quit = new Button(3,145,60,90);

Button lvl1 = new Button(7,65,570,635), 
  lvl2 = new Button(177,232,610,675), 
  lvl3 = new Button(325,385,560,635), 
  lvl4 = new Button(380,435,430,505),
  lvl5 = new Button(310,365,315,390),
  lvl6 = new Button(180,235,290,365),
  lvl7 = new Button(45,100,290,365),
  lvl8 = new Button(0,47,200,260),
  lvl9 = new Button(95,145,125,185),
  lvl10 = new Button(215,270,150,210);

String currentscreen;

boolean menuShowing;

void setup(){
    size(440,680);
    PImage firstm = loadImage("playMenu.png");
    firstm.resize(440,0);
    image(firstm, 0,0);
    currentscreen="firstm";
    menuShowing = false;
}

void draw(){
   if (currentscreen.equals("levels")){
      displayLevels();
    }
   if (currentscreen.length()>=8 && currentscreen.substring(0,8).equals("gameplay")){
     if (currentscreen.equals("gameplay1")) l1.display(width/2,height/2);
     if (currentscreen.equals("gameplay2")) l2.display(width/2,height/2);
     if (currentscreen.equals("gameplay3")) l3.display(width/2,height/2);
     if (currentscreen.equals("gameplay4")) l4.display(width/2,height/2);
     if (currentscreen.equals("gameplay5")) l5.display(width/2,height/2);
     if (currentscreen.equals("gameplay6")) l6.display(width/2,height/2);
     if (currentscreen.equals("gameplay7")) l7.display(width/2,height/2);
     if (currentscreen.equals("gameplay8")) l8.display(width/2,height/2);
     if (currentscreen.equals("gameplay9")) l9.display(width/2,height/2);
     if (currentscreen.equals("gameplay10")) l10.display(width/2,height/2);
     
     back.display("backIcon.png",0,0);
     if (menuShowing) {
       quit.display("backButton.png",-95,-330);
     }
   }
}

void mouseClicked(){
  println(mouseX+ " " +mouseY);
  if (currentscreen.equals("firstm")) playButton.mouseClicked("levels");
  if (currentscreen.equals("levels")) clickLevels();
  if (currentscreen.length()>=8 && currentscreen.substring(0,8).equals("gameplay")) {
    back.mouseClicked("backmenu");
    if (menuShowing) quit.mouseClicked("levels");
  }
}
void displayLevels(){
  PImage l = loadImage("levels.jpg");
  imageMode(CORNER);
  l.resize(463,1000);
  image(l,-20,-200);
}
void clickLevels() {
  lvl1.mouseClicked("gameplay1");
  lvl2.mouseClicked("gameplay2");
  lvl3.mouseClicked("gameplay3");
  lvl4.mouseClicked("gameplay4");
  lvl5.mouseClicked("gameplay5");
  lvl6.mouseClicked("gameplay6");
  lvl7.mouseClicked("gameplay7");
  lvl8.mouseClicked("gameplay8");
  lvl9.mouseClicked("gameplay9");
  lvl10.mouseClicked("gameplay10");
}
