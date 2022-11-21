
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
void Line_Ball(boolean moving, float ballx, float bally, float ballvx, float ballvy,
  float ball_H, float ball_V, float ball_U, float ball_before_x, float  ball_before_y) {
  for (int i=1; i<points.size()-1; i++) {
    PVector pt=points.get(i);
    PVector pt2=points.get(i+1);
    PVector pt_1=points.get(i-1);
    if (moving) {
      slopeX=pt2.x-pt.x;
      slopeY=pt2.y-pt.y;
      slope=sqrt(slopeX*slopeX+slopeY*slopeY);//斜率
      if (slopeX>0 && slopeY>0)slope=-slope;//右下: \
      float ptx3=(pt2.x-pt.x)/2+pt.x;//pt3:兩點座標的中間
      float pty3=(pt2.y-pt.y)/2+pt.y;
      if ( ( (pt.x-ballx)>-18 &&(pt.x-ballx)<18 && (pt.y-bally)>18 &&(pt.y-bally)<22 )||
        (ptx3+-ballx)>-20 &&(ptx3-ballx)<20 && (pty3-bally)>20 &&(pty3-bally)<22) {
        ballvx=0;
        ballvy=0;
        print(pt.x, pt.y+"\n");
        print(ptx3, pty3+"\n");
        print( i  +"\n");
        moving=false;
        if (x==1) {
          ball_H=pt.x-ball_before_x;
          ball_U=9.8*ball_H;
          ball_V=sqrt(ball_U*2);
          x=0;
        }
        print("ball_before_x=   "+ball_before_x+"\n");
        print("ball_H =  "+int(ball_H) +"\n");
        print("ball_V= "+ball_V+"\n");
        print("slope= "+slope  +"\n");
        print("ball_U=  "+ball_U+"\n");
        float distB_P=dist(int(pt.x), int(pt.y), int(pt2.x), int(pt2.y));
        if (distB_P<20&&pt_1.x<=ballx  && pt2.x>ballx ) {
          bally=pty3-20.4;
        }
        if (slope<2) {
          moving=true;
          ballvx=1.8;
          ballvy=0.2;
        } else if (slope>1.5) {
          moving=true;
          ballvx=-1.8;
          ballvy=0.2;
        } else {
          if (ball_U>0) {
            moving=true;
            ballvx=0.4;
            ballvy=0;
            ball_U-=300;
          } else {
            ballvx=0;
            ballvy=0;
            moving=false;
          }
        }
      }
    }
  }
}
