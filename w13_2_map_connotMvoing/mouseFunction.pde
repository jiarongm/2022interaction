void mouseDragged() {//滑鼠拖曳時把滑鼠座標加入curve裡>>>就是在存點
  if (playing&&ink_size>0) {
    zone.DrawAndNotDraw(100, 200, 250, 322);//實作不可畫&可畫
    zone.DrawAndNotDraw(200, 50, 250, 422);
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
