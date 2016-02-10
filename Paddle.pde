class Paddle extends GameObject
{
  float h;
  float left;
  float top;
  float halfH;
  float halfW;
  float tmpX, tmpY;
  char fire;
  int ammo;
  
  
  Paddle(float w, float h, float x, float y, char fire)
  {
    super(x, y, w);
    this.h = h;
    this.fire = fire;
    tmpX = pos.x;
    tmpY = pos.y;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    c = 255;
    ammo = 20;
  }
  
  int elapsed = 12;
  
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
