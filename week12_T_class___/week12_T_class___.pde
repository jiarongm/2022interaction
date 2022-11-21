//PImage img;
//PImage [] images = new PImage[10];
PVector pt;
PVector [] pts;
Line line;
void setup(){
  size(200,200);
  pts = new PVector[10];
  for(int i=0; i<10; i++){
    pts[i] = new PVector( random(200), random(200) );
  }
  line = new Line();
}
void draw(){
  
}


class Line{
  float dx=0, dy=0;
  void drawLine(){
    
  }
}
