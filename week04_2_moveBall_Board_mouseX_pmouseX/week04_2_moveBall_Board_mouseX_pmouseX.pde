void setup(){
  size(500,500);
}
float x=250,y=250;
float vx=2.0,vy=-1.5;

void draw(){
  int boardX=mouseX,boardY=475,boardW=100,boardH=20;
  background(255,255,255);
  ellipse(x,y,10,10);
  fill(#432F2F);
  rect(boardX,475,boardW,boardH,10);
  x=x+vx;
  y=y+vy;
  if(x>500)vx=-vx;
  if(y<0)vy*=-1;
  if(x<0)vx*=-1;
  if(  (y>boardY &&y<boardY+boardH) && (x>boardX && x<boardX+boardW)   ){
    vy*=-1;
    vx+=(mouseX-pmouseX)/2;
  }
  if(mousePressed&&mouseButton==LEFT)boardW*=1.001;
  if(mousePressed&&mouseButton==RIGHT)boardW*=0.99;
  
}
