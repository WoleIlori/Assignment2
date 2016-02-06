class Paddle extends GameObject
{
  float h;
  float left;
  float top;
  float halfH;
  float halfW;
  float tmpX, tmpY;
  
  Paddle()
  {
    this(width * 0.3f, height * 0.02f, width * 0.5f, height - 20.0f);
  }
  
  Paddle(float w, float h, float x, float y)
  {
    super(x, y, w);
    this.h = h;
    tmpX = pos.x;
    tmpY = pos.y;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    c = 255;
  }
  
  void render()
  {
    fill(c);
    left = pos.x - halfW;
    top = pos.y - halfH;
    rect(left, top, w, h);  
  }
  
  void update()
  {
    if(pos.x + (w * 0.5f) > width)
    {
      pos.x = width - (w * 0.5f);
    } 
      
    if(pos.x - (w * 0.5f) < 0)
    {
      pos.x = w * 0.5f;
    } 
    
    if(mCheck == false)
    {
      pos.x = tmpX;
      pos.y = tmpY;
    }
    
  }
  
}
