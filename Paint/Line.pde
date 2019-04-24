class Line
{
  ArrayList<PVector>  points;
  color Color;
  float  Width; 
  int Layer;
  Line()
  {
    Color=color(0);
    Width =5;
    points= new ArrayList();
  }
  Line(color _c, float _w, ArrayList<PVector>_temp, int _Layer)
  {
    points =_temp;
    Color=_c;
    Width=_w;
    Layer= _Layer;
  }
}
