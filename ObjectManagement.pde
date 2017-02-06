void setupVersus()
{
  
  loadData(map);
  
  fire1.clear();
  fire2.clear();  
  
  if(greenTrack.size() > 1)
  {
    play1 = new Engine(greenTrack,1,0);
    //play2 = new Engine(greenTrack,1,1);
  }
  
  if(redTrack.size() > 1)
  {
    play2 = new Engine(redTrack,2,0);
    
  }
}//end setVersus

void setupMap()
{
  
  loadData(map);
  g2r = true;
  saveConfirm = 0;
}//end setVersus

void allFire()
{
  for (int i = fire1.size() - 1; i > -1; i--) 
  {
    Projectile tempProj = fire1.get(i);
    if (tempProj.front.x < 0 || tempProj.front.x > width || tempProj.front.y < 0 || tempProj.front.y > height) 
    {
      fire1.remove(i);
    }//end if
    else
    {
      tempProj.update();
      tempProj.render();
      if(tempProj.hit(play2))
      {
        fire1.remove(i);
      }//end if
      
    }//end else
  }//end for
  
  for (int i = fire2.size() - 1; i > -1; i--) 
  {
    Projectile tempProj = fire2.get(i);
    if (tempProj.front.x < 0 || tempProj.front.x > width || tempProj.front.y < 0 || tempProj.front.y > height) 
    {
      fire2.remove(i);
    }//end if
    else
    {
      tempProj.update();
      tempProj.render();
      if(tempProj.hit(play1))
      {
        fire2.remove(i);
      }//end if
      
    }//end else
  }//end for
}//end allFire

void newProjectile(PVector start, PVector velocity, ArrayList<Projectile> fire)
{ 
  PVector front = new PVector(0,0);
  front.add(start);
  Projectile local = new Projectile(front,velocity);
  fire.add(local);
}//end newProjectile

void newLine(ArrayList<Track> line)
{
  Track temp = line.get(line.size() - 1);
  PVector current = new PVector(temp.loc.x,temp.loc.y);
  PVector dest = checkBlock(new PVector(mouseX,mouseY));

  while(current.x != dest.x || current.y != dest.y)
  {
    if(current.x < dest.x)
    {
      current.x++;
    }//end if
    else if(current.x > dest.x)
    {
      current.x--;
    }//end if
    
    if(current.y < dest.y)
    {
      current.y++;
    }//end if
    else if(current.y > dest.y)
    {
      current.y--;
    }//end if

    newTrack(line, current);
  }//end while
}//end newLine