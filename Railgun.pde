void setup()
{
  size(600,600);
  grid = width/40;
  scale = (width+height)/2;
  gameMode = 0;
  map = 0;
  
  help = false;
  
  weaponCount = 3;
  brake = 0.97;
  thrust = scale * 0.005;
  
  VB = new VersusButton( "Versus",new PVector(width*0.4,height*0.4),new PVector(width*0.2,height*0.05),color(255,0,0) );
  MB = new MapButton( "Map Maker",new PVector(width*0.4,height*0.55),new PVector(width*0.2,height*0.05),color(0,255,0) );
  
  MSB = new MapSelectButton( "Select Map",new PVector(width*0.4,height*0.8),new PVector(width*0.2,height*0.05),color(255,172,62) );
  LMB = new LeftMapButton( "<-",new PVector(width*0.1,height*0.3),new PVector(width*0.05,height*0.3),color(255,172,62) );
  RMB = new RightMapButton( "->",new PVector(width*0.85,height*0.3),new PVector(width*0.05,height*0.3),color(255,172,62) );
  
  RB = new ResetButton( "Reset",new PVector(width-grid*8,height-grid*2),new PVector(grid*4,grid*2),color(255,0,255) );
  CB = new ClearButton( "Clear All",new PVector(width-grid*12,height-grid*2),new PVector(grid*4,grid*2),color(255,255,0) );
  SB = new SaveButton( "Save",new PVector(width-grid*4,height-grid*2),new PVector(grid*4,grid*2),color(0,255,255) );
  EB = new ExitButton( "Exit",new PVector(width-grid*16,height-grid*2),new PVector(grid*4,grid*2),color(0,255,255) );
  g2rB = new G2RButton( "",new PVector(0,height-grid*2),new PVector(grid*5,grid*2),color(100) );
  
  tableSetup();
}//end setup

ArrayList<Engine>play1 = new ArrayList<Engine>();
ArrayList<Engine>play2 = new ArrayList<Engine>();

int[] select1 = {0,1,0};
int[] select2 = {2,0,2};

Table table;

ArrayList<Track> greenTrack = new ArrayList<Track>();
ArrayList<Track> redTrack = new ArrayList<Track>();

ArrayList<Projectile> fire1 = new ArrayList<Projectile>();
ArrayList<Projectile> fire2 = new ArrayList<Projectile>();

float timeDelta = 1.0f / 60.0f;
int grid;

PVector test;
PVector mouse;

int testHit;

int gameMode;
int versusStage;
int map;
float scale;
float thrust;

int saveConfirm;

int s1, s2;

boolean g2r;
boolean mapSelect;
boolean help;

int weaponCount;
float brake;

VersusButton VB;
MapButton MB;

MapSelectButton MSB;
LeftMapButton LMB;
RightMapButton RMB;

ResetButton RB;
ClearButton CB;
SaveButton SB;
ExitButton EB;
G2RButton g2rB;

void draw()
{
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
          
          displayCarriage("Player 1", new PVector(width*0.4-height*0.15,height*0.2),select1,s1);
          displayCarriage("Player 2", new PVector(width*0.6,height*0.2),select2,s2);
          
          textAlign(CENTER,CENTER);
          textSize(scale * 0.04);
          fill(255);
          text("W\nA S D",width*0.32,   height * 0.775);
          text("ARROW\nKEYS",width*0.68,   height * 0.775);
          text("Press e to continue",width*0.5,   height * 0.95);
          
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
          
          textAlign(CENTER,CENTER);
          textSize(scale * 0.1);
          fill(255);
          
          if(valid(greenTrack) && valid(redTrack))
          {
            text("Map " + (map+1),width/2,height * 0.15);
          }//end if
          else
          {
            text("Invalid Map",width/2,height * 0.15);
          }//end else
          
          textAlign(CENTER,CENTER);
          textSize(scale * 0.04);
          fill(255);
          text("A/LEFT\n<-",width*0.32,   height * 0.8);
          text("D/RIGHT\n->",width*0.68,   height * 0.8);
          text("Press e to continue",width*0.5,   height * 0.95);
          
          break;
        }//end case
        case 2:
        {
          background(50);
        
          displayTrack();
          
          allFire();
          collision();
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
          
          if(help)
          {
            displayHelp();
          }//end if
          else
          {
            textAlign(LEFT,BOTTOM);
            textSize(scale * 0.025);
            fill(255);
            text("Press H - help",0,height  );
          }//end if

          if(defeatCheck(play1) || defeatCheck(play2))
          {
            versusStage = 3;
          }//end if
          
          break;
        }//end case
        case 3:
        {
          background(50);
        
          displayTrack();
          
          allFire();
          
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
          
          textAlign(CENTER,CENTER);
          textSize(scale * 0.1);
          fill(255);
          
          if(defeatCheck(play1))
          {
            text("Player 2 Wins!",width*0.5,height*0.3);
            
            for (int i = play2.size() - 1; i > -1; i--) 
            {
              Engine tempEng = play1.get(i);
              tempEng.accel = thrust * 5;
              tempEng.update();
              tempEng.trigger(random(0,TWO_PI),fire2);
            }//end for
          }//end if
          else
          {
            text("Player 1 Wins!",width*0.5,height*0.3);
            
            for (int i = play1.size() - 1; i > -1; i--) 
            {
              Engine tempEng = play1.get(i);
              tempEng.accel = thrust * 5;
              tempEng.update();
              tempEng.trigger(random(0,TWO_PI),fire1);
            }//end for
          }//end else
          
          textAlign(CENTER,CENTER);
          textSize(scale * 0.04);
          fill(255);
          text("Press Q to return to menu",width*0.5,   height * 0.90);
          text("Press Space to restart",width*0.5,   height * 0.95);
          
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
        textAlign(CENTER,CENTER);
        textSize(scale * 0.1);
        fill(255);
        text("Map " + (map+1),width/2,height * 0.15);
        
        MSB.render();
        LMB.render();
        RMB.render();
        
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
}//end draw