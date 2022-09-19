void setup(){
  size(500,500);
  PFont font=createFont("標楷體",40);
  textFont(font);
  myShuffle();
}
void mousePressed(){
  myShuffle();
}
String []faces={
  "黑桃A","黑桃2","黑桃3","黑桃4","黑桃5","黑桃6","黑桃7","黑桃8","黑桃9","黑桃10","黑桃J","黑桃Q","黑桃K",
  "紅心A","紅心2","紅心3","紅心4","紅心5","紅心6","紅心7","紅心8","紅心9","紅心10","紅心J","紅心Q","紅心K",
  "方塊A","方塊2","方塊3","方塊4","方塊5","方塊6","方塊7","方塊8","方塊9","方塊10","方塊J","方塊Q","方塊K",
  "梅花A","梅花2","梅花3","梅花4","梅花5","梅花6","梅花7","梅花8","梅花9","梅花10","梅花J","梅花Q","梅花K"};
void myShuffle(){    //洗牌
  for(int k=0;k<10000;k++){
    int a=int( random(52) );
    int b=int( random(52) );
    //目標:faces[a]  faces[b]交換
    String temp=faces[a];
    faces[a]=faces[b];
    faces[b]=temp;
  }
  face1=faces[0];
  face2=faces[1];
  face3=faces[2];
  face4=faces[3];
}
int w=10;
String face1,face2,face3,face4;
void draw(){
  drawCard(40,50,face1);
  drawCard(80,80,face2);
  drawCard(140,110,face3);
  drawCard(180,140,face4);
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
