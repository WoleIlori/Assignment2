class Brick extends GameObject
{
  float left;
  float top;
  float w;
  float h;
  float halfH;
  float halfW;
  int lives;
  
  Brick(float x, float y)
  {
    w = 100.0f;
    h = 26;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    this.left = x;
    this.top = y;
    pos = new PVector(x + halfW, y + halfH);
    tmpX = this.left;
    tmpY = this.top;
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
