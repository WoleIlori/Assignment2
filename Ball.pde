class Ball
{
  float bSize;
  float bRadius;
  PVector pos;
  PVector speed;
  color c;
  
  Ball(float bSize, float bRadius, float x, float y, float sHeight ,float xSpeed, float ySpeed)
  {
    pos = new PVector(x, (y - (sHeight / 2) - bRadius));
    this.bSize = bSize;
    this.bRadius = bRadius;
    speed = new PVector(xSpeed, ySpeed); 
  }
  
  void render()
  {
    ellipse(pos.x, pos.y, bSize, bSize);
  }
  
  void update()
  {
    if(keys[' '])
    {
      pos.y += speed.y;
    }
    
     //changing directions after hitting the top
    if(pos.y < bRadius)
    {
      pos.y = bRadius;
      speed.y = - speed.y;
    }
  }
}
    
    
