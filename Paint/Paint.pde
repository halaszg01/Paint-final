Button b=new Button(50, 100, color(255, 0, 0));
Button green = new Button(50, 200, color(0, 255, 0));
Button Blue = new Button(50, 300, color(0, 0, 255));
Button Purple = new Button(50, 400, color(255, 0, 255));
Button Yellow = new Button(50, 500, color(255, 255, 0));
Button Save= new Button(250, 50, color(0));
Button Erase = new Button(150, 50, color(255));
Button imageInsert = new Button(350, 50, color(200, 200, 200, 250));
Button Black = new Button(50, 600, color(0));
ArrayList<ArrayList<PVector>> points= new ArrayList();
ArrayList<PVector> temp = new ArrayList();
ArrayList<Line> _lines_= new ArrayList();
ArrayList<insertImage> loadedImages = new ArrayList();
boolean mouseDown=false;
color currentColor=color(0);
PImage save;
PImage FileSelected;
PImage Insert;
PImage LoadIcon;
insertImage _IMG;
float fileSelectedSize = 50;
int Brushsize=5;
int Layer= 0;
void setup()
{
  save=loadImage("images.png");
  LoadIcon = loadImage("Picture.png");
  size(800, 800);
  stroke(0);
}
void draw()
{
  image(LoadIcon, 200, 200);
  image(save, 300, 100);
  stroke(currentColor);
  background(255);
  for (int l=0; l<Layer; l++)
  {
    for (insertImage arr : loadedImages)
    {
      if (arr.Layer==l)
      {
        arr.draw();
      }
    }
    for (Line arr : _lines_)
    {
      if (arr.Layer==l)
      {
        for (int i=0; i<arr.points.size(); i++)
        {
          strokeWeight(arr.Width);
          stroke(arr.Color);
          if (i<arr.points.size()-1)
          {
            line(arr.points.get(i).x, arr.points.get(i).y, arr.points.get(i+1).x, arr.points.get(i+1).y);
          }
        }
      }
    }
  }
  fill(currentColor);
  stroke(0);
  strokeWeight(2);
  ellipse(mouseX, mouseY, Brushsize, Brushsize);
  if (mousePressed)
  {
    if (mouseDown ==false&&FileSelected==null)
    {
      mouseDown=true;
      temp= new ArrayList<PVector>();
    }
    if (mouseDown)
    {
      if (!(b.isClicked()||green.isClicked()||Blue.isClicked()||Purple.isClicked()||Yellow.isClicked()||Save.isClicked()))
      {
        if (mouseX>100&&mouseY>100)
        {
          if (FileSelected == null)
          {
            temp.add(new PVector(mouseX, mouseY));
          }
        }
      }
    }
    fill(0, 0, 0);
  }
  if (keyPressed)
  {
    if (key=='b')
    {
      Brushsize-=2;
    }
    if (key=='n')
    {
      Brushsize+=2;
    }
    if (key == '+')
    {
      fileSelectedSize +=1;
    }
    if (key == '-')
    {
      fileSelectedSize -=1;
    }
  }
  if (Brushsize<1)
  {
    Brushsize=1;
  }

  stroke(currentColor);
  for (int i=0; i<temp.size(); i++)
  {

    if (i<temp.size()-1)
    {
      strokeWeight(Brushsize);
      line(temp.get(i).x, temp.get(i).y, temp.get(i+1).x, temp.get(i+1).y);
    }
  }
  fill(200, 200, 200);
  strokeWeight(2);
  noStroke();
  rect(0, 0, width, 100);
  rect(0, 0, 100, height);
  if (mouseX<100||mouseY<100)
  {
    cursor();
  } else
  {
    noCursor();
  }
  b.draw();
  green.draw();
  Blue.draw();
  Purple.draw();
  Yellow.draw();
  Save.draw();
  Erase.draw();
  Black.draw();
  image(LoadIcon, 350, 50);
  LoadIcon.resize(50, 50);
  image(save, 250, 50);
  save.resize(50, 50);
  imageMode(CENTER);
  if (FileSelected!=null)
  {
    image(FileSelected, mouseX, mouseY, fileSelectedSize, fileSelectedSize);
  }
}

void mousePressed()
{
}
void mouseReleased()
{

  if (mouseDown==true)
  {
    mouseDown= false;
    ArrayList<PVector> t = new ArrayList(temp);
    points.add(t);
    _lines_.add(new Line(currentColor, Brushsize, t, Layer++));
    temp= new ArrayList<PVector>();
  }
  if (b.isClicked())
  {   
    currentColor=b.ButtonColor;
  } else if (green.isClicked())
  {
    currentColor=green.ButtonColor;
  } else if (Blue.isClicked())
  {
    currentColor=Blue.ButtonColor;
  } else if (Purple.isClicked())
  {
    currentColor=Purple.ButtonColor;
  } else if (Black.isClicked())
  {
    currentColor = Black.ButtonColor;
  } else if (Yellow.isClicked())
  {
    currentColor=Yellow.ButtonColor;
  } else if (Save.isClicked())
  {
    background(255);
    for (insertImage arr : loadedImages)
    {
      arr.draw();
    }
    for (int i=0; i<temp.size(); i++)
    {
      if (i<temp.size()-1)
      {
        line(temp.get(i).x, temp.get(i).y, temp.get(i+1).x, temp.get(i+1).y);
      }
    }
    for (Line arr : _lines_)
    {
      for (int i=0; i<arr.points.size(); i++)
      {
        strokeWeight(arr.Width);
        stroke(arr.Color);
        if (i<arr.points.size()-1)
        {
          line(arr.points.get(i).x, arr.points.get(i).y, arr.points.get(i+1).x, arr.points.get(i+1).y);
        }
      }
    }
    saveFrame("Draw-#######.png");
  } else if (Erase.isClicked())
  {
    currentColor=Erase.ButtonColor;
  } else if (imageInsert.isClicked())
  {
    selectInput("Select a file to process:", "fileSelected");
  }
  if (FileSelected!= null)
  {
    loadedImages.add(new insertImage(mouseX, mouseY, fileSelectedSize, fileSelectedSize, FileSelected, Layer++));
    FileSelected = null;
  }
}
void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } else 
  {
    println("User selected " + selection.getAbsolutePath());
    FileSelected=loadImage(selection.getAbsolutePath());
    fileSelectedSize= FileSelected.width;
  }
}
