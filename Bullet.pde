class Bullet extends GameObject
{
  float speed;
  PVector forward;
  
  void render()
  {
    c = 255;
    stroke(c);
    pushMatrix();
    translate(pos.x, pos.y);
    line(0, -5, 0, 5);
    popMatrix();    
    speed = - 5.0f;
  }
  
  void update()
  {
    //forward = new PVector(sin(speed
    pos.y += speed;
    if(pos.y > height)
    {
      pos.y = 0;
    }
  }
  
}
