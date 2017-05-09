PImage img2;
class Paddle {
  int xpaddle; 
  int ypaddle;
  int widthPaddle;
  boolean hit;
  Paddle() {
    img2 = loadImage("wood.png");
    xpaddle = 240;
    ypaddle = 575;
    widthPaddle = 120;
    hit = false;
  }
  void drawPaddle() { 
    stroke(0);
    rect(xpaddle, ypaddle, widthPaddle, 10);
    image(img2, xpaddle, ypaddle);
    // paddle moves right and left with arrow keys
    hit = false;
    if (keyPressed) {
      if (keyCode == RIGHT) {
        xpaddle = xpaddle + 5;
      } 
      if (keyCode == LEFT) {
        xpaddle = xpaddle - 5;
      }
    }
  }
  boolean hitPaddleLeft( int x, int y) {
    if (xpaddle < x && (xpaddle + (widthPaddle /2)) > x && ypaddle - 5 < y && ypaddle >= y) {
      hit = true;
    }
    return hit;
  } 
  boolean hitPaddleRight( int x, int y) {
    if ((xpaddle + (widthPaddle / 2)) < x && (xpaddle + widthPaddle) > x && ypaddle - 5 < y && ypaddle >= y) {
      hit = true;
    }
    return hit;
  }
}