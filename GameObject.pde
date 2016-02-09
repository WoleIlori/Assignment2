abstract class GameObject
{
  PVector pos;
  float w;
  color c;
  
  GameObject()
  {
    // Constructor chaining
    this(width * 0.5f, height  * 0.5f, 50);     
  }
  
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
