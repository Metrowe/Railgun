class Engine
{
  int trak;
  int controlScheme;
  PVector pos;
  PShape shape = createShape(GROUP);
  
  float speed;
  float accel;
  
  float next;
  float previous;
  
  float thetav;
  
  color theme;
  ArrayList<Track> railway;
  
  float health;
  
  Engine(ArrayList<Track> railway, int controlScheme,int trak)
  {
    this.trak = trak;
    this.controlScheme = controlScheme;
    this.railway = railway;
    Track got = railway.get(trak);
    pos = new PVector((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    speed = 0;
    accel = 0;
    health = 200;
    next = got.link;
    previous = 0;
    theme = color(255);
    
    PShape front = createShape(ELLIPSE, 0, 0, grid, grid);
    front.setFill(theme);
    front.setStrokeWeight(0);
    PShape back = createShape(RECT, -grid/2, 0, grid, grid/2);
    back.setFill(theme);
    back.setStrokeWeight(0);
    PShape point = createShape(TRIANGLE, -grid/2,0,    grid/2,0,   0,-grid/2);
    point.setFill(0);
    point.setStrokeWeight(0);

    shape.addChild(front);
    shape.addChild(back);
    shape.addChild(point);

  }//end Engine
  
  void render()
  {
    noStroke();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(thetav);
    if(health > 0)
    {
      shape(shape);
    }//end if
    else
    {
      fill(0);
      rect(-grid/2,-grid/2, grid,grid);
    }//end else
    popMatrix();
  }//end render()
  
  void move()
  {
    if(controlScheme == 1)
    {
      if (checkKey(UP))
      {
        accel = thrust;      
      }//end if
      else if (checkKey(DOWN))
      {
        accel = -thrust;      
      }//end else if
    }//end if
    else //if (controlScheme == 2)
    {
      if (checkKey('w'))
      {
        accel = thrust;      
      }//end if
      else if (checkKey('s'))
      {
        accel = -thrust;      
      }//end else if
    }//end else
  }//end move
  
  void shoot()
  {
    
  }//end shoot
  
  void trigger(float theta, ArrayList<Projectile> fire)
  {
    
  }//end trigger
  
  void update()
  {
    move();
    
    if(health > 0)
    {
      shoot();
    }//end if

    speed += accel * timeDelta;

    pos.add(jump(speed));
    
    if(next < grid/2)
    {
      Track got1 = railway.get(trak);
      Track got2 = railway.get((trak+1) % railway.size());
      
      if( got1.theta - got2.theta < PI && got1.theta - got2.theta > -PI)
      {
        thetav = map(next,grid/2,0, got1.theta, (got1.theta+got2.theta)/2 );
      }//end if
      else
      {
        thetav = map(next,grid/2,0, got1.theta % TWO_PI, (got1.theta+got2.theta-TWO_PI)/2 );
      }//end else
    }//end if
    else if(previous < grid/2)
    {
      Track got1 = railway.get(((trak-1)+railway.size()) % railway.size());
      Track got2 = railway.get(trak);

      if( got1.theta - got2.theta < PI && got1.theta - got2.theta > -PI)
      {
        thetav = map(previous,0,grid/2, (got1.theta+got2.theta)/2, got2.theta);
      }//end if
      else
      {
       thetav = map(previous,0,grid/2, (got1.theta+got2.theta -TWO_PI)/2, got2.theta % TWO_PI);
      }//end else   
    }//end if
    else
    {
      Track got = railway.get(trak);
      thetav = got.theta;
    }//end else

    accel = 0;
    speed *= brake;
    
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
  float fireSpeed;
  int damage;
  int cooldown;
  
  GunCarriage(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
    
    health = 100;
  }//end FreeModeButton
  
  void shoot()
  {
    
    if(cooldown < 1)
    {
      if(controlScheme == 1)
      {
        if (checkKey(LEFT))
        {
          trigger(thetav - TWO_PI/4,fire1);
        }//end if
        else if (checkKey(RIGHT))
        {
          trigger(thetav + TWO_PI/4,fire1);    
        }//end else if
      }//end if
      else
      {
        if (checkKey('a'))
        {
          trigger(thetav - TWO_PI/4,fire2);
        }//end if
        else if (checkKey('d'))
        {
          trigger(thetav + TWO_PI/4,fire2);
        }//end else if
      }//end else
    }//end if
      
    cooldown--;
  }//end shoot

}//end class Machinegun

class Machinegun extends GunCarriage
{
  Machinegun(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
    fireRate = 15;
    fireSpeed = scale * 0.008;
    damage = 16;
    cooldown = 0;
    //c = color(0,0,255);
    theme = color(0,0,255);
    
    shape = makeShape(theme);
  }//end FreeModeButton
  
  void trigger(float theta, ArrayList<Projectile> fire)
  {
    PVector shotSpeed = new PVector(sin(theta) * fireSpeed,-cos(theta) * fireSpeed);
  
    newProjectile(pos, shotSpeed, damage,theme, fire);
    cooldown = fireRate;
  }//end trigger
}

class Shotgun extends GunCarriage
{
  int pellets;
  float range;
  Shotgun(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
    fireRate = 60;
    fireSpeed = scale * 0.005;
    damage = 7;
    cooldown = 0;
    pellets = 6;
    range = radians(100);
    theme = color(255,255,0);
    
    shape = makeShape(theme);
  }//end FreeModeButton
  
  void trigger(float theta, ArrayList<Projectile> fire)
  {
    float temp; 
    for(int i = 0;i < pellets;i++)
    {
      temp = theta - range/2 + (range/pellets)*i;
      PVector shotSpeed = new PVector(sin(temp) * fireSpeed,-cos(temp) * fireSpeed);
      newProjectile(pos, shotSpeed, damage,theme, fire);
    }//end for
    cooldown = fireRate;
  }//end trigger
}

class Sniper extends GunCarriage
{
  int pellets;
  float range;
  Sniper(ArrayList<Track> railway, int controlScheme,int trak)
  {
    super(railway,controlScheme,trak);
    fireRate = 90;
    fireSpeed = scale * 0.015;
    damage = 51;
    cooldown = 0;
    theme = color(180,0,180);
    
    shape = makeShape(theme);
  }//end FreeModeButton
  
  void trigger(float theta, ArrayList<Projectile> fire)
  {
    PVector shotSpeed = new PVector(sin(theta) * fireSpeed,-cos(theta) * fireSpeed);
  
    newProjectile(pos, shotSpeed, damage,theme, fire);
    cooldown = fireRate;
  }//end trigger
}