class insertImage
{
  float PosX;
  float PosY;
  float SizeX;
  float SizeY;
  PImage Insert;
  int Layer;
  insertImage()
  {
    PosX=500;
    PosY=500;
    SizeX=100;
    SizeY=100;
    Insert=FileSelected;
  }
  insertImage(float _PosX, float _PosY, float _SizeX, float _SizeY, PImage  _Insert, int _Layer)
  {
    PosX=_PosX;
    PosY=_PosY;
    SizeX=_SizeX;
    SizeY=_SizeY;
    Insert = _Insert;
    Layer = _Layer;
  }
  void draw()
  {
    image(Insert, PosX, PosY, SizeX, SizeY);
  }
}
