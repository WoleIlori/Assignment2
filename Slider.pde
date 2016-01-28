class Slider extends GameObject
{
  float w;
  float h;
  float left;
  float top;
  float halfH;
  float halfW;
  
  Slider()
  {
    this(width * 0.3f, height * 0.02f, width * 0.5f, height - 20.0f);
  }
  
  Slider(float w, float h, float x, float y)
  {
    this.w = w;
    this.h = h;
    pos = new PVector(x, y);
    tmpX = pos.x;
    tmpY = pos.y;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
  }
  
  void render()
  {
    left = pos.x - (w * 0.5f);
    top = pos.y - (h * 0.5f);
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
