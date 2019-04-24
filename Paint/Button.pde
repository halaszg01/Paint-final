class Button
{
  float posX;
  float posY;
  color ButtonColor;
  Boolean Clicked;

  Button(float _x, float _y, color _ButtonColor)
  {

    posX = _x;
    posY = _y;
    ButtonColor= _ButtonColor;
  }
  void draw()
  {
    strokeWeight(2);
    stroke(0);
    fill(ButtonColor);
    ellipse(posX, posY, 30, 30);
  }  
  boolean isClicked()
  {
    if (dist(mouseX, mouseY, posX, posY)<20)
    {
      return true;
    }
    return false;
  }
}