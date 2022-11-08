//一般畫線
void setup(){
  size(500,500);
}
void draw(){
  if(mousePressed){///按下左鍵畫線
    line(mouseX,mouseY,pmouseX,pmouseY);
    print(".");
  }
}
