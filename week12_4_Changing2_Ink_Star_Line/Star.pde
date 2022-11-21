void star_setting() {
  star1 = createGraphics(20, 20);
  star2 = createGraphics(20, 20);
  star3 = createGraphics(20, 20);
  points=new ArrayList<PVector>();//new 創建一個新物件points
  drawStar(1);
  drawStar(2);
  drawStar(3);
}
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
    //image(star3, starX, starY);
  }
}
void star_beg_clear_end(int x, int starX, int starY, float ballx, float bally) {
  if (x==1)image(star1, starX, starY);
  if (x==2)image(star2, starX, starY);
  if (x==3)image(star3, starX, starY);
  if ( ballx<(starX+25)  &&  bally<(starY+20)  &&  ballx>=starX  &&  bally>=starY) {
    if (x==1) {
      star1.beginDraw();
      star1.clear();
      star1.endDraw();
    }
    if (x==2) {
      star2.beginDraw();
      star2.clear();
      star2.endDraw();
    }
    if (x==3) {
      star2.beginDraw();
      star2.clear();
      star2.endDraw();
    }
    score+=1;
    starX=-100;
    starY=-100;
  }
}
