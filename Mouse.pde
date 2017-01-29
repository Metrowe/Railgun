void mouseClicked()
{
  mouse.set(mouseX,mouseY);
  PVector block = new PVector();
  block = checkBlock(mouse);
  newTrack(redTrack, block);
  //play2 = new Engine(redTrack);
  setDistance(redTrack);
  if(redTrack.size() == 1)
  {
    play2 = new Engine(redTrack);
  }//end if
}//end mouseClicked