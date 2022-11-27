ArrayList<Curve> curves;//curves是一個 "放很多Curve的鏈結串列"
Curve curve;//宣告curve是一個Curve物件
NoLine zone;
Ball ball;
int points_size=0, score=0, final_score;//點的總數/吃星星的得分/最終分數
boolean playing=false, cleaning=false, moving=false;//控制開始/結束遊戲
float ink_size;//墨水量
int x=1;
void setup() {
  size(500, 600);
  zone=new NoLine();
  ball=new Ball();
  curves=new ArrayList<Curve>();  //new方法 創造curves是一個"放很多Curve的鏈結串列"
}
class Ball {
  float x, y, vx=1, vy=-1;
  void setting(float x1, float y1) {
    x=x1;
    y=y1;
  }
  void moving(boolean moving) {
    if (moving) {
      x+=vx;
      y+=vy;
      vy+=0.98/6;
    }
  }
  void rolling(boolean rolling) {
    if (rolling) {
    }
  }
  void collision() {
    for (int i=0; i< curves.size(); i++) {
      Curve p = curves.get(i);
      for (int j =1; j< curve.pts.size()-1; j++) {
        PVector p1 = curve.pts.get(j);
        PVector p3= curve.pts.get(j-1);
        PVector p2 = curve.pts.get(j+1);
        float d_p1_p2=dist(p1.x, p1.y, p2.x, p2.y);
        float slop=(p2.y-p1.y)/(p2.x-p1.x);
        if ((x>=p1.x-19.9&&x<=p1.x+19.9)&&(y>=p1.y-20.5&&y<=p1.y-19.5)) {
          vx=0;
          vy=0;
          //moving=false;
          if (slop>0&&p2.x-p1.x>0) {
            vx=1.3;
            vy=1.3;
            x+=vx;
            y+=vy;
          }
        }
      }
    }
  }
}
void draw() {
  strokeWeight(1.5);
  background(#FFFFF2);
  fill (0, 0, 0);
  stroke(#487AF5); //框線顏色
  ellipse(mouseX, mouseY, 12, 12); //劃一個圓，座標(mouseＸ,mouseY)，直徑為100
  if (!playing)text("---Press UP to start the game.---", 100, 400);
  if (playing) {
    stroke(0, 0, 0);
    fill(#E86817);
    ellipse(ball.x, ball.y, 40, 40);
    if (moving) {
      ball.moving(moving);
      ball.collision();
      println("///////", ball.x, "///////");
    } else {
      if (x==1)ball.setting(40, 40);//球的初始位置
      x=2;
    }
    zone.CantDrawZone(100, 200, 250, 322);//設定不可畫的範圍
    zone.CantDrawZone(200, 50, 250, 422);//設定不可畫的範圍
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
  if (keyCode==RIGHT)moving=true;//右鍵 球開始動
  if (keyCode==DOWN) {
    cleaning=true;//按 下鍵 清除鍵
    cleanLines();
    println("----------", curves.size(), "---------");
    println("-----++++--", curve.pts.size(), "-++++------");
    println("----*****--", points_size, "-*****------");
  }
}
