void allFire()
{
  for (int i = fire.size() - 1; i > -1; i--) 
  {
    Projectile tempProj = fire.get(i);
    if (tempProj.front.x < 0 || tempProj.front.x > width || tempProj.front.x > width) 
    {
      fire.remove(i);
    }//end if
    else
    {
      tempProj.update();
      tempProj.render();
    }//end else
  }//end for
}//end frag