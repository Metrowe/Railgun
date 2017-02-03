void loadData()
{
  //Table t = loadTable("data/default.csv", "header");
  Table t = loadTable("data/new.csv", "header");
  
  greenTrack.clear();
  redTrack.clear();
  
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    
    if(row.getInt("1x") > -1)
    {
      Track local = new Track(  new PVector(row.getInt("1x"),row.getInt("1y"))  );
      greenTrack.add(local);
    }//end if
    
    if(row.getInt("2x") > -1)
    {
      Track local = new Track(  new PVector(row.getInt("2x"),row.getInt("2y"))  );
      redTrack.add(local);
    }//end if
      
   }//end for
    
}//end loadData

/*
  Track(TableRow row)
  {
    loc = new PVector(row.getInt("1x"),row.getInt("1y"));
  }//end Star 
  */

void tableSetup()
{
  table = new Table();
  
  table.addColumn("1x");
  table.addColumn("1y");
  table.addColumn("2x");
  table.addColumn("2y");
  
  
}//end tableSetup

void newRow(PVector in1, PVector in2)
{
  TableRow tempRow = table.addRow();
  
  tempRow.setInt("1x", int(in1.x)  );
  tempRow.setInt("1y", int(in1.y)  );

  tempRow.setInt("2x", int(in2.x)  );
  tempRow.setInt("2y", int(in2.y)  );

}//end newRow

void saveTrack()
{
  tableSetup();
  int i = 0;
  
  //for (int i = 0;i < redTrack.size();i++) 
  while(i < redTrack.size() || i < greenTrack.size())
  {
    PVector greenIn, redIn;
    
    println("i                 = " + i);
    println("greenTrack.size() = " + greenTrack.size() );
    
    if(i < greenTrack.size())
    {
      Track greenTemp = greenTrack.get(i);
      greenIn = greenTemp.loc;
    }
    else
    {
      greenIn = new PVector(-1,-1);
    }
   
   
    if(i < redTrack.size())
    {
      Track redTemp = redTrack.get(i);
      redIn = redTemp.loc;
    }
    else
    {
      redIn = new PVector(-1,-1);
    }
    
    println("i = " + i);
    newRow(greenIn,redIn);
    
    i++;
  }//end for
  saveTable(table, "data/new.csv");
}//end saveTrack