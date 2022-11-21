void Ink(){
  float ink_size=150-( points.size() )/2;
  textSize(24);
  fill(0, 0, 0);
  text("Ink :", 120, 30);
  if (ink_size>100) {///墨水量大於100時  顏色較深
    fill(#494E50);
    rect(175, 15, ink_size, 12, 3);
  } else if (ink_size>=60&&ink_size<=100) {//////墨水量100-50  顏色較深
    fill(#7F8689);
    rect(175, 15, ink_size, 12, 3);
  } else if (ink_size>0) {//////墨水量>0
    fill(#AFBBBF);
    rect(175, 15, ink_size, 12, 3);
  }
  int final_score=score*10+int(ink_size/10);///初始有15分()墨水
  textSize(24);
  fill(0, 0, 0);
  if (final_score>=0)text("score="+final_score, 400, 27);//吃一顆星星+10分 總分45~0
  else text("score="+score*10, 400, 27);
}
