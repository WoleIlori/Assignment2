void setup()
{
 size(500, 500); //size(800, 500);
 paddle = new Paddle(width * 0.2f, height * 0.02f, width * 0.5f, height - 20.0f);
 gameObjects.add(paddle);
 ball = new Ball(20.0f, 250.0f, 480.0f, 10.0f, 0.0f, -5.0f);
 gameObjects.add(ball);
 image = loadImage("brickout300.jpg");
 rows = 3;
 cols = 5;
 dir = 0;
 brickW = 80.0f;
 brickH = 25.0f;
 hScore = 0;
 move = false;
 reset = false;
 mCheck = false;
 pic = false;
 level = 1;
 font = loadFont("AgencyFB-Reg-48.vlw");
 drawBricks();
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
ArrayList<Brick> bricks = new ArrayList<Brick>();
PImage image;
Ball[] lifeBalls;
Ball ball;
Paddle paddle;
boolean[] keys = new boolean[512];
boolean reset;
int mode;
float dir;
boolean mCheck;
int rows;
int cols;
float brickW;
float brickH;
int hScore;
int level;
boolean move;
boolean pic;
PFont font;

void mousePressed()
{
  if(!pic)
  {
    pic = true;
  }
}

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
    keys[keyCode] = true;
  }
  
  
  if(mode == 0 || mode == 2)
  {
    keys[keyCode] = false;
  }
  else
  {
    keys[keyCode] = true;
  }
  

}


void draw()
{
  if(pic)
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
        break;
      }
      
      case 1:
      {
        if(reset)
        {
          if(ball.lives == 0)
          {
             level --;
             ball.lives = 3;
             hScore = 0;
          }
          drawBricks();
          drawPaddle();
          drawBall();
          reset = ! reset;
        }
        background(0);
        displayStatus();
        stroke(0);
        checkLives();
        
        for(int i = 0; i < bricks.size(); i++)
        {
          bricks.get(i).render();
        }
       
        for(int i = 0; i < gameObjects.size(); i++)
        {
          GameObject go = gameObjects.get(i);
          go.update();
          go.render();
        }
        
        ballCollisions();
        break;
      }
      
      case 2:
      {
        background(0);
        textFont(font, 28);
        text("Press 'Space' bar to launch ball.\nUse the mouse to move the paddle\nand collect powerups", 100, 200);
        break;
      }
    }
  }
  else
  {
    image(image, 0, 0, width, height);
    textFont(font, 28);
    text("Click to continue", 150, 200);
  }
    
}//end draw

void drawBricks()
{
  if(level == 1)
  {
    brickW = 80.0f;
    for(int row = 0; row < rows; row ++)
    {
      for(int col = 0; col < cols; col ++)
      {
        float x = 40.0f + (col * brickW);
        float y = 80.0f + (row * brickH);
        Brick b = new Brick(x, y, brickW, brickH);
        bricks.add(b);
       }//end inner for
    }
  }
  
  if(level == 2)
  {
    brickW = 100.0f;
    //drawing the bricks
    for(int row = 0; row < rows; row ++)
    {
      for(int col = 0; col < cols; col ++)
      {
        float x = col * brickW;
        float y = 80.0f + (row * brickH);
        Brick b = new Brick(x, y, brickW, brickH);
        bricks.add(b);
       }//end inner for
    }
  }
  
  if(level == 3)
  {
    brickW = 100.0f;
    for(int row = 0; row < rows; row ++)
    {
      for(int col = 0; col < cols; col ++)
      {
        float x = (col * brickW);
        float y = (40.0f * (row + 1)) + (row * brickH);
        Brick b2 = new Brick(x, y, brickW, brickH);
        bricks.add(b2);
      }
    }
  }
        
}

void drawPaddle()
{
   paddle = new Paddle(width * 0.2f, height * 0.02f, width * 0.5f, height - 20.0f);
   gameObjects.add(paddle);
}

void drawBall()
{
   ball = new Ball(20.0f, 250.0f, 480.0f, 10.0f, 0.0f, -5.0f);
   gameObjects.add(ball);
}

void ballCollisions()
{
  //ball hitting the paddle
   if((ball.pos.y + ball.bRadius) > paddle.top)
   {
     if(ball.pos.x > paddle.left  && ball.pos.x < (paddle.pos.x + paddle.halfW))
     {
       dir = ball.pos.x - paddle.pos.x;
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
       ball.speed.x = 5.0f;
       ball.speed.x = - ball.speed.x;
       bricks.get(i).lives --;
     }
     
     //ball hits the right side of the brick
     if((ball.pos.x - ball.bRadius) < (bricks.get(i).left + bricks.get(i).w) && (ball.pos.x - ball.bRadius) > bricks.get(i).pos.x && ball.pos.y > bricks.get(i).top && ball.pos.y < (bricks.get(i).top + bricks.get(i).h) )
     {
       ball.pos.x = (bricks.get(i).left + bricks.get(i).w) + ball.bRadius;
       ball.speed.x = -5.0f;
       ball.speed.x = - ball.speed.x;
       bricks.get(i).lives --;
       hScore += 50;
     }
   }     
}

void checkLives()
{
  //check if one of the bricks is hit and remove brick
  for(int i = 0; i < bricks.size(); i++)
  {
    if(bricks.get(i).lives == 0)
    {
      bricks.remove(i);
    }
  }
  
  //if the bricks are succesully cleared move on to next level
  if(bricks.size() == 0 && ball.lives > 0)
  {  
    removeAll();
    level ++;
    if(level == 4)
    {
      mode = 0;
      level = 1;
    }
    reset = ! reset;
    keys[keyCode] = false;
    mCheck = false;
  }
  
  //if bricks are not successfuly cleared it goes back to the previous level
  if(ball.lives == 0)
  {
    removeAll();
    background(0);
    textFont(font, 28);
    text("Hard luck Try again (y/n)", 150, 250);
    text("High Score:" +hScore, 150, 280); 
    if(keyPressed)
    {
      if(key == 'y')
      {
        mode = 1;
      }
      
      if(key == 'n')
      {
        mode = 0;
      }
      reset = true;
    }
  }
 
}

void displayStatus()
{
  lifeBalls =  new Ball[ball.lives];
  stroke(255);
  line(0, 30, width, 30);
  textFont(font, 18);
  text("Level: " + level, 40, 20);
  text("Lives: ", 150 , 20);
  text("Score: "+ hScore, 300, 20);
  
  for(int i = 0; i < lifeBalls.length; i++)
  {
    float ballX = 200 + (i * 20);
    Ball ball = new Ball(ballX, 15, 10);
    ball.render(); 
    lifeBalls[i] = ball;
  }
}
  
void removeAll()
{
  for(int i = bricks.size() - 1; i >= 0; i--)
  {
    bricks.remove(i);
  }
  
  for(int i = gameObjects.size() - 1; i >= 0; i--)
  {
    gameObjects.remove(i);
  }
}

void mouseMoved()
{
  //the paddle can only move when the ball is launched
  if(mCheck == true)
  {
    paddle.pos.x = mouseX;
  }
 
}
