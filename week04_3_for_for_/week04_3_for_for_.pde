void setup(){
  size(500,500);
}
void draw(){
  for(int x=50;x<=450;x+=50)
    for(int y=50;y<=450;y+=50){
      ellipse(x,y,50,50);
    }
}
