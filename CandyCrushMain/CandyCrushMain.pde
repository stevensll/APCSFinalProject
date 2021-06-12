
Level l1;
Level l2;

String currentscreen;

void setup(){

    size(463,1000);
    l1 = new Level(1);
    System.out.println(l1.map.get(1).get(1).rN);

}

void draw(){

}
void mouseClicked(){
    if(l1!=null)l1.mouseTrack();
}