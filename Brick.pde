class Brick
{
  float w;
  float h;
  PVector pos;
  float halfH;
  float halfW;
  int lives;
  float tmpX;
  float tmpY;
  
  Brick(float x, float y)
  {
    w = 100.0f;
    h = 26;
    halfW = w * 0.5f;
    halfH = h * 0.5f;
    pos = new PVector(x + halfW, y + halfH);
    tmpX = x;
    tmpY = y;
    this.lives = 1;

  }
  
  void render()
  {
    rect(tmpX, tmpY, w, h);
  }
}
