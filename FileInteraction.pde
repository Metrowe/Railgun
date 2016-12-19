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
  
}//end tableSetup

void newRow(PVector in)
{
  TableRow tempRow = table.addRow();
  tempRow.setInt("1x", int(in.x)  );
  tempRow.setInt("1y", int(in.y)  );
}//end newRow

void saveTrack()
{
  tableSetup();
  for (int i = 0;i < redTrack.size();i++) 
  {
    Track tempTrack = redTrack.get(i);
    newRow(tempTrack.loc);
  }//end for
  saveTable(table, "data/new.csv");
}//end saveTrack