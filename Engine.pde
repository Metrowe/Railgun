class Engine
{
  int trak;
  int controlScheme;
  PVector pos;
  
  float speed;
  float accel;
  
  float next;
  float previous;
  
  float theta;
  float thetav;
  ArrayList<Track> railway;
  
  Engine(ArrayList<Track> railway, int controlScheme,int trak)
  {
    this.trak = trak;
    this.controlScheme = controlScheme;
    this.railway = railway;
    Track got = railway.get(trak);
    pos = new PVector((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    speed = 0;
    accel = 0;
    next = got.link;
    previous = 0;
  }//end Engine
  
  void render()
  {
    //fill(0,255,255);
    noFill();
    strokeWeight(1);
    
    stroke(255,0,0);
    ellipse(pos.x,pos.y,  grid*1.1,grid*1.1);
    
    stroke(0,0,255);
    

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(thetav);
    rect(-grid/2,-grid/2, grid,grid);
    
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
  }//end render()
  
  void move()
  {
    if(controlScheme == 1)
    {
      if (checkKey(UP))
      {
        accel = 2;      
      }//end if
      else if (checkKey(DOWN))
      {
        accel = -2;      
      }//end else if
    }//end if
    else //if (controlScheme == 2)
    {
      if (checkKey('w'))
      {
        accel = 2;      
      }//end if
      else if (checkKey('s'))
      {
        accel = -2;      
      }//end else if
    }//end else
  }//end move
  
  void shoot()
  {
    
  }//end shoot
  
  void update()
  {
    move();
    shoot();

    speed += accel * timeDelta;

    pos.add(jump(speed));
    
    if(next < grid/2)
    {
      Track got1 = railway.get(trak);
      Track got2 = railway.get((trak+1) % railway.size());
      
      println(  degrees(got1.theta)  );
       println(  degrees(got2.theta)  );
      println("");
      
      //if(  sq(got1.theta - got2.theta) < sq(got1.theta - (got2.theta - TWO_PI))  )
      //if(one == 1)
      if( sqrt(sq(got1.theta - got2.theta)) < PI)
      {
        thetav = map(next,grid/2,0, got1.theta, (got1.theta+got2.theta)/2 );
      }//end if
      else
      {
        println("n darn");
        //thetav = map(next,grid/2,0, got1.theta, (got1.theta+got2.theta + TWO_PI)/2 );
        thetav = map(next,grid/2,0, got1.theta, (got1.theta+got2.theta)/2   /*-   TWO_PI*/         );
      }//end else                                                               ///////////

    }//end if
    else if(previous < grid/2)
    {
      Track got1 = railway.get(((trak-1)+railway.size()) % railway.size());
      Track got2 = railway.get(trak);

      //if(  sq(got1.theta - got2.theta) < sq(got1.theta - (got2.theta - TWO_PI))  )
      if(sqrt(sq(got1.theta - got2.theta)) < PI)
      {
        thetav = map(previous,0,grid/2, (got1.theta+got2.theta)/2, got2.theta);
      }//end if
      else
      {
        println("p darn");
        //thetav = map(previous,0,grid/2, (got1.theta+got2.theta + TWO_PI)/2, got2.theta);
        thetav = map(previous,0,grid/2, (got1.theta+got2.theta)/2     /*+ TWO_PI*/     , got2.theta);
      }//end else                                            ///////////////////
    }//end if
    else
    {
      Track got = railway.get(trak);
      thetav = got.theta;
    }//end else

    accel = 0;
    speed *= 0.99;
    
    float val = 0.01;
    if(speed > -val && speed < val)
    {
      speed = 0;
    }//end if
  }//end update

  PVector jump(float remain)
  {
    PVector vel = new PVector();
    
    while(remain > next)
    {
      remain -= next;
      trak = (trak+1) % railway.size();
      Track got = railway.get(trak);
      next = got.link;
      previous = 0;
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    }//end while

    while( (previous + remain) < 0)
    {
      remain = remain +previous;
      Track got = railway.get(trak);
      pos.set((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
      trak = ((trak-1)+railway.size()) % railway.size();
      got = railway.get(trak);
      previous = got.link;
      next = 0;
    }//end while

    next -= remain;
    previous += remain;

    Track got1 = railway.get(trak);
    Track got2 = railway.get((trak+1) % railway.size());
    thetav = atan2(got1.loc.y - got2.loc.y,  got1.loc.x - got2.loc.x) + TWO_PI*0.75;
    vel = PVector.mult(new PVector(sin(thetav), -cos(thetav)), remain);

    return vel;
  }//end jump
}//end class Engine


class GunCarriage extends Engine 
{
  int fireRate;
  int fireSpeed;
  int damage;
  int cooldown;
  
  GunCarriage(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
  }//end FreeModeButton
  
  void shoot()
  {
    if(cooldown < 1)
    {
      if(controlScheme == 1)
      {
        if (checkKey(LEFT))
        {
          PVector shotSpeed = new PVector(sin(thetav - TWO_PI/4) * 1,-cos(thetav - TWO_PI/4) * 1);
  
          newProjectile(pos, shotSpeed, fire1);
        }//end if
        else if (checkKey(RIGHT))
        {
          PVector shotSpeed = new PVector(sin(thetav + TWO_PI/4) * 1,-cos(thetav + TWO_PI/4) * 1);
  
          newProjectile(pos, shotSpeed,fire1);     
        }//end else if
      }//end if
      else
      {
        if (checkKey('a'))
        {
          PVector shotSpeed = new PVector(sin(thetav - TWO_PI/4) * 1,-cos(thetav - TWO_PI/4) * 1);
       
          newProjectile(pos, shotSpeed,fire2);
        }//end if
        else if (checkKey('d'))
        {
          PVector shotSpeed = new PVector(sin(thetav + TWO_PI/4) * 1,-cos(thetav + TWO_PI/4) * 1);
        
          newProjectile(pos, shotSpeed,fire2);     
        }//end else if
      }//end else
    }//end if
      
      
  }//end shoot
}//end class MavhineGun

class MachineGun extends GunCarriage
{
  MachineGun(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
  }//end FreeModeButton
}