PGraphics star;
ArrayList<PVector> points;//PVector:向量(座標) 宣告:資料結構 名稱；
void setup() {
  size(500, 600);
  star = createGraphics(20, 20);
  points=new ArrayList<PVector>();//new 創建一個新物件points
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
boolean moving=true;

void drawStar() {
  star.beginDraw();
  star.background(#FCE454);
  star.endDraw();
}
float starX1=77, starY1=180;
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
  drawStar();
  image(star, starX1, starY1);
  image(star, 77, 180);

  for (int i=0; i<points.size()-1; i++) {
    PVector pt=points.get(i);
    PVector pt2=points.get(i+1);
    
    if ( (ballx-starX1)*(starY1-bally)<4 &&(ballx-starX1)*(starY1-bally)>-4 ) {
      star.beginDraw();
      star.clear();
      star.endDraw();

      score+=1;
      //print("\n");
      //print(score);
    }

    if (moving) {
      slopeX=pt2.x-pt.x;
      slopeY=pt2.y-pt.y;
      slope=sqrt(slopeX*slopeX+slopeY*slopeY);//斜率
      if (slopeX>0 && slopeY>0)slope=-slope;//右下: \
      if ( (pt.x-ballx)>-10 &&(pt.x-ballx)<10 && (pt.y-bally)>20 &&(pt.y-bally)<22 ) {
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
  if (keyCode==DOWN)dy++;
}
