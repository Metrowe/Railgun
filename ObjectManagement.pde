void setupVersus()
{
  
  loadData();
  
  if(greenTrack.size() > 1)
  {
    play1 = new Engine(greenTrack);
  }
  
  if(redTrack.size() > 1)
  {
    play2 = new Engine(redTrack);
  }
}//end setVersus

void setupMap()
{
  
  loadData();
  g2r = true;
  saveConfirm = 0;
}//end setVersus

void allFire()
{
  for (int i = fire.size() - 1; i > -1; i--) 
  {
    Projectile tempProj = fire.get(i);
    if (tempProj.front.x < 0 || tempProj.front.x > width || tempProj.front.y < 0 || tempProj.front.y > height) 
    {
      fire.remove(i);
    }//end if
    else
    {
      tempProj.update();
      tempProj.render();
      if(tempProj.hit(play1))
      {
        fire.remove(i);
      }//end if
      
    }//end else
  }//end for
}//end allFire

void newProjectile(PVector start, PVector velocity)
{
  PVector front = new PVector(0,0);
  front.add(start);
  Projectile local = new Projectile(front,velocity);
  fire.add(local);
}//end newProjectile