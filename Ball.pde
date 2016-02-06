class Ball extends GameObject
{
  float bRadius;
  PVector speed;
  int lives;
  float tmpX, tmpY;
  
  Ball(float bSize, float x, float y, float sHeight ,float xSpeed, float ySpeed)
  {
    super(x, (y - (sHeight / 2) - (bSize * 0.5f)), bSize);
    this.bRadius = this.w * 0.5f;
    lives = 3;
    speed = new PVector(xSpeed, ySpeed); 
    tmpX = pos.x;
    tmpY = pos.y;
    c = 255;
  }
  
  Ball(float x, float y, float bSize)
  {
    super(x, y, bSize);
    c = 126;
  }
  
  void render()
  {
    fill(c);
    ellipse(pos.x, pos.y, w, w);
  }
  
  void update()
  {
    if(keys[' '])
    {
      pos.x += speed.x;
      pos.y += speed.y;
      mCheck = true;
    }
    
     //changing directions after hitting the top
    if(pos.y - bRadius < 30)
    {
      pos.y = pos.y + bRadius;
      speed.y = - speed.y;
    }
    
     //changing directions after hitting the right wall
    if((pos.x + bRadius) > width)
    {
      pos.x = width - bRadius;
      speed.x = - speed.x;
    }
    
    //changing directions after hitting the left wall
    if(pos.x < bRadius)
    {
      pos.x = bRadius;
      speed.x = - speed.x;
    }
    
    //reseting the ball when it goes past height of the screen
    if((pos.y + bRadius) > height)
    {
      pos.x = tmpX;
      pos.y = tmpY;
      lives --;
      mCheck = false;
      keys[keyCode] = false;
      speed.x = 0;
      speed.y = - speed.y;
    }
    
    //reset the ball when the bricks are cleared
    if(bricks.size() == 0 && lives > 0)
    {
      pos.x = tmpX;
      pos.y = tmpY;
      mCheck = false;
      lives = 3;
      keys[keyCode] = false;
      speed.x = 0;
      speed.y = - speed.y;
    }
  }
}
    
    
