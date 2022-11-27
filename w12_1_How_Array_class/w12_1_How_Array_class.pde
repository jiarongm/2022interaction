PVector pt;//pt是一個向量
PVector [] pts;//pts是一個放向量的矩陣
Line line;//宣告line是一個物件///line是一個形狀為Line的盒子
void setup(){
  size(500,600);
  pts=new PVector[10];///new方法:創建一個物件pts 是 用來放向量、大小為10的矩陣
  for(int i=0;i<10;i++){
    pts[i]=new PVector(random(200),random(200));//創一個隨機的座標放到矩陣裡
  }
  line=new Line();///new方法:創建一個物件line是一種Line
}
void draw(){

}
class Line{//定義物件類型
  float dx=0,dy=0;
  void drawLine(){
  
  }
}
