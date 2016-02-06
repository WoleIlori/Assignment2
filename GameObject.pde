abstract class GameObject
{
  PVector pos;
  float w;
  color c;
  
  GameObject(float x, float y, float w)
  {
    pos = new PVector(x, y);
    this.w = w;
  }
  
  abstract void render();
  
  void update()
  {
    
  }
}
