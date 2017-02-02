void mouseClicked()
{
  switch(gameMode)
  {
    case 0:
    {
      VB.ifClicked();
      MB.ifClicked();
      break;
    }//end case 0
    case 1:
    {
      
      break;
    }//end case 1
    case 2:
    {
      
      break;
    }//end case 2
  }//end switch
}//end mouseClicked

void mousePressed()
{ 
  
  switch(gameMode)
  {
    case 0:
    {
      VB.ifClicked();
      MB.ifClicked();
      break;
    }//end case 0
    case 1:
    {
      
      break;
    }//end case 1
    case 2:
    {
      //PVector block = checkBlock(new PVector(mouseX,mouseY));
  
    //PVector block = new PVector();
    //block = checkBlock(new PVector(mouseX,mouseY));
    newTrack(redTrack, checkBlock(new PVector(mouseX,mouseY))  );
    //play2 = new Engine(redTrack);
    setDistance(redTrack);
    if(redTrack.size() == 1)
    {
      play2 = new Engine(redTrack);
    }//end if
      
      
      break;
    }//end case 2
  }//end switch
  /*
  PVector block = checkBlock(new PVector(mouseX,mouseY));
  
  //PVector block = new PVector();
  //block = checkBlock(new PVector(mouseX,mouseY));
  newTrack(redTrack, block);
  //play2 = new Engine(redTrack);
  setDistance(redTrack);
  if(redTrack.size() == 1)
  {
    play2 = new Engine(redTrack);
  }//end if
  */
  
  
}//end mouseclicked


 