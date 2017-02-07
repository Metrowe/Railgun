///Test upload aftter hardware failure
void setup()
{
  //size(200,400);
  size(600,600);
  //grid = 20;
  grid = width/40;
  xg = width/grid;
  yg = height/grid;
  scale = (width+height)/2;
  gameMode = 0;
  map = 0;
  
  weaponCount = 3;
  
  test = new PVector();//
  mouse = new PVector();//
  
  VB = new VersusButton( "Versus",new PVector(width*0.4,height*0.4),new PVector(width*0.2,height*0.05),color(255,0,0) );
  MB = new MapButton( "Map Maker",new PVector(width*0.4,height*0.55),new PVector(width*0.2,height*0.05),color(0,255,0) );
  
  RB = new ResetButton( "Reset",new PVector(width-grid*8,height-grid*2),new PVector(grid*4,grid*2),color(255,0,255) );
  CB = new ClearButton( "Clear All",new PVector(width-grid*12,height-grid*2),new PVector(grid*4,grid*2),color(255,255,0) );
  SB = new SaveButton( "Save",new PVector(width-grid*4,height-grid*2),new PVector(grid*4,grid*2),color(0,255,255) );
  EB = new ExitButton( "Exit",new PVector(width-grid*16,height-grid*2),new PVector(grid*4,grid*2),color(0,255,255) );
  g2rB = new G2RButton( "",new PVector(0,height-grid*2),new PVector(grid*5,grid*2),color(100) );
  
  tableSetup();
  
  
  
  
  
  //ellipseMode(RADIUS);
}//end setup

//Engine play1;
//Engine play2;
//Machinegun play2;
//Shotgun play2;
ArrayList<Engine>play1 = new ArrayList<Engine>();
ArrayList<Engine>play2 = new ArrayList<Engine>();

//int[] select1 = new int[4];
//int[] select2 = new int[3];
int[] select1 = {0,1,0};
int[] select2 = {2,0,2};

//ArrayList<Planet> planets = new ArrayList<Planet>();
Table table;


ArrayList<Track> greenTrack = new ArrayList<Track>();
ArrayList<Track> redTrack = new ArrayList<Track>();

ArrayList<Projectile> fire1 = new ArrayList<Projectile>();
ArrayList<Projectile> fire2 = new ArrayList<Projectile>();

float timeDelta = 1.0f / 60.0f;
int grid;
float xg,yg;
PVector test;
PVector mouse;

int testHit;

int gameMode;
int versusStage;
int map;
float scale;

int saveConfirm;

int one = 1;///////////////////////////////////
int s1, s2;

boolean g2r;
boolean mapSelect;

int weaponCount;

VersusButton VB;
MapButton MB;

ResetButton RB;
ClearButton CB;
SaveButton SB;
ExitButton EB;
G2RButton g2rB;

void draw()
{
  //println( select2.length );
  //println("Red Size = " + redTrack.size() );
  //println("Gre Size = " + greenTrack.size() );
  //if(frameCount % 1 == 0)
  //{//////////////////////////////////////////////////////////
  
  //background(0);
  /*
  PVector tnull = null;
  
  if(tnull != null)
  {
    println("TRUE null");
  }
  else
  {
    println("FALSE null");
  }
  */
  
  switch(gameMode)
  {
    case 0:
    {
      background(0);
      displayTitle();
      VB.render();
      MB.render();

      break;
    }//end case 0
    
    case 1:
    {
      
      switch(versusStage)
      {
        case 0:
        {
          background(50);
          
          //displayCarriage(select1,s1);
          //displayCarriage(select2,s2);
          
          displayCarriage("Player 1", new PVector(width*0.4-height*0.15,height*0.2),select1,s1);
          displayCarriage("Player 2", new PVector(width*0.6,height*0.2),select2,s2);
          
          break;
        }//end case
        case 1:
        {
          background(50);
        
          pushMatrix();
          translate(width*0.25,height*0.25);
          scale(0.5);
  
          displayTrack();
          displayGrid();
  
          popMatrix();
          //textAlign(LEFT,TOP);
          textAlign(CENTER,CENTER);
          textSize(scale * 0.1);
          fill(255);
          text("Map " + (map+1),width/2,height * 0.15);
          
          break;
        }//end case
        case 2:
        {
          background(50);
        
          displayTrack();
          
          allFire();
          
          for (int i = play1.size() - 1; i > -1; i--) 
          {
            Engine tempEng = play1.get(i);
            tempEng.render();
            tempEng.update();
            
          }//end for
          
          for (int i = play2.size() - 1; i > -1; i--) 
          {
            Engine tempEng = play2.get(i);
            tempEng.render();
            tempEng.update();
            
          }//end for
          
          break;
        }//end case
        case 3:
        {
          background(50);
        
          displayTrack();
          

          
          for (int i = play1.size() - 1; i > -1; i--) 
          {
            Engine tempEng = play1.get(i);
            tempEng.render();

            
          }//end for
          
          for (int i = play2.size() - 1; i > -1; i--) 
          {
            Engine tempEng = play2.get(i);
            tempEng.render();
 
            
          }//end for
          
          break;
        }//end case 3
      }//end switch
      

      break;
    }//end case 1
    
    case 2:
    {
      if(mapSelect)
      {
        background(50);
        
        pushMatrix();
        translate(width*0.25,height*0.25);
        scale(0.5);

        displayTrack();
        displayGrid();

        popMatrix();
        //textAlign(LEFT,TOP);
        textAlign(CENTER,CENTER);
        textSize(scale * 0.1);
        fill(255);
        text("Map " + (map+1),width/2,height * 0.15);
        
      }//end if
      else
      {
        background(50);
        
        displayTrack();
        displayGrid();
        displayConfirm();
        if(g2r)
        {
          displayTemplate(greenTrack);
        }
        else
        {
          displayTemplate(redTrack);
        }//end else
        
        RB.render();
        CB.render();
        SB.render();
        EB.render();
        g2rB.render();
      }//end else
      
      break;
      
      
    }//end case 2
  
  
  }//end switch
  //ellipse(width/2,height/2,  20,20);
  /*
  mouse.set(mouseX,mouseY);
  test = checkBlock(mouse);
  
  text(  test.x
        +" + "
        +test.y,
         width*0.5,height*0.5);
  */
  
 // }//////////////////////////////////////////////////////////////////
}//end draw