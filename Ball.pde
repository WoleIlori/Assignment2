class Ball extends GameObject
{
  //float bSize;
  float bRadius;
  PVector speed;
  //PVector ballPos;
  int lives;
  float tmpX, tmpY;
  
  Ball(float bSize, float bRadius, float x, float y, float sHeight ,float xSpeed, float ySpeed)
  {
    super(x, (y - (sHeight / 2) - bRadius), bSize);//pos = new PVector(x, (y - (sHeight / 2) - bRadius));
    //this.bSize = bSize;
    this.bRadius = bRadius;
    lives = 3;
    speed = new PVector(xSpeed, ySpeed); 
    tmpX = pos.x;
    tmpY = pos.y;
    c = 255;
  }
  
  Ball(float x, float y, float bSize)
  {
    super(x, y, bSize);
    //pos = new PVector(x , y);
    //this.bSize = bSize;
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
    
    
