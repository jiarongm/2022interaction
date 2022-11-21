void drawBall_if_moving(float ballx, float bally, boolean moving) {
  ellipse(ballx, bally, 40, 40);
  if (moving) {
    ballx+=ballvx;
    bally+=ballvy;
    ballvy+=0.98/6;///重力G
  }
}
