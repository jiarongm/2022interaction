class Curve {//先定義一個物件Curve，Curve裡面有很多
  ArrayList<PVector>pts;//pts 是 放向量的鏈結串列
  Curve() {///在class面呼叫自己 >>>建構子:一開始就會做的事
    pts=new ArrayList<PVector>();//一開始先 創建向量pts
  }
  void draw() {//畫線
    for (int i=0; i<pts.size()-1; i++) {
      map.beginDraw();
      map.stroke(#FF0000);
      map.strokeWeight(4);
      map.fill(#FF0000);
      map.line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);//第i個與i+1個連成線
      map.endDraw();
      
      stroke(#0000FF);
      fill(#0000FF);
      line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);//第i個與i+1個連成線
    }
  }
  void addPoint(float x, float y) {///儲存向量的方法
    PVector pt=new PVector(x, y);//創建一個向量pt(x,y)
    pts.add(pt);//存入pts裡
  }
}

class NoLine {
  void CantDrawZone(int x1, int y1, int x2, int y2) {
    fill(#FFE5E5);
    rect(x1, y1, x2-x1, y2-y1, 6);//標記不可畫的範圍
  }
  void DrawAndNotDraw(int x1, int y1, int x2, int y2) {
    if (mouseX>=x1&&mouseX<=x2&&mouseY>=y1&&mouseY<=y2) {//在不可畫的範圍外
      println("---------This Zone Can't Draw.---------");
      curve =new Curve();//創一個新的curve物件
      curves.add(curve);///把線段加入curves裡///每條線都收在curves鏈結串列之中
    } else {
      curve.addPoint(mouseX, mouseY);//把滑鼠點存入curve裡
      println(curves.size(), "--", curve.pts.size() );//輸出一行 就不用換行了
    }
  }
}
