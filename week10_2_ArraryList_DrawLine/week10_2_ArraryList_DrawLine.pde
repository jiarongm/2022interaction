//一般畫線
ArrayList<PVector> points;//PVector:向量(座標) 宣告:資料結構 名稱；
void setup() {
  size(500, 500);
  points=new ArrayList<PVector>();//new 創建一個新物件points
}
void draw() {
  background(#FFFFF3);
  if (mousePressed&& (mouseX!=pmouseX||mouseY!=pmouseY)  ) {///按下左鍵畫線
    points.add(new PVector(mouseX, mouseY));//捕捉滑鼠XY座標放到points裡
    line(mouseX, mouseY, pmouseX, pmouseY);
    print(".");
  }
  for (int i=0; i<points.size()-1; i++) {//在points的範圍裡
    PVector pt=points.get(i);///向量pt=第i個points(把每個座標秀出來)
    PVector pt2=points.get(i+1);
    line(pt.x, pt.y, pt2.x, pt2.y);
    ellipse(pt.x, pt.y, 5, 5);///這樣就能捕捉每個整數座標並使用了!!
  }
}
