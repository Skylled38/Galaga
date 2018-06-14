import java.util.Comparator;



class NewWindow extends PApplet {
  int sizeX, sizeY;
  String text;

  public NewWindow(int x, int y, String n) {
    super();
    sizeX = x;
    sizeY = y;
    text = n;

    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(sizeX, sizeY);
    noSmooth();
  }
  public void setup() { 
    frameRate(60);
    surface.setSize(sizeX, sizeY);

    PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
    PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
    smoothCanvas.getFrame().removeNotify();
    smoothCanvas.getFrame().setUndecorated(true);
    smoothCanvas.getFrame().setLocation((displayWidth-width)/2, (displayHeight-height)/2);
    smoothCanvas.getFrame().setAlwaysOnTop(true);
    smoothCanvas.getFrame().addNotify();

    surface.setSize(sizeX, sizeY);
  }



  public void draw() {
    guiWin();

    if (text.equals("#load")) {
      load();
    } else {
      fill(0);
      stroke(0);
      textSize(12);
      textAlign(LEFT, LEFT);
      text(text, 8, 40, width-8, height);
    }
  }
  
  
  
  void load(){
    image(pic, 8, 25, 584, 584);
    textAlign(CENTER, CENTER);
    fill(0);
    stroke(0);
    textSize(18);
    text("Welcome to this programm", 300, 750);
  }



  void guiWin() {
    background(255);

    //tour
    fill(255);
    if (focused) {
      stroke(0);
    } else {
      stroke(210);
    }
    rect(0, 0, width-1, height-1);

    int couleur;
    if (focused) {
      if (!move) {
        couleur = #2196f3;
      } else {
        couleur = #2fafff;
      }
    } else {
      couleur = 210;
    }


    //ruban
    stroke(couleur);
    fill(couleur);
    rect(0, 0, width, 25);


    //-----------------------------------buttons draw-------------------------------
    //bouton close
    textAlign(CENTER, CENTER);
    textSize(14);
    if (mouseX >= width-40 && mouseY <= 25) {
      stroke(#ff0000);
      fill(#ff0000);
      rect(width-40, 0, 40, 25);
    } else {
      stroke(couleur);
      fill(couleur);
      rect(width-40, 0, 40, 25);
    }
    fill(255);
    stroke(255);
    text("X", width-20, 12);


    //titre
    fill(255);
    stroke(255);
    textSize(18);
    textAlign(LEFT, CENTER);
    text("Warning", 8, 10);


    //------------------------actions-----------------------------
    if (mouseButton == LEFT && mouseX >= width-40 && mouseY <= 25) {
      if (text.contains("A new version is available !")) {
        link("https://drive.google.com/drive/folders/1GNYkEbsscpjVCZp_jUJrw4QmgtNaWDkD?usp=sharing");
      }
      mouseButton = 0;
      PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
      PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
      smoothCanvas.getFrame().removeNotify();
      smoothCanvas = null;
    }
  }


  void mouseDragged() {
    if ((mouseY < 25 && mouseX < width-40) || move) {
      if (!move) {
        clickPos[0] = mouseX;
        clickPos[1] = mouseY;
        move = true;
      }
      Point mouse;
      mouse = MouseInfo.getPointerInfo().getLocation();
      surface.setLocation(mouse.x - clickPos[0], mouse.y - clickPos[1]);
    }
  }

  void mouseReleased() {
    move = false;
  }
}
