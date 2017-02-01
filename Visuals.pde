void displayGrid()
{
  stroke(0,255,255);
  strokeWeight(0.1);
  for(int i = 0;i < xg;i++)
  {
    line(i*grid,0,  i*grid,height);
  }//end for
  for(int i = 0;i < yg;i++)
  {
    line(0,i*grid,  width,i*grid);
  }//end for
}//end displayGrid

void displayTrack()
{
  for (int i = redTrack.size() - 1; i > -1; i--) 
  {
    Track tempTrack = redTrack.get(i);

    tempTrack.render(  color(255,0,0)  );
  }//end for
  
  for (int i = greenTrack.size() - 1; i > -1; i--) 
  {
    Track tempTrack = greenTrack.get(i);

    //tempTrack.render(  color(0,255,0)  );
    tempTrack.render(  color(0,100,0)  );
  }//end for
}//end smallRock

float reach(float in, float out)
{
  if( in < out - radians(1) || in > out + radians(1) )
  {
    if(in > out)
    {
      
    }//end if
  }//end if
  
  
  
  return out;
}//end reach

PVector checkBlock(PVector in)
{
  //PVector out = new PVector(round((in.x/grid)),round(in.y/grid));
  PVector out = new PVector(  int(in.x/grid), int(in.y/grid)  );
  //out.x = in.x/grid;
  //toggle((int)(mouseX/cw),(int)(mouseY/ch),true);
  //out.x = round(in.x/grid);
  //out.y = round(in.y/grid);
  println(int(in.x/grid));
  return out;
}//end checkBlock