void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    try
    {
      salvarEstado("savestate.txt");
    } catch (Exception e) 
    {
      println("Ermac: " + e.getMessage());
    };
  }
  else if (key == 'l' || key == 'L')
  {
    try
    {
      carregarEstado("savestate.txt");
    } 
    catch (Exception e)
    {
      println("Ermac: " + e.getMessage());
    }
  }
}

void salvarEstado(String filename)
{
  PrintWriter cursor = createWriter(filename);
  Cell[][] state = mainGrid.getterToSaveState();
  
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      cursor.print(state[i][j].index);
      
      if (j < cols - 1)
        cursor.print(", ");
    }
    
    cursor.println();
  }
  
  cursor.flush();
  cursor.close();
}

void carregarEstado(String fileName) 
{
  String[] linhas = loadStrings(fileName);
  Cell[][] state = new Cell[rows][cols];
  
  for (int i = 0; i < rows; i++) 
  {
    String[] valores = split(linhas[i], ", ");
    for (int j = 0; j < cols; j++) 
    {
      state[i][j] = analisarIndice(i,j,int(valores[j]));
    }
  }
  
  mainGrid.setterToSaveState(state);
}
