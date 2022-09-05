void setup(){
  size(500,500);
  background(#CCD0E8);
  stroke(#FF0522);
}
void draw(){
  if(mousePressed){
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}
void keyPressed(){
  if(key=='1')stroke(#FF0522);
  if(key=='2')stroke(#FF7605);
  if(key=='3')stroke(#FFEB05);
  if(key=='4')stroke(#05FF24);
  if(key=='5')stroke(#050BFF);
  if(key=='6')stroke(#CF75D6);
  if(key=='7')stroke(#740ACB);
}
