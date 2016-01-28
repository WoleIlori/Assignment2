class Ball
{
  float bSize;
  float bRadius;
  PVector pos;
  PVector speed;
  int lives;
  float tmpX;
  float tmpY;
  color c;
  
  Ball(float bSize, float bRadius, float x, float y, float sHeight ,float xSpeed, float ySpeed)
  {
    pos = new PVector(x, (y - (sHeight / 2) - bRadius));
    this.bSize = bSize;
    this.bRadius = bRadius;
    lives = 3;
    speed = new PVector(xSpeed, ySpeed); 
    tmpX = pos.x;
    tmpY = pos.y;
  }
  
  void render()
  {
    ellipse(pos.x, pos.y, bSize, bSize);
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
    if(pos.y < bRadius)
    {
      pos.y = bRadius;
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
      speed.y = - speed.y;
    }
  }
}
    
    