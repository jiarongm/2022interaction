class Curve{
  boolean drawing=false;
  PVector center;
  float angle=0;
  ArrayList<PVector> pts;
  
  Curve(){
    pts = new ArrayList<PVector>();
    drawing=true;
    center = new PVector();
  }
  void draw(){
    if(drawing) stroke(255,0,0);
    else {
      stroke(0);
      angle+=0.01;
    }
    pushMatrix();
      translate(center.x, center.y);
      rotate(angle);
      translate(-center.x, -center.y);
      for(int i=0; i<pts.size()-1; i++){
        line(pts.get(i).x, pts.get(i).y, pts.get(i+1).x, pts.get(i+1).y);
      }      
    popMatrix();
    if(!drawing){
      ellipse(center.x, center.y, 5,5);
    }
  }
  boolean testUnique(float x, float y){
    if(pts.size()==0) return true;
    PVector last = pts.get(pts.size()-1);
    if( x != last.x || y != last.y ) return true;
    else return false;
  }
  void addPoint(float x, float y){
    if(testUnique(x,y)){
      PVector pt = new PVector(x,y);
      pts.add(pt);      
    }
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
