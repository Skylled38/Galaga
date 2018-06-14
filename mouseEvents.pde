boolean move = false;
int[] clickPos = new int[2];
boolean drag = false;


void mouseClicked() {
}

void mouseReleased() {
  mouseButton = 0;
  checkPosition();
  drag = false;
  move = false;
}



void mouseDragged() {
  if ((mouseY < 25 && mouseX < width-120) || move) {
    if (!move) {
      clickPos[0] = mouseX;
      clickPos[1] = mouseY;
      move = true;
    }
    windowPosition();
  }

  if (mouseX > width-15 &&  mouseY > height-15 && state == windowed) {
    drag = true;
  }
}
