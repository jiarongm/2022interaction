//存檔-拉.mp3進來-Ctrl+K看檔案
import processing.sound.*;
SoundFile file1, file2, file3, file4, file5;
void setup() {
  size(500, 500);
  textSize(50);
  file1=new SoundFile(this, "week07_music_data_sword slash.mp3");
  file2=new SoundFile(this, "week07_music_data_Monkey 2.mp3");
  file3=new SoundFile(this, "week07_music_data_Cannon Blast.mp3");
  file1.play();
}
int stage=1;
void draw() {
  background(255);
  if (stage==1) {
    fill(0, 255, 0);
    text("stage1", 100, 100);
  } else if (stage==2) {
    text("stage2", 100, 100);
  }
}
void mousePressed() {
  if (stage==1) {
    stage=2;
    file1.stop();
    file2.play();
  } else if (stage==2) {
    stage=1;
    file2.stop();
    file1.play();
  }
}
void keyPressed() {
  file3.play();
}
