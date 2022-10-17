//存檔-拉.mp3進來-Ctrl+K看檔案
import processing.sound.*;
SoundFile file1, file2, file3, file4, file5;
void setup(){
  file1=new SoundFile(this,"sword slash.mp3");
  file2=new SoundFile(this,"sword slash.mp3");
  file3=new SoundFile(this,"sword slash.mp3");
  
}
void draw(){

}
void mousePressed(){
  
  file1.play();
  file2.play();
}
void keyPressed(){
  file3.play();
}
