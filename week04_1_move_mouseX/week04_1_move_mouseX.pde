void setup(){
  size(500,500);
}
float x=250,y=250;
float vx=2.0,vy=-1.5;

void draw(){
  int boardX=mouseX;
  background(255,255,255);
  ellipse(x,y,10,10);
  fill(#432F2F);
  rect(boardX,475,100,20,10);
  x=x+vx;
  y=y+vy;
  if(x>500)vx=-vx;
  if(y<0)vy*=-1;
  if(x<0)vx*=-1;
  if(y>470&& x>boardX &&x<boardX+100 )vy*=-1;
}
