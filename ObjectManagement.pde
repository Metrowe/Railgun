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
    }//end else
  }//end for
}//end allFire

void newProjectile(PVector front, PVector velocity)
{
  Projectile local = new Projectile(front,velocity);
  fire.add(local);
}//end newProjectile