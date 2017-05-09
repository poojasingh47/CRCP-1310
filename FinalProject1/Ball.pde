class Ball {
  int x;
  int y;
  int diameter;
  int xSpeed;
  int ySpeed;
  
  
  Ball() {
    x = 300;
    y = 300;
    diameter = 22;
    xSpeed = 3;
    ySpeed = 4;
  }
  
  
  void drawBall() {
    fill(0);
    stroke(1);
    ellipse(x, y, diameter, diameter);
    //control ball parameters
    x = x + xSpeed;
    y = y + ySpeed;

    if (x + (diameter / 2) > width || x - (diameter / 2) < 0)
      xSpeed = -xSpeed;

    if (y - (diameter / 2) <0)
      changeY();
  }
  
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  int getDiameter() {
    return diameter;
  }

  int getXSpeed() {
    return xSpeed;
  }
  
  
  void setXSpeed(int s) {
    xSpeed = s;
  }
  
  void changeX() {
    xSpeed = -xSpeed;
  }
  
  void changeY() { 
    ySpeed = -ySpeed;
  }
}