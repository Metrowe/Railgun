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
  
  if(keyCode == UP)
  {
    saveTrack();
  }//end if
}

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