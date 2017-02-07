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
      
      break;
    }//end case 0
    
    case 1:
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
        else if(keyCode == 'e' || keyCode == 'E')
        {
          mapSelect = false;
          setupVersus();
        }//end else if
      }//end if
      else
      {
        
      }//end else
      
      if(keyCode == 'q' || keyCode == 'Q')
      {
        gameMode = 0;
      }//end if
    
      
      
      
      
      /*
      if(keyCode == DOWN)
      {
        //play2 = new Engine(greenTrack);
        play2 = new Engine(redTrack);
      }//end if
      */
      
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
        else if(keyCode == ENTER)
        {
          mapSelect = false;
          setupMap();
        }//end else if
      }//end if
      else
      {
        
        /////////////////////////////
        if(keyCode == 'q' || keyCode == 'Q')
        {
          //play2 = new Engine(greenTrack);
          gameMode = 0;
        }//end if
        
        if(keyCode == 'r' || keyCode == 'R')
        {
          //play2 = new Engine(greenTrack);
          g2r = !g2r;
        }//end if
        
        if(keyCode == UP)
        {
          //saveTrack(map);
        }//end if
        
        if(keyCode == LEFT)
        {
          //redTrack.clear();
        }//end if
        /////////////////////////////////////
      }//end else
      
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