class Brick extends GameObject
{
  float left;
  float top;
  float h;
  float halfH;
  float halfW;
  int lives;

  
  Brick(float x, float y, float w, float h)
  {
    super((x + (w * 0.5f)), (y + (h * 0.5f)), w);
    this.h = h;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    this.left = x;
    this.top = y;
    this.lives = int(random(1, 3));
  }
  
  void render()
  {
    if(lives == 2)
    {
      c = color(255, 0, 0);
    }
    else
    {
      c = color(255);
    }
    
    fill(c);
    rect(left, top, w, h);
  }

}
