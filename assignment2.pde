void setup()
{
 size(500, 500);
 slide = new Slider();
 ball = new Ball(20.0f, 20.0f * 0.5f, 250.0f, 480.0f, 10.0f, 0.0f, -5.0f);
 rows = 3;
 cols = 5;
 dir = 0;
 rebound = 0;
 mCheck = false;
 bCheck = 0;
 brickW = 100;
 brickH = 25;
 font = loadFont("AgencyFB-Reg-48.vlw");
}

ArrayList<Brick> bricks = new ArrayList<Brick>();
Ball ball;
Slider slide;
boolean[] keys = new boolean[512];
int mode;
float dir;
boolean mCheck;
PFont font;
int bCheck;
int rows;
int cols;
int brickW;
int brickH;
float rebound;

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  keys[keyCode] = true;
}


void draw()
{
  switch(mode)
  {
    case 0:
    {
      background(0);
      textFont(font, 32);
      text("1. Play Game", 100, 50);
      text("2. Instructions", 100, 100);
      text("3. High Scores", 100, 150);
      ball.lives = 3;
      break;
    }
    
    case 1:
    {
      background(0);
      stroke(255);
      line(0, 30, width, 30);
      textFont(font, 18);
      text("Lives: " +ball.lives, 40, 20);
      stroke(0);
      drawBricks();
      slide.render();
      slide.update();
      ball.render();
      ball.update();
      
      collisionCheck();
      
      break;
    }
    
  }//end switch
}

void drawBricks()
{
  //drawing the bricks
  for(int row = 0; row < rows; row ++)
  {
    for(int col = 0; col < cols; col ++)
    {
      float x = col * brickW;
      float y = 50.0f + (row * brickH);
      Brick b = new Brick(x, y);
      b.render();
      bricks.add(b);
     }//end inner for
  }
}

void collisionCheck()
{
  //ball hitting the slider
   if((ball.pos.y + ball.bRadius) > slide.top)
   {
     if(ball.pos.x > slide.left  && ball.pos.x < (slide.pos.x + slide.halfW))
     {
       dir = ball.pos.x - slide.pos.x;
       if(dir < 0)
       {
         ball.speed.x = dir / 10;
       }
       else
       {
         ball.speed.x = dir / 10;
       }
       ball.speed.y = - ball.speed.y;
     }
   }
}

void mouseMoved()
{
  if(mCheck == true)
  {
    slide.pos.x = mouseX;
  }
 
}
