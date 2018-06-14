class button {
  String name;
  int posX, posY;
  public button(String n, int x, int y) {
    name = n;
    posX = x;
    posY = y;
  }

  public void display() {
    int couleur = 0;
    textSize(12);

    if (focused) {
      if ((mouseX >= posX && mouseX <= textWidth(name)+posX+16 && mouseY >= posY && mouseY <= posY+25) || move) {
        couleur = #2fafff;
      } else {
        couleur = #2196f3;
      }
    } else {
      couleur = 210;
    }
    fill(couleur);
    stroke(couleur);
    rect(posX, posY, textWidth(name)+16, 25);

    if (focused) {
      fill(255);
      stroke(255);
    } else {
      fill(0);
      stroke(0);
    }
    textAlign(LEFT, CENTER);
    textSize(12);
    text(name, posX+8, posY+ (textDescent() + textAscent())*3/4);
  }

  boolean isPressed() {
    if (mouseButton == LEFT && mouseX >= posX && mouseX <= posX+textWidth(name)+16 && mouseY >= posY && mouseY <= posY+25) {
      mouseButton = 0;
      return true;
    } else {
      return false;
    }
  }
}
