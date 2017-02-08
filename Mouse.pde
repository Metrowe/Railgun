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
      if(!mapSelect)
      {
        if(mouseY < height - grid*2)
        {
          if(g2r)
          {
            if(greenTrack.size() > 0)
            {
              newLine(greenTrack);
            }//end if
            else
            {
              newTrack(greenTrack, checkBlock(new PVector(mouseX,mouseY))  );
            }//end else
          }//end if
          else
          {
            if(redTrack.size() > 0)
            {
              newLine(redTrack);
            }//end if
            else
            {
              newTrack(redTrack, checkBlock(new PVector(mouseX,mouseY))  );
            }//end else
          }//end else
          
        }//end if
        else
        {
          RB.ifClicked();
          CB.ifClicked();
          SB.ifClicked();
          EB.ifClicked();
          g2rB.ifClicked();
        }//end else
      }
      else
      {
        MSB.ifClicked();
        LMB.ifClicked();
        RMB.ifClicked();
      }//end else
      break;
    }//end case 2
  }//end switch 
}//end mouseclicked


 