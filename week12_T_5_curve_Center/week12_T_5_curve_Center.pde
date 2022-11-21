ArrayList<Curve> curves;
Curve curve;
void setup(){
  size(500,600);
  curves = new ArrayList<Curve>();
}
void draw(){
  background(#FFFFF2);
  for( Curve c : curves ){
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
  curve.finish();
}

class Curve{
  boolean drawing=false;
  PVector center;
  ArrayList<PVector> pts;
  Curve(){
    pts = new ArrayList<PVector>();
    drawing=true;
    center = new PVector();
  }
  void draw(){
    if(drawing) stroke(255,0,0);
    else stroke(0);
    for(int i=0; i<pts.size()-1; i++){
      line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);
    }
    if(!drawing){
      ellipse(center.x, center.y, 5,5);
    }
  }
  void addPoint(float x, float y){
    PVector pt = new PVector(x,y);
    pts.add(pt);
  }
  void finish(){
    drawing=false;
    for(PVector pt : pts){
      center.add(pt);
    }
    center.div( pts.size() );
  }
  void update(){
    
  }
}
