PImage pic;

menuBar principal;
button newFile, saveFile, openFile, test;
toast toast, wel, bug;

float actuVers = 1.180614;

NewWindow newVers, alert, load;


void settings() {
  size(600, 900);
  size[0] = 600;
  size[1] = 900;
  size[2] = (displayWidth-width)/2;
  size[3] = (displayHeight-height)/2;
}

void setup() {
  frameRate(60);
  noSmooth();
  
  pic = loadImage("data/drawable/logo.png");

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().removeNotify();
  smoothCanvas.getFrame().setUndecorated(true);
  smoothCanvas.getFrame().setLocation((displayWidth-width)/2, (displayHeight-height)/2);
  smoothCanvas.getFrame().addNotify();

  surface.setLocation((displayWidth-width)/2, (displayHeight-height)/2);
  checkPosition();
  principal = new menuBar(true, true);

  newFile = new button("New file", 0, 25);
  saveFile = new button("Save file", int(textWidth("New file"))+16, 25);
  openFile = new button("Open file", int(textWidth("New file"))+16+int(textWidth("Save file"))+16, 25);
  
  //load = new NewWindow(600, 900, "#load");

  toast = new toast("Please wait while loading...", 1000);

  String[] stri = loadStrings("data.txt");

  if (!stri[0].equals(str(actuVers))) {
    newVers = new NewWindow(250, 250, "What's new ?\n\n\n    - A way to update your version (popup when new version available),\n    - Debugged window bar & movement,\n    - Short messages");
    String strin[] = new String[1];
    strin[0] = str(actuVers);
    saveStrings("data.txt", strin);
  }

  String vers[] = loadStrings("http://skylled38.000webhostapp.com/vers.html");
  if (float(vers[0]) != actuVers) {
    newVers = new NewWindow(300, 300, "A new version is available !\n\nActual version : "+ actuVers + "\nAvailable version : " + vers[0] + "\n\n\nClose this window to open the Drive folder and download it ;) !");
  } else {
    alert = new NewWindow(300, 300, "    PLEASE CONSIDER THIS IS A DEVELOPPEMENT VERSION !\n\n    All included features might be buggy, please don't throw me tomatoes please :(\n\n    And I know there are NO comments, but they will arrive soon (maybe).");
  }
}



void draw() {
  surface.setSize(size[0], size[1]);
  surface.setLocation(size[2], size[3]);
  gui();

  principal.show();

  newFile.display();
  saveFile.display();
  openFile.display();

  if (newFile.isPressed()) {
    enteredText = "";
    toast = new toast("New file created", 1000);
  }
  if (saveFile.isPressed()) {
    String[] str = split(enteredText, '\n');
    saveStrings("file.txt", str);
    toast = new toast("File saved", 1000);
  }
  if (openFile.isPressed()) {
    String[] str = loadStrings("file.txt");
    enteredText = "";
    for (int i=0; i<str.length; i++) {
      if (i==0) {
        enteredText = str[0];
      } else {
        enteredText += "\n"+str[i];
      }
    }
    toast = new toast("File opened", 1000);
  }


  changeSize(); 

  fill(0); 
  stroke(0); 
  textSize(12); 
  textAlign(LEFT, LEFT); 
  if (int(millis()/1000)%2 == 0) {
    text(enteredText+"_", 5, 60, width, height);
  } else {
    text(enteredText, 5, 60, width, height);
  }

  if (mouseX > width-15 && mouseY > height -15 && state == windowed) {
    cursor(MOVE);
  } else {
    cursor(ARROW);
  }
}
