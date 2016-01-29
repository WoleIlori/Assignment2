class Brick extends GameObject
{
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
    pos = new PVector(x + halfW, y + halfH);
    tmpX = x;
    tmpY = y;
    this.lives = 1;
    c = 255;

  }
  
  void render()
  {
    fill(c);
    rect(tmpX, tmpY, w, h);
  }
}
