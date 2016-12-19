class Engine
{
  int trak;
  PVector pos;
  float speed;
  float accel;
  float next;
  float previous;
  
  Engine()
  {
    trak = 0;
    Track got = greenTrack.get(trak);
    pos = new PVector((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    speed = 0;
    accel = 0;
    previous = next = got.link;
  }//end Engine
  
  void render()
  {
    fill(0,255,255);
    ellipse(pos.x,pos.y,  10,10);
  }//end update
  
  void update()
  {
    if (checkKey('w'))
    {
      accel = 7;      
    }
    if (checkKey('s'))
    {
      accel = -7;      
    }
    speed += accel * timeDelta;
    
    PVector velocity = jump();

    //pos.add(PVector.mult(velocity, timeDelta));
    pos.add(velocity);
    speed *= 0.99;
    accel = 0;
  }//end update
  
  PVector jump()
  {
    float remain = speed;
    PVector velocity = new PVector();
    while(remain > next)
    {
      remain -= next;
      //trak++;
      trak = (trak+1) % greenTrack.size();
      Track got = greenTrack.get(trak);
      previous = next = got.link;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while
    
    while(previous < next)
    {
      remain += next;
      //trak++;
      trak = ((trak-1)+greenTrack.size()) % greenTrack.size();
      Track got = greenTrack.get(trak);
      previous = next = got.link;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while

    
    next -= remain;
    println("Next = " + next);
    int trakplus = (trak+1) % greenTrack.size();
    Track got1 = greenTrack.get(trak);
    Track got2 = greenTrack.get(trakplus);
    float theta = atan2(got1.loc.y - got2.loc.y,  got1.loc.x - got2.loc.x) + TWO_PI*0.75;
    //float theta = atan2(pos.y - ((got.loc.y*grid)+grid/2),   pos.x - ((got.loc.x*grid)+grid/2));// + TWO_PI*0.75;
    //float theta = atan2(pos.y - got.loc.y,   pos.x - got.loc.x) + TWO_PI*0.25;
    //println("Theta = " + degrees(theta));
    //float theta = atan2(got.loc.y - pos.y,   got.loc.x - pos.x)-PI/2;
    PVector direction = new PVector(sin(theta), -cos(theta));
    velocity = PVector.mult(direction, remain);
    
    return velocity;
  }//end jump
}//end class Engine