void setup(){
  size(400,300);
  
}
boolean flying=true;///控制是否在飛
float fruitX=200,fruitY=300;//水果位置
float fruitVX=2,fruitVY=-13;//水果加速度
void draw(){
  background(255,255,0);///每次都重畫，覆蓋
  fill(255,0,0);
  ellipse(fruitX,fruitY,40,40);
  if(flying){
    fruitX+=fruitVX;
    fruitY+=fruitVY;
    fruitVY+=0.98/3;//重力加速度落下
  }
}
void keyPressed(){
  flying=false;
  fruitReset();
}
void fruitReset(){
  fruitX=random(100,300);
  fruitY=300;
  fruitVX=random(-2,+2);
  fruitVY=-13;
  flying=true;
}
