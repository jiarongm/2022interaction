ArrayList<Curve> curves;//curves是一個 "放很多Curve的鏈結串列"
Curve curve;//宣告curve是一個Curve物件
void setup() {
  size(500, 600);
  //curve=new Curve();//new方法 創造物件
  curves=new ArrayList<Curve>();  //new方法 創造curves是一個"放很多Curve的鏈結串列"
}
class Curve {//先定義一個物件Curve，Curve裡面有很多
  ArrayList<PVector>pts;//pts 是 放向量的鏈結串列
  Curve() {///在class面呼叫自己 >>>建構子:一開始就會做的事
    pts=new ArrayList<PVector>();//一開始先 創建向量pts
  }
  void draw() {//畫線
    for (int i=0; i<pts.size()-1; i++) {
      line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);//第i個與i+1個連成線
    }
  }
  void addPoint(float x,float y){///儲存向量的方法
    PVector pt=new PVector(x,y);//創建一哥向量pt(x,y)
    pts.add(pt);//存入pts裡
  }
}
void mouseDragged() {//滑鼠拖曳時把滑鼠座標加入curve裡>>>就是在存點
  curve.addPoint(mouseX, mouseY);//把滑鼠點存入curve裡
  println(curves.size(),"--",curve.pts.size() );//輸出一行 就不用換行了
}
void mousePressed(){//按下滑鼠時，分段
  curve =new Curve();//創一個新的curve物件
  curves.add(curve);///把線段加入curves裡///每條線都收在curves鏈結串列之中
}
void draw() {
  background(#FFFFF2);
  
  //把每段線段都畫出來
  for(Curve c:curves){//for-each循環，設置c為第一個curves、第二個、第三個...從頭跑到尾???
    c.draw();//畫線
  }
  for(int i=0,i<curves.size();i++){
    ArrayList<Curve> c=curves.get(i);
    c.draw();
  }
}
