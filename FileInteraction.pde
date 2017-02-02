void loadData()
{
  //Table t = loadTable("data/default.csv", "header");
  Table t = loadTable("data/new.csv", "header");
  
  for(int i = 0 ; i < t.getRowCount(); i ++)
  {
    TableRow row = t.getRow(i);
    Track local = new Track(row);
    greenTrack.add(local);
  }//end for
}//end loadData

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
    Track greenTemp = greenTrack.get(i);
    Track redTemp = redTrack.get(i);
    
    newRow(greenTemp.loc,redTemp.loc);
  }//end for
  saveTable(table, "data/new.csv");
}//end saveTrack