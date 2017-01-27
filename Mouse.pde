void mouseClicked()
{
  mouse.set(mouseX,mouseY);
  PVector block = new PVector();
  block = checkBlock(mouse);
  newTrack(redTrack, block);
}//end mouseClicked