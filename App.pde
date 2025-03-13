Grid mainGrid; // classe que abstrai os processos das celulas

void setup() // chamada no inicio do processo
{
  size(600,400);
    
  rows = floor(height/w);
  cols = floor(width/w);
  
  mainGrid = new Grid();
}

void draw() // Game loop
{
  background(0);
  mainGrid.update();
  mainGrid.render();
  renderCue();
}

void mouseDragged() // Função de Input
{
  if (mouseButton == LEFT)
  {
    int j = floor(mouseX / w);
    int i = floor(mouseY / w);
    try
    {
      mainGrid.gridSetter(i,j,atual);
    }
    catch (Exception e)
    {
      println("Ermac: " + e.getMessage());
    }
  }
}

void mouseClicked() // Função de Input
{
  if (mouseButton == RIGHT)
  {
    atual = (atual < maxTipos) ? atual + 1 : 0;
  }
}

void renderCue() // Mostra qual a celula atual
{
  Cell aux = analisarIndice(0,0,atual);
  fill(aux.cor);
  rect(mouseX,mouseY,w,w);
}
