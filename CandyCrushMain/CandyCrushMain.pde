
Level l1;
Level l2;

String currentscreen;

void setup(){

    size(463,1000);
    //PImage firstm = loadImage("playMenu.png");
    //firstm.resize(463,1000);
    //image(firstm, 0,0);

    //currentscreen="firstm";
    l1 = new Level(1);
}

void draw(){
  l1.display(width/2,height/2);
  //System.out.println(l1.map.get(0).get(3).xPos + " " + l1.map.get(0).get(3).yPos);

  //Button playButton = new Button();
  //if (mousePressed && currentscreen.equals("firstm")){
  //    if (mouseX>=135 && mouseX<=320 && mouseY>=470 && mouseY<=520) playButton.mouseClicked("levels.jpg");
  // } 

}
void mouseClicked(){
  l1.mouseTrack();
}
