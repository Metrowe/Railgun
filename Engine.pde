class Engine
{
  int trak;
  PVector pos;
  
  float size;
  
  float speed;
  float accel;
  float next;
  float previous;
  float theta;
  float thetav;
  ArrayList<Track> railway;
  
  Engine(ArrayList<Track> line)
  {
    trak = 0;
    railway = line;
    Track got = railway.get(trak);
    pos = new PVector((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    speed = 0;
    accel = 0;
    next = got.link;
    previous = 0;
    thetav = theta = 0;
    //previous = next = got.link;
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(1);
    
    stroke(255,0,0);
    ellipse(pos.x,pos.y,  grid*1.1,grid*1.1);
    
    stroke(0,0,255);
    
    //thetav = lerp(thetav, theta, 10);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(thetav);
    rect(-grid/2,-grid/2, grid,grid);
    //rect(0,0, grid,grid);
    
    
    popMatrix();
    
    
    //////////////////////
    pushMatrix();
    
    translate(300,300);
    rotate(thetav);
    
    noStroke();
    fill(0,255,0);
    rect(0,0,30,10);
    popMatrix();
    ////////////////////
    
    
    Track got = railway.get(trak);
    println("Theta = " + (degrees(got.theta)%360));
    
  }//end update
  
  
  void update()
  {
    if (checkKey('w'))
    {
      accel = 7;      
    }//end if
    else if (checkKey('s'))
    {
      accel = -7;      
    }//end else if
    
    /*
    if (checkKey('a'))
    {
      PVector shotSpeed = new PVector();
      shotSpeed.x = sin(theta - TWO_PI/4) * 1;
      shotSpeed.y = -cos(theta - TWO_PI/4) * 1;
      //newProjectile(pos.x,pos.y, shotSpeed);
      newProjectile(pos, shotSpeed);
    }//end if
    else if (checkKey('d'))
    {
      PVector shotSpeed = new PVector();
      shotSpeed.x = sin(theta + TWO_PI/4) * 5;
      shotSpeed.y = -cos(theta + TWO_PI/4) * 5;
      

      //newProjectile(bugCheck, shotSpeed);     
      //newProjectile(pos.x,pos.y, shotSpeed);
      newProjectile(pos, shotSpeed);     
    }//end else if
    */
    
    if (checkKey('a'))
    {
      PVector shotSpeed = new PVector();
      shotSpeed.x = sin(thetav - TWO_PI/4) * 1;
      shotSpeed.y = -cos(thetav - TWO_PI/4) * 1;
      //newProjectile(pos.x,pos.y, shotSpeed);
      newProjectile(pos, shotSpeed);
    }//end if
    else if (checkKey('d'))
    {
      PVector shotSpeed = new PVector();
      shotSpeed.x = sin(thetav + TWO_PI/4) * 5;
      shotSpeed.y = -cos(thetav + TWO_PI/4) * 5;
      

      //newProjectile(bugCheck, shotSpeed);     
      //newProjectile(pos.x,pos.y, shotSpeed);
      newProjectile(pos, shotSpeed);     
    }//end else if
    
    
    
    speed += accel * timeDelta;
    
    //println("Speed = " + speed);
    //PVector velocity = jump();

    //pos.add(PVector.mult(velocity, timeDelta));
    pos.add(jump(speed));
    
    if(next < 20)
    {
      Track got1 = railway.get(trak);
      Track got2 = railway.get((trak+1) % railway.size());
      //(trak+1) % railway.size()
      thetav = map(next,20,0, got1.theta, (got1.theta+got2.theta)/2 );
      //thetav = map(next,20,0, theta, thetav);
    }//end if
    else if(previous < 20)
    {
      Track got1 = railway.get(((trak-1)+railway.size()) % railway.size());
      Track got2 = railway.get(trak);
      //(trak+1) % railway.size()
      thetav = map(previous,0,20, (got1.theta+got2.theta)/2, got2.theta);
      //thetav = map(next,20,0, theta, thetav);
      //((trak-1)+railway.size()) % railway.size()
    }//end if
    else
    {
      Track got = railway.get(trak);
      thetav = got.theta;
    }//end else
    
    //thetav = lerp(thetav,theta, 10);
    //thetav = theta;
    //println(thetav);
    //println(theta);
    
    
    
    
    
    accel = 0;
    speed *= 0.99;
    
    float val = 0.01;
    if(speed > -val && speed < val)
    {
      speed = 0;
    }//end if
  }//end update
  /*
  void update()
  {
    if (checkKey('w'))
    {
      accel = 8;      
    }
    if (checkKey('s'))
    {
      accel = -8;      
    }
    speed = accel;
    
    //PVector velocity = jump(speed);

    //pos.add(PVector.mult(velocity, timeDelta));
    //pos.add(velocity);
    pos.add(jump(speed));
    speed *= 0.99;
    accel = 0;
  }//end update
  */
  
  PVector jump(float remain)
  {
    //println("speed = " + speed);
    //println("remai = " + remain);
    
    PVector vel = new PVector();
    
    while(remain > next)
    //while(accel == 2345678)
    {
      //println("next loop");
      //remain -= next;
      
      //println( (remain-next) + " = " + remain  + " - " + next );
      remain -= next;
      //trak++;
      trak = (trak+1) % railway.size();
      Track got = railway.get(trak);
      //previous = next = got.link;
      next = got.link;
      previous = 0;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while
    //println("remai = " + remain);
    //println("break");
    
    //while(previous < next)
    //while(remain < previous)
    while( (previous + remain) < 0)
    {
      //println("trak = " + trak);
      //println("previous loop");
      //println( (remain+previous) + " = " + remain  + " + " + previous );
      //remain += previous;
      remain = remain +previous;
      //trak++;
      Track got = railway.get(trak);
      
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
      
      
      
      
      trak = ((trak-1)+railway.size()) % railway.size();
      got = railway.get(trak);
      //previous = next = got.link;
      previous = got.link;
      next = 0;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      //pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
      //println("trak = " + trak);
    }//end while
  
  
  
  //println("remai = " + remain);
  
  /*
  remain
  trak
  got
  previous
  next
  pos is set
  */
    
    next -= remain;
    previous += remain;

    //println("Next = " + next);
    //println("Prev = " + previous);
    
    int trakplus = (trak+1) % railway.size();
    Track got1 = railway.get(trak);
    Track got2 = railway.get(trakplus);
    theta = atan2(got1.loc.y - got2.loc.y,  got1.loc.x - got2.loc.x) + TWO_PI*0.75;
    PVector direction = new PVector(sin(theta), -cos(theta));
    vel = PVector.mult(direction, remain);
    
    //float theta = atan2(pos.y - ((got.loc.y*grid)+grid/2),   pos.x - ((got.loc.x*grid)+grid/2));// + TWO_PI*0.75;
    //float theta = atan2(pos.y - got.loc.y,   pos.x - got.loc.x) + TWO_PI*0.25;
    //println("Theta = " + degrees(theta));
    //float theta = atan2(got.loc.y - pos.y,   got.loc.x - pos.x)-PI/2;
    
    return vel;
  }//end jump
}//end class Engine
/*
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
    next = got.link;
    previous = 0;
    //previous = next = got.link;
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
    
    //PVector velocity = jump(speed);

    //pos.add(PVector.mult(velocity, timeDelta));
    //pos.add(velocity);
    pos.add(jump(speed));
    speed *= 0.99;
    accel = 0;
  }//end update
  
  PVector jump(float remain)
  {
    //println("speed = " + speed);
    //println("remai = " + remain);
    
    PVector velocity = new PVector();
    while(remain > next)
    {
      //println("next loop");
      //remain -= next;
      
      //println( (remain-next) + " = " + remain  + " - " + next );
      remain -= next;
      //trak++;
      trak = (trak+1) % greenTrack.size();
      Track got = greenTrack.get(trak);
      //previous = next = got.link;
      next = got.link;
      previous = 0;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while
    println("remai = " + remain);
    //println("break");
    
    //while(previous < next)
    while(remain < previous)
    {
      //println("previous loop");
      //println( (remain+previous) + " = " + remain  + " + " + previous );
      //remain += previous;
      remain = remain +previous;
      //trak++;
      trak = ((trak-1)+greenTrack.size()) % greenTrack.size();
      Track got = greenTrack.get(trak);
      //previous = next = got.link;
      previous = got.link;
      next = 0;
      //pos.set((got.loc.x*grid)+xg/2,(got.loc.y*grid)+yg/2);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while
  println("remai = " + remain);

    
    next -= remain;
    previous += remain;

    //println("Next = " + next);
    //println("Prev = " + previous);
    
    int trakplus = (trak+1) % greenTrack.size();
    Track got1 = greenTrack.get(trak);
    Track got2 = greenTrack.get(trakplus);
    float theta = atan2(got1.loc.y - got2.loc.y,  got1.loc.x - got2.loc.x) + TWO_PI*0.75;
    PVector direction = new PVector(sin(theta), -cos(theta));
    velocity = PVector.mult(direction, remain);
    
    //float theta = atan2(pos.y - ((got.loc.y*grid)+grid/2),   pos.x - ((got.loc.x*grid)+grid/2));// + TWO_PI*0.75;
    //float theta = atan2(pos.y - got.loc.y,   pos.x - got.loc.x) + TWO_PI*0.25;
    //println("Theta = " + degrees(theta));
    //float theta = atan2(got.loc.y - pos.y,   got.loc.x - pos.x)-PI/2;
    
    return velocity;
  }//end jump
}//end class Engine
*/