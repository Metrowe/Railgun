void displayGrid()
{
  stroke(0,255,255);
  strokeWeight(0.1);
  for(int i = 0;i < width/grid;i++)
  {
    line(i*grid,0,  i*grid,height);
  }//end for
  for(int i = 0;i < height/grid;i++)
  {
    line(0,i*grid,  width,i*grid);
  }//end for
  strokeWeight(2);
}//end displayGrid

void displayHelp()
{
  textAlign(LEFT,BOTTOM);
  textSize(scale * 0.025);
  fill(255);
  
  float spacing = grid * 1;
  
  text("Destroy all your opponents weapon carriages\n or their engine(White Block) to win",0,height - (spacing * 16)  );
  text(" ",0,height - (spacing * 14)  );
  text("Q - Quit to main menu",0,height - (spacing * 13)  );
  text("Player 1 (WASD)",0,height - (spacing * 12)  );
  text("w     - Move forward",0,height - (spacing * 11)  );
  text("s      - Move backward",0,height - (spacing * 10)  );
  text("a      - Fire out left side",0,height - (spacing * 9)  );
  text("d      - Fire out right side",0,height - (spacing * 8)  );
  text(" ",0,height - (spacing * 7)  );
  text("Player 2 (Arrow Keys)",0,height - (spacing * 6)  );
  text("UP        - Move forward",0,height - (spacing * 5)  );
  text("DOWN  - Move backward",0,height - (spacing * 4)  );
  text("LEFT     - Fire out left side",0,height - (spacing * 3)  );
  text("RIGHT   - Fire out right side",0,height - (spacing * 2)  );
  text(" ",0,height - (spacing * 1)  );
  text("h - Toggle help",0,height - (spacing * 0)  );
  
}//end displayHelp

void displayCarriage(String name, PVector pos,int[] select,int s)
//void displayCarriage(String name, PVector pos,int[] select)
{
  float space = height*0.15;
  strokeWeight(scale*0.002);
  textAlign(CENTER,CENTER);
  //textAlign(LEFT,TOP);
  textSize(scale * 0.025);
  fill(255);
  
  text(name,pos.x+space/2,pos.y);
  
  
  //textAlign(CENTER,CENTER);
  for(int i = 0;i < select.length;i++)
  {
    fill(0);
    switch(select[i])
    { 
      case 0:
      {
        name = "Shotgun";
        ///text("Shotgun",pos.x,pos.y);
        stroke(255,255,0);
        fill(255,255,0);
        
        break;
      }//end case 0
      case 1:
      {
        name = "Machinegun";
        stroke(0,0,255);
        fill(0,0,255);
        
        break;
      }//end case 1
      case 2:
      {
        name = "Sniper";
        stroke(180,0,180);
        fill(180,0,180);
        
        break;
      }//end case 1
    }//end switch
    text(name,pos.x+space/2,pos.y + space/3 + i * space + space/2);
    noFill();
    rect(pos.x,pos.y + space/3 + i * space,   space,space);
    //fill(255);
    if(s == i)
    {
      triangle(pos.x,pos.y + space/3 + i * space,   pos.x,pos.y + space/3 + i * space + space,   pos.x-space/3,pos.y + space/3 + i * space + space/2   );
      triangle(pos.x+space,pos.y + space/3 + i * space,   pos.x+space,pos.y + space/3 + i * space + space,   pos.x+space+space/3,pos.y + space/3 + i * space + space/2   );
    }//end if
    
  }//end for
  
  strokeWeight(1);
}//end displayCarriage

void displayTrack()
{
  for (int i = redTrack.size() - 1; i > -1; i--) 
  {
    Track tempTrack = redTrack.get(i);

    tempTrack.render(  color(150,0,0)  );
  }//end for
  
  for (int i = greenTrack.size() - 1; i > -1; i--) 
  {
    Track tempTrack = greenTrack.get(i);

    //tempTrack.render(  color(0,255,0)  );
    tempTrack.render(  color(0,150,0)  );
  }//end for
}//end smallRock

