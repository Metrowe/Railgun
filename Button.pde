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
      /*
      gameMode = 1;
      setupVersus();
      */
      gameMode = 1;
      versusStage = 0;
      s1 = s2 = 0;
      //mapSelect = true;
      loadData(map);
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
      mapSelect = true;
      loadData(map);
    }
  }//end ifClicked
}//end class VersusButton

class MapSelectButton extends Button 
{
  
  MapSelectButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      mapSelect = false;
      setupMap();
    }
  }//end ifClicked
}//end class VersusButton

/*
if(keyCode == 'a' || keyCode == 'A')
      {
        map = (map - 1 + 5) % 5;
        loadData(map);
      }//end if
      else if(keyCode == 'd' || keyCode == 'D')
      {
        map = (map + 1) % 5;
        loadData(map);
      }//end else if
      else if(keyCode == ENTER || keyCode == 'e' || keyCode == 'E')
      {
        mapSelect = false;
        setupMap();
      }//end else if
*/

class LeftMapButton extends Button 
{
  
  LeftMapButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      map = (map - 1 + 3) % 3;
      loadData(map);
    }
  }//end ifClicked
}//end class VersusButton

class RightMapButton extends Button 
{
  
  RightMapButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      map = (map + 1) % 3;
      loadData(map);
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
      saveTrack(map);
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
      loadData(0);
    }
  }//end ifClicked
}//end class VersusButton

class ExitButton extends Button 
{
  
  ExitButton(String label, PVector pos, PVector size,color c)
  {
    super(label,pos,size,c);
  }//end FreeModeButton
  
  void ifClicked()
  {
    if(mouseX > pos.x && mouseX < pos.x+size.x && mouseY > pos.y && mouseY < pos.y+size.y)
    {
      gameMode = 0;
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