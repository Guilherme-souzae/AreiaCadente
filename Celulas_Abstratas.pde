abstract class ElementCell extends Cell
{
  ElementCell(int i, int j)
  {
    super(i, j);
  }
}

abstract class FallingCell extends ElementCell
{
  FallingCell(int i, int j)
  {
    super(i,j);
  }
  
  @Override
  void act()
  {
    if (mainGrid.isLight(i,j,i+1,j))
    {
      mainGrid.swap(i, j, i + 1, j);
    }
    else if (mainGrid.isLight(i,j,i+1,j+1) && mainGrid.isLight(i,j,i,j+1) && mainGrid.isLight(i,j,i+1,j-1) && mainGrid.isLight(i,j,i,j-1))
    {
      if (floor(random(2)) == 0)
      {
        mainGrid.swap(i, j, i + 1, j + 1);
      }
      else
      {
        mainGrid.swap(i, j, i + 1, j - 1);
      }
    }
    else if (mainGrid.isLight(i,j,i+1,j+1) && mainGrid.isLight(i,j,i,j+1))
    {
      mainGrid.swap(i, j, i + 1, j + 1);
    }
    else if (mainGrid.isLight(i,j,i+1,j-1) && mainGrid.isLight(i,j,i,j-1))
    {
      mainGrid.swap(i, j, i + 1, j - 1);
    }
  }
}

abstract class LiquidCell extends ElementCell
{
  LiquidCell(int i, int j)
  {
    super(i, j);
  }
  
  @Override
  void act()
  {
    if (mainGrid.isLight(i,j,i+1,j))
    {
      mainGrid.swap(i, j, i + 1, j);
    }
    else if (mainGrid.isLight(i,j,i,j+1) && mainGrid.isLight(i,j,i,j-1))
    {
      if (floor(random(2)) == 0)
      {
        mainGrid.swap(i, j, i, j + 1);
      }
      else
      {
        mainGrid.swap(i, j, i, j - 1);
      }
    }
    else if (mainGrid.isLight(i,j,i,j+1))
    {
      mainGrid.swap(i, j, i, j + 1);
    }
    else if (mainGrid.isLight(i,j,i,j-1))
    {
      mainGrid.swap(i, j, i, j - 1);
    }
  }
}

abstract class GasCell extends ElementCell
{
  GasCell(int i, int j)
  {
    super(i, j);
  }
  
  @Override
  void act()
  {
    if (mainGrid.isLight(i,j,i-1,j))
    {
      mainGrid.swap(i, j, i - 1, j);
    }
    else if (mainGrid.isLight(i,j,i,j+1) && mainGrid.isLight(i,j,i,j-1))
    {
      if (floor(random(2)) == 0)
      {
        mainGrid.swap(i, j, i, j + 1);
      }
      else
      {
        mainGrid.swap(i, j, i, j - 1);
      }
    }
    else if (mainGrid.isLight(i,j,i,j+1))
    {
      mainGrid.swap(i, j, i, j + 1);
    }
    else if (mainGrid.isLight(i,j,i,j-1))
    {
      mainGrid.swap(i, j, i, j - 1);
    }
  }
}
