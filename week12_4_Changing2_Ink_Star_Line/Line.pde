void drawLine() {
  if (mousePressed&& (mouseX!=pmouseX||mouseY!=pmouseY)  ) {///按下左鍵畫線
    points.add(new PVector(mouseX, mouseY));//捕捉滑鼠XY座標放到points裡
  }
  pushMatrix();//備份母體(紀錄每個點的相對位置)
  translate(dx, dy);//再移動
  for (int i=0; i<points.size()-1; i++) {//在points的範圍裡
    if (i<300) {
      PVector pt=points.get(i);///向量pt=第i個points(把每個座標秀出來)
      PVector pt2=points.get(i+1);
      //line(pt.x, pt.y, pt2.x, pt2.y);
      fill(0, 0, 0);
      ellipse(pt.x, pt.y, 5, 5);///這樣就能捕捉每個整數座標並使用了!!
    }
  }
  popMatrix();//恢復每個點的相對位置
}
