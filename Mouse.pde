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
      //g2rB.ifClicked();
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
      //VB.ifClicked();
      //MB.ifClicked();
      break;
    }//end case 0
    case 1:
    {
      
      break;
    }//end case 1
    case 2:
    {
      if(mouseY < height - grid*2)
      {
        if(g2r)
        {
          newTrack(greenTrack, checkBlock(new PVector(mouseX,mouseY))  );
          setDistance(greenTrack);
        }//end if
        else
        {
          newTrack(redTrack, checkBlock(new PVector(mouseX,mouseY))  );
          setDistance(redTrack);
        }//end else
        
      }//end if
      else
      {
        RB.ifClicked();
        CB.ifClicked();
        SB.ifClicked();
        g2rB.ifClicked();
      }//end else
      //PVector block = checkBlock(new PVector(mouseX,mouseY));
        
    //PVector block = new PVector();
    //block = checkBlock(new PVector(mouseX,mouseY));
    
    //play2 = new Engine(redTrack);
    
    /*
    if(redTrack.size() == 1)
    {
      play2 = new Engine(redTrack);
    }//end if
      */
      
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


 