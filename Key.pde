/*
if(checkKey('w'))
{
   force.add(PVector.mult(forward, power));      
}
*/

boolean[] keys = new boolean[1000];

void keyPressed()
{ 
  keys[keyCode] = true;
  
  //println("Keycode = " + keyCode);
  switch(gameMode)
  {
    case 0:
    {
      
      if(keyCode == 'e' || keyCode == 'E')
      {
        gameMode = 1;
        versusStage = 0;
        s1 = s2 = 0;
        //mapSelect = true;
        loadData(map);
      }//end if
      
      
      
      break;
    }//end case 0
    
    case 1:
    {
      
      switch(versusStage)
      {
        case 0:
        {
          if(keyCode == 'a' || keyCode == 'A')
          {
            select1[s1] = (select1[s1] - 1 + weaponCount) % weaponCount;
          }//end if
          else if(keyCode == 'd' || keyCode == 'D')
          {
            select1[s1] = (select1[s1] + 1 + weaponCount) % weaponCount;
          }//end else if
          else if(keyCode == 'w' || keyCode == 'W')
          {
            s1 = (s1 - 1 + select1.length) % select1.length;
          }//end else if
          else if(keyCode == 's' || keyCode == 'S')
          {
            s1 = (s1 + 1 + select1.length) % select1.length;
          }//end else if
          
          if(keyCode == LEFT)
          {
            select2[s2] = (select2[s2] - 1 + weaponCount) % weaponCount;
          }//end if
          else if(keyCode == RIGHT)
          {
            select2[s2] = (select2[s2] + 1 + weaponCount) % weaponCount;
          }//end else if
          else if(keyCode == UP)
          {
            s2 = (s2 - 1 + select2.length) % select2.length;
          }//end else if
          else if(keyCode == DOWN)
          {
            s2 = (s2 + 1 + select2.length) % select2.length;
          }//end else if
          
          if(keyCode == 'e' || keyCode == 'E')
          {
            versusStage = 1;
          }//end if
          
          break;
        }//end switch
        case 1:
        {
          if(keyCode == 'a' || keyCode == 'A' || keyCode == LEFT)
          {
            map = (map - 1 + 5) % 5;
            loadData(map);
          }//end if
          else if(keyCode == 'd' || keyCode == 'D' || keyCode == RIGHT)
          {
            map = (map + 1) % 5;
            loadData(map);
          }//end else if
          else if(keyCode == 'e' || keyCode == 'E' && valid(greenTrack) && valid(redTrack))
          {
            versusStage = 2;
            setupVersus();
          }//end else if
          
          break;
        }//end case 1
        
        case 2:
        {
          if(keyCode == 'h' || keyCode == 'H')
          {
            help = !help;
          }//end if
          
          break;
        }//end case 1
        
        case 3:
        {
          if(keyCode == ' ')
          {
            versusStage = 2;
            setupVersus();
          }//end else if
          
          break;
        }//end case 3
      }//end switch
      
      if(keyCode == 'q' || keyCode == 'Q')
      {
        gameMode = 0;
      }//end if
      
      break;
    }//end case 1
    
    case 2:
    {
      if(mapSelect)
      {
        if(keyCode == 'a' || keyCode == 'A')
        {
          map = (map - 1 + 5) % 5;
          loadData(map);
        }//end if
        else if(keyCode == 'd' || keyCode == 'D')
        {
          map = (map + 1) % 5;
          loadData(map);
        }//end else if
        else if(keyCode == ENTER || keyCode == 'e' || keyCode == 'E')
        {
          mapSelect = false;
          setupMap();
        }//end else if
      }//end if
      else
      {
        if(keyCode == 'r' || keyCode == 'R')
        {
          g2r = !g2r;
        }//end if
      }//end else
      
      if(keyCode == 'q' || keyCode == 'Q')
      {
        gameMode = 0;
      }//end if
      
      break;
    }//end case 2
  }//end switch
}//end keyPressed

void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
 if (keys.length >= k) 
 {
   return keys[k] || keys[Character.toUpperCase(k)];  
 }
 return false;
}