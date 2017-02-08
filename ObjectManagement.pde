void assemble(ArrayList<Engine> play, ArrayList<Track> railway, int[] select, int controlScheme)
{
  if(railway.size() > select.length+1)
  {
    int trak = select.length;
    Engine newEng = new Engine(railway,controlScheme,trak);
    play.add(newEng);
    
    for(int i = 0;i < select.length;i++)
    {
      trak--;
      switch(select[i])
      { 
        case 0:
        {
          //Shotgun newEng2 = new Shotgun(railway,controlScheme,select.length-i);
          play.add(new Shotgun(railway,controlScheme,trak));
          
          break;
        }//end case 0
        case 1:
        {
          play.add(new Machinegun(railway,controlScheme,trak));
          
          break;
        }//end case 1
        case 2:
        {
          play.add(new Sniper(railway,controlScheme,trak));
          
          break;
        }//end case 1
      }//end switch
    }//end for
  }//end if
}//end assemble


boolean valid(ArrayList<Track> railway)
{
  if(railway.size() > 5)
  {
    return true;
  }//end if
  return false;
}//end valid



void collision()
{
  for (int i = 0; i < play1.size(); i++) 
  {
    Engine tempEng1 = play1.get(i);
    
    for(int j = 0; j < play2.size(); j++)
    {
      Engine tempEng2 = play2.get(j);
      if(tempEng1.pos.dist(tempEng2.pos) <= grid * 1.1)
      {
        tempEng1.health -= 20;
        tempEng2.health -= 20;
        reposition(play1);
        reposition(play2);
        return;
      }//end if
    }//end for
    
    //front.dist(player.pos) <= grid * 0.55
    
    
  }//end for
}//end collision

void reposition(ArrayList<Engine> play)
{
  for (int i = 0; i < play.size(); i++) 
  {
    Engine tempEng = play.get(i);
    
    tempEng.trak = play.size() - i;
    Track got = tempEng.railway.get(tempEng.trak);
    tempEng.pos = new PVector((got.loc.x*grid)+grid/2,(got.loc.y*grid)+grid/2);
    tempEng.speed = 0;
    tempEng.accel = 0;
    tempEng.next = got.link;
    tempEng.previous = 0;
  }//end for
}//end reposition

boolean defeatCheck(ArrayList<Engine> play)
{
  Engine mainEng = play.get(0);
  if(mainEng.health <= 0)
  {
    return true;
  }//end if
  
  for (int i = 1; i < play.size(); i++) 
  {
    Engine tempEng = play.get(i);
    
    if(tempEng.health > 0)
    {
      return false;
    }//end if 
  }//end for
  
  return true;
          
}//end defeatCheck

void setupVersus()
{
  
  loadData(map);
  
  fire1.clear();
  fire2.clear();  
  
  play1.clear();
  play2.clear();
  
  /*
  if(greenTrack.size() > 1)
  {
    play1 = new Engine(greenTrack,1,0);
    //play2 = new Engine(greenTrack,1,1);
  }
  */
  
  assemble(play1, greenTrack, select1, 2);
  //assemble(play2, greenTrack, select2, 2);
  assemble(play2, redTrack, select2, 1);
  
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
      
      if(!defeatCheck(play1) && !defeatCheck(play2))
      {
        for (int j = play1.size() - 1; j > -1; j--) 
        {
            Engine tempEng = play1.get(j);
            if(tempProj.hit(tempEng))
            {
              fire1.remove(i);
              break;
            }//end if
        }//end for
      }//end else
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
      
      for (int k = play2.size() - 1; k > -1; k--) 
      {
          Engine tempEng = play2.get(k);
          if(tempProj.hit(tempEng))
          {
            println("i = " + i);
            println("fire2.size() = " + fire2.size());
            fire2.remove(i);
            
            break;
          }//end if
      }//end for
      
      /*
      if(tempProj.hit(play1))
      {
        fire2.remove(i);
      }//end if
      */
    }//end else
  }//end for
}//end allFire

void newProjectile(PVector start, PVector velocity, float damage, color c, ArrayList<Projectile> fire)
{ 
  PVector front = new PVector(0,0);
  front.add(start);
  Projectile local = new Projectile(front,velocity,damage,c);
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