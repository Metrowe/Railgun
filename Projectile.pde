class Projectile
{
  PVector front;
  PVector back;
  PVector velocity;
  
  Projectile(PVector front, PVector velocity)
  {
    this.front = front;
    this.velocity = velocity;
    //back = front;
    //back.sub(PVector.mult(this.velocity, 3));
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(5);
    
    stroke(200,0,200);
    point(front.x, front.y);
    //line(front.x,front.y, back.x,back.y);
  }//end update
  
  
  void update()
  {
    front.add(velocity);//// source but still no clue why
    //back.add(velocity);
  }//end update
  
  
}//end class Projectile