import java.awt.MouseInfo;
import java.awt.Point;

void windowPosition() {
  Point mouse;
  mouse = MouseInfo.getPointerInfo().getLocation();
  surface.setLocation(mouse.x - clickPos[0], mouse.y - clickPos[1]);
  size[2] = mouse.x - clickPos[0];
  size[3] = mouse.y - clickPos[1];
}


void checkPosition() {
  int x = getJFrame(getSurface()).getX();
  int y = getJFrame(getSurface()).getY(); 
  if (x < 0) {
    surface.setLocation(0, y);
  }
  if (x >= displayWidth) {
    surface.setLocation(displayWidth - 5, y);
  }

  if (y < 0) {
    surface.setLocation(x, 0);
  }
  if (y >= displayHeight) {
    surface.setLocation(x, displayHeight - 5);
  }
}



static final javax.swing.JFrame getJFrame(final PSurface surf) {
  return
    (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
}



void changeSize() {
  if (drag) {
    size[0] = mouseX;
    size[1] = mouseY;

    if (size[0] < 250) {
      size[0] = 250;
    }
    if (size[1] < 128) {
      size[1] = 128;
    }
  }
}
