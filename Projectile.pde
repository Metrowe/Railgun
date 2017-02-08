class Projectile
{
  PVector front;
  PVector back;
  PVector velocity;
  float damage;
  color c;
  
  Projectile(PVector front, PVector velocity,float damage, color c)
  {
    this.front = front;
    this.velocity = velocity;
    this.damage = damage;
    this.c = c;
    back = new PVector(0,0);
    back.add(front);
    //back = front;
    back.sub(PVector.mult(this.velocity, 2));
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(2);
    
    stroke(c);
    //point(front.x, front.y);
    line(front.x,front.y, back.x,back.y);
  }//end update
  
  
  void update()
  {
    front.add(velocity);//// source but still no clue why
    back.add(velocity);
  }//end update
  
  //boolean hit(ArrayList<Engine> player)
  boolean hit(Engine player)
  {
     if(front.dist(player.pos) <= grid * 0.55)
     {
       testHit = 50;
       player.health -= damage;
       
       return true;
     }
     else
     {
       return false;
     }//end else
  }////end hit
  
  
}//end class Projectile