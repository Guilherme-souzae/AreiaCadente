class Grid
{
  Cell[][] cells; // Matriz principal de celulas
  boolean[][] buffer; // Matriz que armazena se uma determinada celula ja foi atualizada em um loop
  
  private int updtDir; // Valor rotativo que determina a forma como a matriz é percorrida e atualziada
  
  Grid()
  {
    updtDir = 0;
    cells = new Cell[rows][cols];
      
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        cells[i][j] = new Cell(i,j);
  }
  
  // Renderiza todas as celulas
  void render()
  {
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        cells[i][j].show();
  }
  
  // Atualiza todas as celulas
  void update()
  {
    buffer = new boolean[rows][cols];
    
    switch (updtDir)
    {
      case 0:
      for (int i = 0; i < rows; i++)
       for (int j = 0; j < cols; j++)
         if (!buffer[i][j])
           cells[i][j].act();
           
      updtDir += 1;
      break;
            
      case 1:
      for (int i = 0; i < rows; i++)
       for (int j = cols - 1; j >= 0; --j)
         if (!buffer[i][j])
           cells[i][j].act();
      
      updtDir += 1;
      break;
           
      case 2:
      for (int i = rows - 1; i >= 0; --i)
       for (int j = cols - 1; j >= 0; --j)
         if (!buffer[i][j])
           cells[i][j].act();
           
      updtDir += 1;
      break;
      
      case 3:
      for (int i = rows - 1; i >= 0; --i)
       for (int j = 0; j < cols; j++)
         if (!buffer[i][j])
           cells[i][j].act();
           
      updtDir = 0;
      break;
    }
  }
  
  // Aloca uma nova celula na matriz
  void gridSetter(int i, int j, int indice)
  {
    cells[i][j] = analisarIndice(i,j,indice);
  }
  
  // Verifica se duas celulas podem sofrer o Swap
  boolean isLight(int i1, int j1, int i2, int j2)
  {
    try
    {
      if (cells[i1][j1].density > cells[i2][j2].density) return true;
    }
    catch (Exception e) { }
    return false;
  }
  
  // Realiza um swap entre duas celulas
  void swap(int i1, int j1, int i2, int j2)
  {
    try
    {
      buffer[i1][j1] = true;
      buffer[i2][j2] = true;
    
      Cell origin = cells[i1][j1];
      Cell destiny = cells[i2][j2];
    
      origin.i = i2;
      origin.j = j2;
    
      destiny.i = i1;
      destiny.j = j1;
    
      cells[i1][j1] = destiny;
      cells[i2][j2] = origin; 
    }
    catch (Exception e) { }
  }
  
  
  // Ambas as funções servem somente como getters e setters para permitir a implementação de save states
  Cell[][] getterToSaveState()
  {
    return cells;
  }
  
  void setterToSaveState(Cell[][] state)
  {
    cells = state;
  }
}
