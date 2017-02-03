///Test upload aftter hardware failure
void setup()
{
  size(600,600);
  grid = 20;
  xg = width/grid;
  yg = height/grid;
  scale = (width+height)/2;
  gameMode = 0;
  
  test = new PVector();//
  mouse = new PVector();//
  
  VB = new VersusButton( "Versus",new PVector(width*0.5,height*0.4),new PVector(width*0.2,height*0.05),color(255,0,0) );
  MB = new MapButton( "Map Maker",new PVector(width*0.5,height*0.55),new PVector(width*0.2,height*0.05),color(0,255,0) );
  
  tableSetup();
  
  
  
  
  
  //ellipseMode(RADIUS);
}//end setup

Engine play1;
Engine play2;
//ArrayList<Planet> planets = new ArrayList<Planet>();
Table table;


ArrayList<Track> greenTrack = new ArrayList<Track>();
ArrayList<Track> redTrack = new ArrayList<Track>();

ArrayList<Projectile> fire = new ArrayList<Projectile>();

float timeDelta = 1.0f / 60.0f;
int grid;
float xg,yg;
PVector test;
PVector mouse;

int testHit;

int gameMode;
float scale;

boolean g2r;
VersusButton VB;
MapButton MB;
G2RButton g2rB;

void draw()
{
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
      background(50);
      
      displayTrack();
      displayGrid();
      
      allFire();
      
      //println("FireSize = " + fire.size());
      play1.render();
      //play1.update();
      
      play2.render();
      play2.update();
      
      /*
      if(redTrack.size() > 1)
      {
        play2.render();
        play2.update();
      }//end if
     */
     
      if(testHit > 0)///////////////////
      {
        fill(255);
        text("HIT",width*0.5,height*0.1);
        testHit--;
      }//end if///////////////////////
      
      break;
    }//end case 1
    
    case 2:
    {
      background(50);
      
      displayTrack();
      displayGrid();
      //displayHighlight();
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