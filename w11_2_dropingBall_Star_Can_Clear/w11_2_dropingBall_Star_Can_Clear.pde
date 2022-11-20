PGraphics star1,star2,star3;
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
    //line(mouseX, mouseY, pmouseX, pmouseY);
    //print(".");
  }
  pushMatrix();//備份母體(紀錄每個點的相對位置)
  translate(dx, dy);//再移動
  for (int i=0; i<points.size()-1; i++) {//在points的範圍裡
    PVector pt=points.get(i);///向量pt=第i個points(把每個座標秀出來)
    PVector pt2=points.get(i+1);
    line(pt.x, pt.y, pt2.x, pt2.y);
    fill(0, 0, 0);
    ellipse(pt.x, pt.y, 5, 5);///這樣就能捕捉每個整數座標並使用了!!
  }
  popMatrix();//恢復每個點的相對位置
}
float ballx=40, bally=40;//球的設定
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
int starX2=128,starY2=249;
int score=0;
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
    print("\n");
    print("score= "+score);
    print("\n");
  }
  for (int i=0; i<points.size()-1; i++) {
    PVector pt=points.get(i);
    PVector pt2=points.get(i+1);
    if (moving) {
      slopeX=pt2.x-pt.x;
      slopeY=pt2.y-pt.y;
      slope=sqrt(slopeX*slopeX+slopeY*slopeY);//斜率
      if (slopeX>0 && slopeY>0)slope=-slope;//右下: \
      if ( (pt.x-ballx)>-20 &&(pt.x-ballx)<20 && (pt.y-bally)>20 &&(pt.y-bally)<22 ) {
        ballvx=0;
        ballvy=0;
        print(pt.x, pt.y);
        print("\n");
        print( i);
        moving=false;
      }
    }
  }
}
float dx=0, dy=0;
void keyPressed() {
  if (keyCode==RIGHT)dx++;
  if (keyCode==LEFT)dx--;
  if (keyCode==UP)dy--;
  if (keyCode==DOWN)moving=true;
}
