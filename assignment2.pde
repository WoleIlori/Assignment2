void setup()
{
 size(500, 500);
 slide = new Slider();
 ball = new Ball(20.0f, 20.0f * 0.5f, 250.0f, 480.0f, 10.0f, 0.0f, -5.0f);
 rows = 3;
 cols = 5;
 //tmp = new Brick[rows * cols];
 dir = 0;
 mCheck = false;
 bCheck = 0;
 brickW = 100;
 brickH = 25;
 level = 1;
 hScore = 0;
 font = loadFont("AgencyFB-Reg-48.vlw");
 drawBricks();
}

ArrayList<Brick> bricks = new ArrayList<Brick>();
Ball[] lifeBalls;
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
int hScore;
int level;

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
      displayStatus();
      stroke(0);
      checkLives();
      for(int i = 0; i < bricks.size(); i++)
      {
        bricks.get(i).render();
      }
      slide.render();
      slide.update();
      ball.render();
      ball.update();
      
      ballCollisions();
      if(ball.lives == 0)
      {
        drawBricks();
      }
      break;
    }
    
    case 2:
    {
      background(0);
      textFont(font, 28);
      text("Press 'Space' bar to launch ball.\nUse the mouse to move the paddle\nand collect powerups", 100, 200);
      break;
    }
    
    case 3:
    {
      background(0);
      textFont(font, 28);
      text("High Score", 200, 150);
      break;
    }
    
  }//end switch
}

void drawBricks()
{
  if(level == 1)
  {
    //drawing the bricks
    for(int row = 0; row < rows; row ++)
    {
      for(int col = 0; col < cols; col ++)
      {
        float x = col * brickW;
        float y = 80.0f + (row * brickH);
        Brick b = new Brick(x, y);
        bricks.add(b);
        println(b.lives);
       }//end inner for
    }
  }
}

void ballCollisions()
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
   
   //ball hitting the brick
   for(int i = 0; i < bricks.size(); i++)
   {
     //ball hits the bottom of the brick
     if((ball.pos.y - ball.bRadius) < (bricks.get(i).top + bricks.get(i).h) && ball.pos.x > bricks.get(i).left && ball.pos.x < (bricks.get(i).left + bricks.get(i).w) && (ball.pos.y - ball.bRadius) > bricks.get(i).pos.y)
     {
       ball.pos.y = (bricks.get(i).top + bricks.get(i).h) + ball.bRadius;
       ball.speed.y = - ball.speed.y;
       bricks.get(i).lives --;
       hScore += 50;
     }
     
     //ball hits the top of the brick
     if((ball.pos.y + ball.bRadius) > (bricks.get(i).top) && ball.pos.x > bricks.get(i).left && ball.pos.x < (bricks.get(i).left + bricks.get(i).w) && (ball.pos.y + ball.bRadius) < bricks.get(i).pos.y)
     {
       ball.pos.y = (bricks.get(i).pos.y - bricks.get(i).halfH) - ball.bRadius;
       ball.speed.y = - ball.speed.y;
       bricks.get(i).lives --;
       hScore += 50;
     }
     
     //ball hits the left side of the brick
     if((ball.pos.x + ball.bRadius) > bricks.get(i).left && (ball.pos.x + ball.bRadius) < bricks.get(i).pos.x && ball.pos.y > bricks.get(i).top && ball.pos.y < (bricks.get(i).top + bricks.get(i).h))
     {
       ball.pos.x = bricks.get(i).left - ball.bRadius;
       ball.speed.x = - ball.speed.x;
       bricks.get(i).lives --;
       hScore += 50;
     }
     
     //ball hits the right side of the brick
     if((ball.pos.x - ball.bRadius) < (bricks.get(i).left + bricks.get(i).w) && (ball.pos.x - ball.bRadius) > bricks.get(i).pos.x && ball.pos.y > bricks.get(i).top && ball.pos.y < (bricks.get(i).top + bricks.get(i).h) )
     {
       ball.pos.x = (bricks.get(i).left + bricks.get(i).w) + ball.bRadius;
       ball.speed.x = - ball.speed.x;
       bricks.get(i).lives --;
       hScore += 50;
     }
     
   }     
}

void checkLives()
{
  for(int i = 0; i < bricks.size(); i++)
  {
    if(bricks.get(i).lives == 0)
    {
      bricks.remove(i);
    }
  }
  
  
  if(bricks.size() == 0)
  {
    level = 2;
  }
  
}

void displayStatus()
{
  lifeBalls =  new Ball[ball.lives];
  stroke(255);
  line(0, 30, width, 30);
  textFont(font, 18);
  text("Level: " + level, 40, 20);
  text("Lives: ", 200 , 20);
  text("Score: "+ hScore, 400, 20);
  
  for(int i = 0; i < lifeBalls.length; i++)
  {
    float ballX = 250 + (i * 20);
    Ball ball = new Ball(ballX, 15, 10);
    ball.render(); 
    lifeBalls[i] = ball;
  }
}
  

void mouseMoved()
{
  if(mCheck == true)
  {
    slide.pos.x = mouseX;
  }
 
}
