int minimized = 0;
int maximized = 1;
int windowed = 2;
int state = windowed;
int[] size = new int[4];



class menuBar {
  boolean minimize, maximize;
  
  public menuBar(boolean min, boolean max) {
    minimize = min;
    maximize = max;
  }

  public void show() {
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


    //bouton min/max
    if (maximize) {
      if (mouseX >= width-80 && mouseX < width-40 && mouseY <= 25) {
        stroke(240);
        fill(240);
        rect(width-80, 0, 40, 25);
        fill(0);
        stroke(0);
      } else {
        stroke(couleur);
        fill(couleur);
        rect(width-80, 0, 40, 25);
        fill(255);
        stroke(255);
      }
      if (state == maximized) {
        text(new String(Character.toChars(unhex("25a1"))), width-60, 12);
      }
      if (state == windowed || state == minimized) {
        text(new String(Character.toChars(unhex("2639"))), width-60, 12);
      }
    }
    if(!maximize){
      fill(couleur);
      stroke(couleur);
      rect(width-80, 0, 40, 25);
    }
      


    //minimize
    if (minimize) {
      if (mouseX >= width-120 && mouseX < width-80 && mouseY <= 25) {
        stroke(240);
        fill(240);
        rect(width-120, 0, 40, 25);
        fill(0);
        stroke(0);
      } else {
        stroke(couleur);
        fill(couleur);
        rect(width-120, 0, 40, 25);
        fill(255);
        stroke(255);
      }
      if (state == minimized) {
        text("+", width-100, 12);
      }
      if (state != minimized) {
        text("-", width-100, 12);
      }
    }


    //titre
    fill(255);
    stroke(255);
    textSize(18);
    textAlign(LEFT, CENTER);
    text("TextEditor", 8, 12);


    //move square
    if (state == windowed) {
      fill(couleur);
      stroke(couleur);
      rect(width-15, height-15, 13, 13);
    }
    
    
    //------------------------actions-----------------------------
    if(mouseButton == LEFT && mouseX >= width-40 && mouseY <= 25) {
      exit();
    }
    
    if (mouseX >= width-80 && mouseX < width-40 && mouseY <= 25 && mouseButton == LEFT && state == windowed) {
      mouseButton = 0;
      size[0] = displayWidth;
      size[1] = displayHeight;
      size[2] = 0;
      size[3] = 0;
      state = maximized;
    }
    if (mouseX >= width-80 && mouseX < width-40 && mouseY <= 25 && mouseButton == LEFT && state == maximized) {
      mouseButton = 0;
      size[0] = 600;
      size[1] = 900;
      size[2] = (displayWidth-600)/2;
      size[3] = (displayHeight-900)/2;
      state = windowed;
    }
  }
/*
  boolean reduce() {
    if (mouseX >= width-120 && mouseX < width-80 && mouseY <= 25 && mouseButton == LEFT && state != minimized) {
      mouseButton = 0;
      return true;
    } else {
      mouseButton = 0;
      return false;
    }
  }

  boolean visible() {
    if (mouseX >= width-120 && mouseX < width-80 && mouseY <= 25 && mouseButton == LEFT && state == minimized) {
      mouseButton = 0;
      return true;
    } else {
      mouseButton = 0;
      return false;
    }
  }*/
}
