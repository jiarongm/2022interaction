Line [] lines;
PGraphics star1, star2, star3;
ArrayList<PVector> points;//PVector:向量(座標) 宣告:資料結構 名稱；
void setup() {
  lines=new Line[1];
  size(500, 600);
  star1 = createGraphics(20, 20);
  star2 = createGraphics(20, 20);
  star3 = createGraphics(20, 20);
  points=new ArrayList<PVector>();//new 創建一個新物件points
  drawStar(1);
  drawStar(2);
  drawStar(3);
}
lines[0].drawLine();
float ballx=40, bally=40;//球的設定
float ball_before_x=ballx, ball_before_y=bally;//球的位置，計算速度用
float ball_H=0, ball_V=0, ball_U;//球的高度 速率 位能
float ballvx=1, ballvy=-1;

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
  lines.Line_Ball(moving,40.0,40.0,1,-1,0,0,0,40,40);
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
