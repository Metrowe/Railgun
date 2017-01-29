///Test upload aftter hardware failure
void setup()
{
  size(600,600);
  grid = 20;
  xg = width/grid;
  yg = height/grid;
  test = new PVector();//
  mouse = new PVector();//
  
  loadData();
  setDistance(greenTrack);
  tableSetup();
  
  play1 = new Engine(greenTrack);
  
  
  
  //ellipseMode(RADIUS);
}//end setup

Engine play1;
Engine play2;
//ArrayList<Planet> planets = new ArrayList<Planet>();
Table table;


ArrayList<Track> greenTrack = new ArrayList<Track>();
ArrayList<Track> redTrack = new ArrayList<Track>();

float timeDelta = 1.0f / 60.0f;
int grid;
float xg,yg;
PVector test;
PVector mouse;

void draw()
{
  //if(frameCount % 1 == 0)
  //{//////////////////////////////////////////////////////////
  
  background(0);
  displayTrack();
  displayGrid();
  
  //play1.render();
  //play1.update();
  
  if(redTrack.size() > 1)
  {
    play2.render();
    play2.update();
  }//end if
 
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