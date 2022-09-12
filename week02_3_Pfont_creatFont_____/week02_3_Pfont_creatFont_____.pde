void setup(){
  size(500,500);
  PFont font=createFont("標楷體",40);
  textFont(font);
}
int w=10;
void draw(){
  drawCard(40,50,"黑桃1");
  drawCard(60,80,"紅心2");
  drawCard(80,110,"方塊3");
}
void drawCard(int x,int y,String face){
  fill(255);
  rect(x-w,y-w,150+2*w,250+2*w,20);
  fill(#E39393);
  rect(x,y,150,250,20);
  fill(0,0,0);
  textSize(40);
  text(face,x,y+40);
}
