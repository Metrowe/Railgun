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
      //if(keyCode == BACKSPACE)
      if(keyCode == 'q' || keyCode == 'Q')
      {
        //play2 = new Engine(greenTrack);
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
      //if(keyCode == BACKSPACE)
      if(keyCode == 'q' || keyCode == 'Q')
      {
        //play2 = new Engine(greenTrack);
        gameMode = 0;
      }//end if
      
      if(keyCode == UP)
      {
        saveTrack();
      }//end if
      
      if(keyCode == LEFT)
      {
        redTrack.clear();
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