void displayTemplate(ArrayList<Track> line)
{
  

  if(mouseY < height - grid*2 && line.size() > 0)
  {
    Track temp = line.get(line.size() - 1);
    PVector current = new PVector(temp.loc.x,temp.loc.y);
    PVector dest = checkBlock(new PVector(mouseX,mouseY));
    
    //println("curr = " + current.x + " " + current.y);
      //println("dest = " + dest.x + " " + dest.y);
    
    
    
    noStroke();
    fill(255,255,0);
    
    //rect(current.x*grid,current.y*grid,  grid,grid);
    //rect(dest.x*grid,dest.y*grid,  grid,grid);
    //println(current == dest);
    //println(current.x != dest.x || current.y != dest.y);
    
    //while(current == dest)
    while(current.x != dest.x || current.y != dest.y)
    {
      
      println("curr = " + current.x + " " + current.y);
      println("dest = " + dest.x + " " + dest.y);
      println(current == dest);
      if(current.x < dest.x)
      {
        current.x++;
      }//end if
      else if(current.x > dest.x)
      {
        current.x--;
      }//end if
      
      if(current.y < dest.y)
      {
        current.y++;
      }//end if
      else if(current.y > dest.y)
      {
        current.y--;
      }//end if
      
      
      rect(current.x*grid,current.y*grid,  grid,grid);
      
    }//end while

    
  }//end if
  else
  {

  }//end else


}//end displayTemplate

void displayConfirm()
{
  textAlign(LEFT,TOP);
  textSize(scale * 0.025);
  fill(255);
  saveConfirm--;
  
  if(saveConfirm > 0)
  {
    text("Save successful",0,0);
  }//end if
}//end displayConfirm
/*
void displayHighlight()
{
  if(g2r)
  {
    stroke(0,255,0);
    fill(0,255,0);
  }//end if
  else
  {
    stroke(255,0,0);
    fill(255,0,0);
  }//end else
  
  ellipse(mouseX,mouseY, width * 0.01,height * 0.01);
}//end
*/

void displayTitle()
{
  textAlign(CENTER,CENTER);
  textSize(scale * 0.1);
  fill(255);
  text("Railgun",width*0.5,height*0.2);
  textSize(scale * 0.05);
  text("An On-Rails Shooter",width*0.5,height*0.3);
}//end displayTitle

PShape makeShape(color c)
{
  PShape shape = createShape(GROUP);
  noStroke();
  PShape body = createShape(RECT, -grid/2, -grid/2, grid, grid);
  body.setFill(c);
  body.setStrokeWeight(0);
  shape.addChild(body);
  
  PShape port = createShape(TRIANGLE, -grid/2,0,    -grid/2,-grid/2,   -grid/4,-grid/4);
  port.setFill(0);
  port.setStrokeWeight(0);
  shape.addChild(port);
  
  port = createShape(TRIANGLE, -grid/2,0,    -grid/2,grid/2,   -grid/4,grid/4);
  port.setFill(0);
  port.setStrokeWeight(0);
  shape.addChild(port);
  
  port = createShape(TRIANGLE, grid/2,0,    grid/2,-grid/2,   grid/4,-grid/4);
  port.setFill(0);
  port.setStrokeWeight(0);
  shape.addChild(port);
  
  port = createShape(TRIANGLE, grid/2,0,    grid/2,grid/2,   grid/4,grid/4);
  port.setFill(0);
  port.setStrokeWeight(0);
  shape.addChild(port);
  
  return shape;
}

PVector checkBlock(PVector in)
{
  //PVector out = new PVector(round((in.x/grid)),round(in.y/grid));
  PVector out = new PVector(  int(in.x/grid), int(in.y/grid)  );
  //out.x = in.x/grid;
  //toggle((int)(mouseX/cw),(int)(mouseY/ch),true);
  //out.x = round(in.x/grid);
  //out.y = round(in.y/grid);
  //println(int(in.x/grid));
  return out;
}//end checkBlock