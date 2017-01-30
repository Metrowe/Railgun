class Projectile
{
  PVector front;
  PVector back;
  PVector velocity;
  
  Projectile(PVector front, PVector velocity)
  {
    this.front = front;
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(1);
    
    stroke(200,0,200);
    line(x1,y1, x2,y2);
  }//end update
  
  
  void update()
  {
    speed += accel * timeDelta;
    
    println("Speed = " + speed);
    //PVector velocity = jump();

    //pos.add(PVector.mult(velocity, timeDelta));
    pos.add(jump(speed));
    accel = 0;
    speed *= 0.99;
    
    float val = 0.01;
    if(speed > -val && speed < val)
    {
      speed = 0;
    }//end if
  }//end update
  
  
}//end class Projectile