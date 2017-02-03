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
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
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
    rect(pos.x,pos.y,  size.x,size.y);
    textra();
  }//end render
  
  void textra()
  {
    fill(t);
    textAlign(CENTER,CENTER);
    textSize(scale * 0.025);
    text(label,  pos.x+size.x*0.5, pos.y+size.y*0.5);
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
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
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
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      gameMode = 2;
      setupMap();
    }
  }//end ifClicked
}//end class VersusButton

class SaveButton extends Button 
{
  
  SaveButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      saveTrack();
      saveConfirm = 200;
    }
  }//end ifClicked
}//end class VersusButton

class ClearButton extends Button 
{
  
  ClearButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      greenTrack.clear();
      redTrack.clear();
    }
  }//end ifClicked
}//end class VersusButton

class ResetButton extends Button 
{
  
  ResetButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      loadData();
    }
  }//end ifClicked
}//end class VersusButton

class G2RButton extends Button 
{
  
  G2RButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void render()
  {
    stroke(c);
    fill(c);

    rect(pos.x,pos.y,  size.x,size.y);
    
    stroke(0,255,0);
    if(g2r)
    {
      fill(0,255,0);
    }//end if
    else
    {
      fill(c);
    }//end else
    ellipse(pos.x + size.x*0.25,pos.y + size.y*0.5,  size.y,size.y);
    
    stroke(255,0,0);
    if(!g2r)
    {
      fill(255,0,0);
    }//end if
    else
    {
      fill(c);
    }//end else
    ellipse(pos.x + size.x*0.75,pos.y + size.y*0.5,  size.y,size.y);
    
    
  }//end render
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      g2r = !g2r;
    }
  }//end ifClicked
}//end class VersusButton