void setup()
{
 size(500, 500);
 slide = new Slider();

 
}

Ball ball ;
Slider slide;
boolean[] keys = new boolean[512];
int mode;


 

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
      line(0, 30, width, 30);
      slide.render();
      slide.update();
      break;
    }
    
  }//end switch
}

void mouseMoved()
{
    slide.pos.x = mouseX;
 
}
