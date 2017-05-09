PImage img;
float brickRed = (200);
float brickGreen = 0;
float brickBlue = 0;

class Brick {
  int x, y, h, w;
  boolean hit;
  boolean gone;
  
  Brick() {
    img = loadImage("Brick.png");
    x = 20;
    y = 20;
    h = 80;
    w = 80;
    hit = false;
    gone = false;
  }
  
  Brick(int t, int v, int g, int e) {
    x = t;
    y = v;
    h = g;
    w = e;
    img = loadImage("Brick.png");
    hit = false;
  }
  
  void drawBrick() {
    fill(brickRed, brickGreen, brickBlue);
    strokeWeight(5);
    stroke(227, 207, 165);
    if (gone == false) {
      rect(x, y, w, h);
      image(img, x, y);
    }
  }
  
  boolean hitTopOrBottom(int ballX, int ballY, int diameter) {
    hit = false;
    if (gone == false) {
      if ((ballX - (diameter/2) > x && ballX - (diameter/2) <x+w) || 
        (ballX + (diameter/2) > x && ballX + (diameter/2) <x+w)) {
        if ((ballY + (diameter/2)>=y && ballY + (diameter/2) <= y + h)|| 
          (ballY -(diameter/2) <=y+h &&ballY -(diameter/2) >=y)) {
          hit = true;
          gone = true;
        }
      }
    }
    
    return hit;
    
  }
  boolean hitSide(int ballX, int ballY, int diameter) {
    hit= false;
    if (gone == false) {
      if ((ballY - (diameter/2) > y && ballY - (diameter/2) <y+h) || 
        (ballY + (diameter/2) > y && ballY + (diameter/2) <y+h)) {
        if ((ballX +(diameter/2) >x && ballX +(diameter/2) <x+w)||
          (ballX -(diameter/2) < x+w && ballX -(diameter/2) >x)) {
          hit = true;
          gone = true;
        }
      }
    }
    return hit;
  }
}