ArrayList<Curve> curves;//curves是一個 "放很多Curve的鏈結串列"
PGraphics map;
Curve curve;//宣告curve是一個Curve物件
NoLine zone;
Ball ball;
int points_size=0, score=0, final_score;//點的總數/吃星星的得分/最終分數
boolean playing=false, cleaning=false, moving=false;//控制開始/結束遊戲
float ink_size;//墨水量
void setup() {
  size(500, 600);
  map=createGraphics(500, 600);
  zone=new NoLine();
  ball=new Ball();
  curves=new ArrayList<Curve>();  //new方法 創造curves是一個"放很多Curve的鏈結串列"
}
class Ball {
  int x, y, vx=0, vy=1;
  void setting(int x1, int y1) {
    x=x1;
    y=y1;
  }
  void collision() {
    map.loadPixels();
    if (x>0&&y>0&&x<478&&y<578) {

      color pcolor=map.pixels[i];
      if (vx==1||vy==1) {
        for (int k=0; k<=4; k++) {
          int i=index(x+vx, y-k);
          if (map.pixels[i]==color(0)) {//遇到黑色>>動
            x+=vx;
            y-=k;
            break;
          }
        }
      }
      if (vy==1) {
        int i=index(x, y+1);
        if (map.pixels[i]==color(0))y++;
      }
    }
  }
  int index(int x, int y) {
    return y*map.width+x;
  }
  void draw() {
    strokeWeight(1.5);
    background(#FFFFF2);
    fill (0, 0, 0);
    stroke(#487AF5); //框線顏色
    ellipse(mouseX, mouseY, 12, 12); //劃一個圓，座標(mouseＸ,mouseY)，半徑為12*12
    if (keyPressed) {
      background(#000000);
      image(map, 0, 0);
    }
    if (!playing)text("---Press UP to start the game.---", 100, 400);
    if (playing) {
      stroke(0, 0, 0);
      fill(#E86817);
      ellipse(ball.x, ball.y, 40, 40);
      if (moving) {
        ball.collision();
      } else {
        ball.setting(40, 40);//球的初始位置
      }
      zone.CantDrawZone(100, 200, 250, 322);//設定不可畫的範圍
      zone.CantDrawZone(200, 50, 250, 422);//設定不可畫的範圍
      for (Curve c : curves) {//for-each循環，設置c為第一個curves、第二個、第三個...從頭跑到尾???
        stroke(#0000FF);
        fill(#0000FF);
        c.draw();//畫線//對於每一個線段curve都把他畫出來
      }
    }
    Ink();
  }
  void cleanLines() {
    for (int i=0; i<500*600; i++) {//清除map中的線
      color clean=color(0, 0, 0);
      map.pixels[i]=clean;
    }
    for (int i = curves.size() - 1; i >= 0; i--) {
      if (cleaning) {
        for (int j = curve.pts.size() - 1; j >= 0; j--) {
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
    }
    //if (keyCode==CONTROL)ball.vx=1;
    //if (keyCode==SHIFT)ball.vx=-1;
  }
  void keyReleased() {
    //if(keyCode==CONTROL)ball.vx=0;
    //if(keyCode==SHIFT)ball.vx=0;
  }
