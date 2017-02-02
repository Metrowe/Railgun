void displayStart()
{
  textAlign(CENTER,CENTER);
  textSize(scale * 0.1);
  fill(255);
  text("Railgun",width*0.5,height*0.3);
  textSize(scale * 0.018);
}//end displayStart

class Button
{
  String label;
  PVector pos;
  PVector size;
  color c;
  color t;
  
  Button(String label, PVector pos, PVector size,color c)
  {
    this.label = label;
    this.pos = pos;
    this.size = size;
    this.c = c;
  }//end FreeModeButton
  
  void hover()
  {
    if(mouseX > pos.x-size.x*0.5 && mouseX < pos.x+size.x*0.5 && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      fill(c);
      t = color(0);
    }
    else
    {
      noFill();
      t = c;
    }//end else
  }//end hover

  void render()
  {
    stroke(c);
    hover();
    rect(pos.x-size.x*0.5,pos.y,  size.x,size.y);
    textra();
  }//end render
  
  void textra()
  {
    fill(t);
    textAlign(CENTER,CENTER);
    text(label,  pos.x, pos.y+size.y*0.5);
  }//end extra
}//end class Button

class VersusButton extends Button 
{
  
  VersusButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      gameMode = 1;
      setupVersus();
    }
  }//end ifClicked
}//end class VersusButton

class MapButton extends Button 
{
  
  MapButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x-size.x/2 && mouseX < pos.x+size.x/2 && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      gameMode = 2;
      setupMap();
    }
  }//end ifClicked
}//end class VersusButton