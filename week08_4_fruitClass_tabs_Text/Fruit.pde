String line="ABCDEFGHIJKLMNOPQRSTUVWXYZ";

class Fruit {///目標:class物件>>每個水果都可以用物件生出來(值、函示)
  float x, y, vx=2, vy=-13;
  boolean flying=true;
  char c;///水果對應的字母
  
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
    int i=int(random(26));
    c=line.charAt(i);
  }
}
