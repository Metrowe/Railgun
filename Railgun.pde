///Test upload aftter hardware failure
void setup()
{
  size(600,600);
  grid = 20;
  xg = width/grid;
  yg = height/grid;
  test = new PVector();//
  mouse = new PVector();//
  
  gameMode = 0;
  
  loadData();
  setDistance(greenTrack);
  tableSetup();
  
  play1 = new Engine(greenTrack);
  
  scale = (width+height)/2;
  
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


void draw()
{
  //if(frameCount % 1 == 0)
  //{//////////////////////////////////////////////////////////
  
  //background(0);
  
  switch(gameMode)
  {
    case 0:
    {
      background(0);
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
      
      if(redTrack.size() > 1)
      {
        play2.render();
        play2.update();
      }//end if
     
     
      if(testHit > 0)///////////////////
      {
        fill(255);
        text("HIT",width*0.5,height*0.1);
        testHit--;
      }//end if///////////////////////
      
      break;
    }//end case 1
  
  
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