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
