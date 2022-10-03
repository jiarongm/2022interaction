void setup() {
  size(500, 550);
  PFont font=createFont("標楷體",30);
  textFont(font);
  textAlign(CENTER,CENTER);///字體中心由預設(左下)改至正中間
}
int [][]board={
  {4,5,3,2,1,2,3,5,4},
  {0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,6,0},
  {7,0,7,0,1,0,7,0,7},
  {0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0},
  {-7,0,-7,0,-1,0,-7,0,-7},
  {0,-6,0,0,0,0,0,-6,0},
  {0,0,0,0,0,0,0,0,0},
  {-4,-5,-3,-2,-1,-2,-3,-5,-4},
};//1:將 2:士 3:象 4:車 5:馬 6:包 7:卒
String [] name={"將","士","象","車","馬","包","卒"};
String [] name2={"帥","仕","相","俥","馬","炮","兵"};
void draw() {
  background(#E3A13E);///每次畫背景>>>清除殘影
  for (int x=50; x<=450; x+=50) {
    line(x, 50, x, 250);
    line(x, 300, x, 500);
  }
  for (int y=50; y<=500; y+=50) {
    line(50, y, 450, y);
  }
  for(int i=0;i<10;i++)
    for(int j=0;j<9;j++){
      int id=board[i][j];
      if(id==0)continue;///回去(繼續)
      
      else if(id>0){
        fill(255);
        ellipse(50+j*50,50+i*50,40,40);
        fill(#030000);
        text(name[id-1],50+j*50,50+i*50-3);
      }
      else if(id<0){
        fill(255);
        ellipse(50+j*50,50+i*50,40,40);
        fill(#B40D1B);
        text(name2[-id-1],50+j*50,50+i*50-3);
      }
    }
    if(handChess!=0)ellipse(mouseX,mouseY,40,40);///拿起棋子
}
int handChess=0;
void mousePressed(){
  for(int i=0;i<10;i++)
    for(int j=0;j<9;j++){
      if(  dist(mouseX,mouseY,50+j*50,50+i*50)<20  ){
        handChess=board[i][j];///把那個棋子拿在手上
        board[i][j]=0;///棋子被拿起來>>清空
      }
    }
}
void mouseReleased(){
  int i=(mouseY+25-50)/50;///y是50+i*50
  int j=(mouseX+25-50)/50;///x是50+j*50
  board[i][j]=handChess;///手上的棋子放到棋盤上
  handChess=0;///清空手上的棋子
}
