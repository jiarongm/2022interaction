
Fruit []fruits;
void setup() {
  size(400, 300);
  fruits=new Fruit[3];///產生陣列
  for(int i=0;i<3;i++){
    fruits[i]=new Fruit(this);///產生每一個物件: 名稱=new 物件(this)
  }
}
void draw() {
  background(255, 255, 0);///每次都重畫，覆蓋
  for(int i=0;i<3;i++){
    fill(255, 0, 0);
    ellipse(fruits[i].x, fruits[i].y, 40, 40);
    textSize(30);
    textAlign(CENTER,CENTER);//字對齊中間
    fill(0);
    text(fruits[i].c,fruits[i].x,fruits[i].y);
    fruits[i].update();
  }
  
}
void keyPressed() {
  for(int i=0;i<3;i++){
    if(keyCode==fruits[i].c){
      fruits[i].reset();
    }
  }
  
}
