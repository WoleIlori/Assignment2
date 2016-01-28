void setup()
{
 size(500, 500);
 slide = new Slider();
 ball = new Ball(20.0f, 20.0f * 0.5f, 250.0f, 480.0f, 10.0f, 0.0f, -5.0f);
 dir = 0;
 mCheck = false;
}

Ball ball ;
Slider slide;
boolean[] keys = new boolean[512];
int mode;
float dir;
boolean mCheck;

 

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
      background(255);
      break;
    }
    
    case 1:
    {
      background(0);
      fill(255);
      text("Lives: " +ball.lives, 40, 20);
      slide.render();
      slide.update();
      ball.render();
      ball.update();
      
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
      break;
    }
    
  }//end switch
}

void mouseMoved()
{
  if(mCheck == true)
  {
    slide.pos.x = mouseX;
  }
 
}
