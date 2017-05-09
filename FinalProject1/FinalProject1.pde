PImage backGround;

int brickX;
int brickY;
boolean hitPaddleRight;
boolean hitPaddleLeft;
boolean hitTop;
boolean hitSide;
String title;

int index;

Brick [] bricks = new Brick[30];
int[] blocksGone = new int[30];
int lastIndex = 0;

Ball b;
Paddle p;

void setup() {
  size(600, 600);
  //set up for brick arrays
  b = new Ball();
  p = new Paddle();
  index = 0;
  hitPaddleRight = false;
  hitPaddleLeft = false;
  hitTop = false;
  hitSide = false;
  //rectMode(CENTER);
  for (int i=0; i <30; i++) {
    brickX = i%6*100+10; 
    brickY = 40*(i/6) + 35;  
    bricks[i] = new Brick(brickX, brickY, 30, 80);
  }
  
  backGround = loadImage("sky.png");
  title = "Brick Breaker";
  
}
void draw() {
  image(backGround, 0, 0);
  textSize(32);
  text(title, 200, 28);
  b.drawBall();
  p.drawPaddle();
  hitPaddleRight = p.hitPaddleRight(b.getX(), b.getY());
  hitPaddleLeft = p.hitPaddleLeft(b.getX(), b.getY());
  
  // Loop through all the potential blocks
  for (int i=0; i<30; i++) {
    bricks[i].drawBrick();
    hitTop = false;
    hitSide = false;
    hitTop = bricks[i].hitTopOrBottom(b.getX(), b.getY(), b.getDiameter());
    hitSide = bricks[i].hitSide(b.getX(), b.getY(), b.getDiameter());
    
    if (hitTop == true) {
      System.out.println("true top");
      b.changeY();
    }
    
    if (hitSide == true) {
      b.changeX();
      System.out.println("true side");
    }
    
  }
  
  if (hitPaddleRight == true || hitPaddleLeft ==true) {
    b.changeY();
  }
  
  if ( hitPaddleRight ==true) {
    b.setXSpeed(2);
    System.out.println("right");
  } else if (hitPaddleLeft ==true) {
    b.setXSpeed(-2);
    System.out.println("left");
  }
  
  
  if (keyCode == ENTER) {
    b.x = 300;
    b.y = 300;
    b.xSpeed = 2;
    b.ySpeed = 3;
    for (int i = 0; i < 30; i++)
      bricks[i].gone = false;
  }
}