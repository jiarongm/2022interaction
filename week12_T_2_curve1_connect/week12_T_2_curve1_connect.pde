ArrayList<Curve> curves;
Curve curve;
void setup(){
  size(500,600);
  curves = new ArrayList<Curve>();
  curve = new Curve();
}
void draw(){
  background(#FFFFF2);
  curve.draw();
}
void mouseDragged(){
  curve.addPoint( mouseX, mouseY );
}

class Curve{
  ArrayList<PVector> pts;
  Curve(){
    pts = new ArrayList<PVector>();
  }
  void draw(){
    for(int i=0; i<pts.size()-1; i++){
      line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);
    }
  }
  void addPoint(float x, float y){
    PVector pt = new PVector(x,y);
    pts.add(pt);
  }
}
