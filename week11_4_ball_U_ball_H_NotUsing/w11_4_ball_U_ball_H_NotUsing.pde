PGraphics star1, star2, star3;
ArrayList<PVector> points;//PVector:向量(座標) 宣告:資料結構 名稱；
void setup() {
  size(500, 600);
  star1 = createGraphics(20, 20);
  star2 = createGraphics(20, 20);
  star3 = createGraphics(20, 20);
  points=new ArrayList<PVector>();//new 創建一個新物件points
  drawStar(1);
  drawStar(2);
  drawStar(3);
}
void drawLine() {
  if (mousePressed&& (mouseX!=pmouseX||mouseY!=pmouseY)  ) {///按下左鍵畫線
    points.add(new PVector(mouseX, mouseY));//捕捉滑鼠XY座標放到points裡
  }
  pushMatrix();//備份母體(紀錄每個點的相對位置)
  translate(dx, dy);//再移動
  for (int i=0; i<points.size()-1; i++) {//在points的範圍裡
    PVector pt=points.get(i);///向量pt=第i個points(把每個座標秀出來)
    PVector pt2=points.get(i+1);
    //line(pt.x, pt.y, pt2.x, pt2.y);
    fill(0, 0, 0);
    ellipse(pt.x, pt.y, 5, 5);///這樣就能捕捉每個整數座標並使用了!!
  }
  popMatrix();//恢復每個點的相對位置
}
float ballx=40, bally=40;//球的設定
float ball_before_x=ballx, ball_before_y=bally;//球的位置，計算速度用
float ball_H=0, ball_V=0, ball_U;//球的高度 速率 位能
float ballvx=1, ballvy=-1;
float slopeX=0, slopeY=0, slope=0;//斜率
boolean moving=false;

void drawStar(int x) {
  if (x==1) {
    star1.beginDraw();
    star1.background(#FCE454);
    star1.endDraw();
  } else if (x==2) {
    star2.beginDraw();
    star2.background(#FCE454);
    star2.endDraw();
  } else if (x==3) {
    star3.beginDraw();
    star3.background(#FCE454);
    star3.endDraw();
  }
}
int starX1=77, starY1=149;
int starX2=128, starY2=249;
int score=0;
int x=1;
void draw() {
  background(#FFFFF3);
  fill(#E86817);
  ellipse(ballx, bally, 40, 40);

  if (moving) {
    ballx+=ballvx;
    bally+=ballvy;
    ballvy+=0.98/6;///重力G
  }
  drawLine();

  image(star2, starX2, starY2);
  image(star1, starX1, starY1);
  if ( ballx<(starX1+20)&&bally<(starY1+20)&&ballx>=starX1&&bally>=starY1) {
    star1.beginDraw();
    star1.clear();
    star1.endDraw();
    score+=1;
    starX1=-1;
    starY1=-1;
    print("\n"+"score= "+score+"\n");
  }
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
        } else if (slope>2.9) {
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
float dx=0, dy=0;
void keyPressed() {
  if (keyCode==RIGHT)dx++;
  if (keyCode==LEFT)dx--;
  if (keyCode==UP) {
    ballx=40;
    bally=40;
  }
  if (keyCode==DOWN)moving=true;
}
