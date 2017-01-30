class Projectile
{
  PVector front;
  PVector back;
  PVector velocity;
  
  Projectile(PVector front, PVector velocity)
  {
    this.front = front;
    this.velocity = velocity;
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(1);
    
    stroke(200,0,200);
    line(front.x,front.y, back.x,back.y);
  }//end update
  
  
  void update()
  {

    //pos.add(PVector.mult(velocity, timeDelta));
    front.add(velocity);
    back.add(velocity);
   
  }//end update
  
  
}//end class Projectile