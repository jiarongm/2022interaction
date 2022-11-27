ArrayList<Curve> curves;//curves是一個 "放很多Curve的鏈結串列"
Curve curve;//宣告curve是一個Curve物件
NoLine zone;
int points_size=0, score=0, final_score;//點的總數/吃星星的得分/最終分數
boolean playing=false, cleaning=false;//控制開始/結束遊戲
float ink_size;//墨水量
void setup() {
  size(500, 600);
  //curve=new Curve();//new方法 創造物件
  zone=new NoLine();
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
  void addPoint(float x, float y) {///儲存向量的方法
    PVector pt=new PVector(x, y);//創建一個向量pt(x,y)
    pts.add(pt);//存入pts裡
  }
}
class NoLine {
  PVector p1, p2;
  void CantDrawZone(int x1, int y1, int x2, int y2) {
    p1=new PVector(x1, y1);
    p2=new PVector(x2, y2);
  }
}
void mouseDragged() {//滑鼠拖曳時把滑鼠座標加入curve裡>>>就是在存點
  if (playing&&ink_size>0) {
    if (mouseX>=zone.p1.x&&mouseX<=zone.p2.x&&mouseY>=zone.p1.y&&mouseY<=zone.p2.y) {//在不可畫的範圍外
      println("---------This Zone Can't Draw.---------");
      curve =new Curve();//創一個新的curve物件
      curves.add(curve);///把線段加入curves裡///每條線都收在curves鏈結串列之中
    } else {
      curve.addPoint(mouseX, mouseY);//把滑鼠點存入curve裡
      println(curves.size(), "--", curve.pts.size() );//輸出一行 就不用換行了
    }
  }
}
void mousePressed() {//按下滑鼠時，分段
  if (playing&&ink_size>0) {
    curve =new Curve();//創一個新的curve物件
    curves.add(curve);///把線段加入curves裡///每條線都收在curves鏈結串列之中
  }
}
void mouseReleased() {//釋放滑鼠時 計算點的總數
  if (playing&&ink_size>0) {
    points_size+=curve.pts.size();
    println("----------", points_size, "---------");
  }
}
void draw() {
  strokeWeight(1.5);
  background(#FFFFF2);
  if (!playing)text("---Press UP to start the game.---", 100, 400);
  if (playing) {
    zone.CantDrawZone(100, 200, 250, 322);//設定不可畫的範圍
    fill(255, 0, 0);
    rect(int(zone.p1.x), int(zone.p1.y), int(zone.p2.x-zone.p1.x), int(zone.p2.y-zone.p1.y));//標記不可畫的範圍
    //把每段線段都畫出來
    for (Curve c : curves) {//for-each循環，設置c為第一個curves、第二個、第三個...從頭跑到尾???
      c.draw();//畫線//對於每一個線段curve都把他畫出來
    }
  }
  Ink();
}
void cleanLines() {
  for (int i = curves.size() - 1; i >= 0; i--) {
    Curve part = curves.get(i);
    if (cleaning) {
      for (int j = curve.pts.size() - 1; j >= 0; j--) {
        PVector part2 = curve.pts.get(j);
        curve.pts.remove(j);
      }
      curves.remove(i);
    }
    points_size=0;
    ink_size=150;//恢復墨水量
    final_score=0;//總分重算
    score=0;//清空 吃星星的得分
  }
}
void keyPressed() {
  if (keyCode==UP)playing=true;//按 鍵盤上鍵 開始遊戲
  if (keyCode==DOWN) {
    cleaning=true;//按 下鍵 清除鍵
    cleanLines();
    println("----------", curves.size(), "---------");
    println("-----++++--", curve.pts.size(), "-++++------");
    println("----*****--", points_size, "-*****------");
  }
}
void Ink() {
  ink_size=150-( points_size )/8;
  textSize(24);
  fill(0, 0, 0);
  text("Ink :", 120, 30);
  if (ink_size>100) {///墨水量大於100時  顏色較深
    fill(#494E50);
    rect(175, 15, ink_size, 12, 3);
  } else if (ink_size>=60&&ink_size<=100) {//////墨水量100-50  顏色較深
    fill(#7F8689);
    rect(175, 15, ink_size, 12, 3);
  } else if (ink_size>0) {//////墨水量>0
    fill(#AFBBBF);
    rect(175, 15, ink_size, 12, 3);
  }
  final_score=score*10+int(ink_size/10);///初始有15分()墨水
  textSize(24);
  fill(0, 0, 0);
  if (final_score>=0)text("score="+final_score, 400, 27);//吃一顆星星+10分 總分45~0
  else text("score="+score*10, 400, 27);
}
