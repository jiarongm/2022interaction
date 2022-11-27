ArrayList<Curve> curves;//curves是一個 "放很多Curve的鏈結串列"
Curve curve;//宣告curve是一個Curve物件
NoLine zone;
Ball ball;
int points_size=0, score=0, final_score;//點的總數/吃星星的得分/最終分數
boolean playing=false, cleaning=false, moving=false;//控制開始/結束遊戲
float ink_size;//墨水量
void setup() {
  size(500, 600);
  //curve=new Curve();//new方法 創造物件
  zone=new NoLine();
  ball=new Ball();
  curves=new ArrayList<Curve>();  //new方法 創造curves是一個"放很多Curve的鏈結串列"
  ball.x=40;
  ball.y=40;
}

class Ball {
  float x, y, vx=0, vy=-1;
  void draw(float x1, float y1) {
    x=x1;
    y=y1;
  }
  /*void moving(boolean moving) {
   if (moving) {
   x+=vx;
   y+=vy;
   vy+=0.98/6;
   }
   }*/
}
void draw() {
  strokeWeight(1.5);
  background(#FFFFF2);
  if (!playing)text("---Press UP to start the game.---", 100, 400);
  if (playing) {
    fill(#E86817);
    ellipse(ball.x, ball.y, 40, 40);
    if (moving) {
      ball.x+=ball.vx;
      ball.y+=ball.vy;
      ball.vy+=0.98/6;
      println(ball.x, ball.y, ball.vx, ball.vy);
    }
    //ball.moving(true);
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
