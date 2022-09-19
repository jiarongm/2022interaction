void setup(){
  size(500,500);
  PFont font=createFont("標楷體",40);
  textFont(font);
  myShuffle();
}
void mousePressed(){
  myShuffle();
}
void myShuffle(){
  String []flower={"黑桃","紅心","方塊","梅花"};
  face1=flower[int(random(4))]  +int(random(13)+1);
  face2=flower[int(random(4))]  +int(random(13)+1);
  face3=flower[int(random(4))]  +int(random(13)+1);
  face4=flower[int(random(4))]  +int(random(13)+1);
}
int w=10;
String face1,face2,face3,face4;
void draw(){
  drawCard(40,50,face1);
  drawCard(60,80,face2);
  drawCard(80,110,face3);
  drawCard(100,140,face4);
}
void drawCard(int x,int y,String face){
  fill(255);
  rect(x-w,y-w,150+2*w,250+2*w,20);
  fill(#E39393);
  rect(x,y,150,250,20);
  if(face.indexOf("黑桃") == -1 && face.indexOf("梅花") == -1)fill(#FF0A0A);
  else fill(#0A0909);
  textSize(40);
  text(face,x,y+40);
}
