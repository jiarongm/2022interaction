PGraphics star1, star2, star3;
ArrayList<PVector> points;//PVector:向量(座標) 宣告:資料結構 名稱；
void setup() {
  size(500, 600);
  star_setting();
}
float dx=0, dy=0;
float ballx=40, bally=40;//球的設定
float ball_before_x=ballx, ball_before_y=bally;//球的位置，計算速度用
float ball_H=0, ball_V=0, ball_U;//球的高度 速率 位能
float ballvx=1, ballvy=-1;
float slopeX=0, slopeY=0, slope=0;//斜率
boolean moving=false;

int starX1=77, starY1=149;
int starX2=128, starY2=249;
int score=0;
int x=1;
void draw() {
  background(#FFFFF3);
  fill(#E86817);
  //drawBall_if_moving(40,40,moving);
  ellipse(ballx, bally, 40, 40);
  if (moving) {
    ballx+=ballvx;
    bally+=ballvy;
    ballvy+=0.98/6;///重力G
  }
  drawLine();
  star_beg_clear_end(1, 77, 149, ballx, bally);//第i顆星星,x座標,y座標,球座標
  star_beg_clear_end(2, 128, 249, ballx, bally);
  star_beg_clear_end(3, 358, 349, ballx, bally);
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
  Ink();
}
void keyPressed() {
  if (keyCode==RIGHT)dx++;
  if (keyCode==LEFT)dx--;
  if (keyCode==UP) {
    ballx=150;
    bally=50;
    ballvy=0.5;
  }
  if (keyCode==DOWN)moving=true;
}
