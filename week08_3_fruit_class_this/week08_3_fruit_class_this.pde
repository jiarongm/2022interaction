class Fruit {///目標:class物件>>每個水果都可以用物件生出來(值、函示)
  float x, y, vx=2, vy=-13;
  boolean flying=true;
  PApplet sketch;///為了讓random可以用
  Fruit(PApplet _sketch) {//建構子:一開始要做的事
    sketch=_sketch;///為了讓random可以用
    reset();
  }
  void update() {
    x+=vx;
    y+=vy;
    vy+=0.98/3;
  }
  void reset() {
    x=sketch.random(100, 300);///為了讓random可以用
    y=300;
    vx=sketch.random(-2, +2);///為了讓random可以用
    vy=-13;
    flying=true;
  }
}
Fruit fruit;
void setup() {
  size(400, 300);
  fruit=new Fruit(this);///產生物件: 名稱=new 物件(this)
}
void draw() {
  background(255, 255, 0);///每次都重畫，覆蓋
  fill(255, 0, 0);
  ellipse(fruit.x, fruit.y, 40, 40);
  fruit.update();
}
void keyPressed() {
  fruit.reset();
}
