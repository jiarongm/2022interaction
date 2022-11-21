ArrayList<Curve> curves;
Curve curve;
void setup(){
  size(500,600);
  curves = new ArrayList<Curve>();
}
void draw(){
  background(#FFFFF2);
  for( Curve c : curves ){
    if(c.drawing) stroke(255,0,0);
    else stroke(0);
    c.draw();
  }
}
void mousePressed(){
  curve = new Curve();
  curves.add(curve);
}
void mouseDragged(){
  curve.addPoint( mouseX, mouseY );
  println(curves.size(), "--", curve.pts.size() );
}
void mouseReleased(){
  curve.drawing=false;
}

class Curve{
  boolean drawing=false;
  ArrayList<PVector> pts;
  Curve(){
    pts = new ArrayList<PVector>();
    drawing=true;
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
  void update(){
    
  }
}
