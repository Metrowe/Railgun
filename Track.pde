class Track
{
  PVector loc;
  float link;
  
  Track(PVector in)
  {
    loc = new PVector(in.x, in.y);
  }//end Star
  
  Track(TableRow row)
  {
    loc = new PVector(row.getInt("1x"),row.getInt("1y"));
  }//end Star 
  
  void render(color c)
  {
    noStroke();
    fill(c);
    rect(loc.x*grid,loc.y*grid,  grid,grid);
  }//end render
}//end class Track

//ArrayList<Track> redTrack = new ArrayList<Track>();
void setDistance(ArrayList<Track> railway)
{
  for (int i = 0;i < railway.size();i++) 
  {
    if(i == railway.size() - 1)
    {
      Track temp1 = railway.get(i);
      Track temp2 = railway.get(0);
      temp1.link = dist(temp1.loc.x*grid,temp1.loc.y*grid,  temp2.loc.x*grid,temp2.loc.y*grid);
    }//end if
    else
    {
      Track temp1 = railway.get(i);
      Track temp2 = railway.get(i+1);
      temp1.link = dist(temp1.loc.x*grid,temp1.loc.y*grid,  temp2.loc.x*grid,temp2.loc.y*grid);
    }//end else
  }//end for
}//end set


void newTrack(ArrayList<Track> railway, PVector in)
{
  Track local = new Track(in);
  railway.add(local);
}//end newTrack
/*
void newTrack(TableRow row)
{
  Track local = new Track(row);
  greenTrack.add(local);
}//end Planet
*/