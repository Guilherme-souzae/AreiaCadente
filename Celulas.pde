class Cell
{
  int i, j;
  color cor;
  int index;
  float density;
  
  Cell(int i, int j)
  {
    this.i = i;
    this.j = j;
    cor = color(0);
    index = 0;
    density = 0;
  }
  
  void show()
  {
    float x = j*w;
    float y = i*w;
    
    noStroke();
    fill(cor);
    rect(x,y,w,w);
  }
  
  void act() { }
}

class SandCell extends FallingCell
{
  SandCell(int i, int j)
  {
    super(i,j);
    cor = color(255,255,0);
    index = 1;
    density = 5;
  }
}

class WaterCell extends LiquidCell
{
  WaterCell(int i, int j)
  {
    super(i, j);
    cor = color(0, 0, 255);
    index = 2;
    density = 2;
  }
}

class StoneCell extends ElementCell
{
  StoneCell(int i, int j)
  {
    super(i, j);
    cor = color(150);
    index = 3;
    density = 999;
  }
}

class OilCell extends LiquidCell
{
  OilCell(int i, int j)
  {
    super(i, j);
    cor = color(100,120,0);
    index = 4;
    density = 1;
  }
}

class FoamCell extends FallingCell
{
  FoamCell(int i, int j)
  {
    super(i, j);
    cor = color (255);
    index = 5;
    density = 1.5;
  }
}

class SmokeCell extends GasCell
{
  SmokeCell(int i, int j)
  {
    super(i, j);
    cor = color(150);
    index = 6;
    density = 0.01;
  }
}

class ConfettiCell extends FallingCell
{
  ConfettiCell(int i, int j)
  {
    super(i, j);
    cor = color(floor(random(256)),floor(random(256)),floor(random(256)));
    index = 7;
    density = 0.1;
  }
}

class FireCell extends GasCell
{
  int lifetime;
  FireCell(int i, int j)
  {
    super(i, j);
    cor = color(200,100,0);
    index = 8;
    density = 0.001;
    lifetime = 5;
  }
  
  @Override
  void act()
  {
    lifetime -= 1;
    
    if (lifetime <= 0)
      mainGrid.gridSetter(i, j, 0);
    
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
