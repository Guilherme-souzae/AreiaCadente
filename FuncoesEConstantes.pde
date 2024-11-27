// constantes
final int w = 10;
int rows, cols;

int atual = 0; // representa a celula atual a ser colocada
final int maxTipos = 8; // representa a quantidade maxima de tipos

Cell analisarIndice(int i, int j, int value) // Função auxiliar
{
  switch (value)
  {
    case 1:
      return new SandCell(i,j);
    case 2:
      return new WaterCell(i,j);
    case 3:
      return new StoneCell(i, j);
    case 4:
      return new OilCell(i, j);
    case 5:
      return new FoamCell(i,j);
    case 6:
      return new SmokeCell(i,j);
    case 7:
      return new ConfettiCell(i,j);
    case 8:
      return new FireCell(i, j);
    default:
      return new Cell(i,j);
  }
}
