import javax.swing.JFrame;
import processing.awt.PSurfaceAWT;
import java.util.Comparator;



class toast extends PApplet {
  String t;
  int time, duree;

  public toast(String text, int d) {
    t = text;
    time = millis();
    duree = d;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }


  public void settings() {
    size(200, 200);
  }

  void setup() {
    if (textWidth(t)+16>128) {
      if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
        surface.setSize(int(textWidth(t)+16), int((textDescent()+30)*findCharOccurs(t, "\n")+20));
      } else {
        surface.setSize(int(textWidth(t)+16), 128);
      }
    } else {
      if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
        surface.setSize(200, int((textDescent()+30)*findCharOccurs(t, "\n")+20));
      } else {
        surface.setSize(200, 128);
      }
    }

    PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
    PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
    JFrame jframe = (JFrame)smoothCanvas.getFrame();
    smoothCanvas.getFrame().removeNotify();
    smoothCanvas.getFrame().setUndecorated(true);
    smoothCanvas.getFrame().setLocation((displayWidth-width)/2, displayHeight-200);
    smoothCanvas.getFrame().setAlwaysOnTop(true);
    jframe.setOpacity(0.0f);
    smoothCanvas.getFrame().addNotify();

    if (textWidth(t)+16>128) {
      if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
        surface.setSize(int(textWidth(t)+16), int((textDescent()+30)*findCharOccurs(t, "\n")+20));
      } else {
        surface.setSize(int(textWidth(t)+16), 128);
      }
    } else {
      if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
        surface.setSize(200, int((textDescent()+30)*findCharOccurs(t, "\n")+20));
      } else {
        surface.setSize(200, 128);
      }
    }
  }

  void draw() {
    PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
    PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
    JFrame jframe = (JFrame)smoothCanvas.getFrame();

    float opacity = 0;

    while (true) {

      if (textWidth(t)+16>128) {
        surface.setLocation(size[2]+(size[0]/2)-int(textWidth(t)+16)/2, size[3]+size[1]-150);
        if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
          surface.setSize(int(textWidth(t)+16), int((textDescent()+30)*findCharOccurs(t, "\n")+20));
        } else {
          surface.setSize(int(textWidth(t)+16), 128);
        }
      } else {
        if ((textDescent()+30)*findCharOccurs(t, "\n")+20 > 128) {
          surface.setSize(200, int((textDescent()+30)*findCharOccurs(t, "\n")+20));
        } else {
          surface.setLocation(size[2]+(size[0]/2)-100, size[3]+size[1]-150);
          surface.setSize(200, 128);
        }
      }

      background(255);
      fill(0);
      stroke(0);

      rect((width-int(textWidth(t)+16))/2, (height-((textDescent()+30)*findCharOccurs(t, "\n"))-20)/2, int(textWidth(t)+15), (textDescent()+30)*findCharOccurs(t, "\n")+20, 15);
      fill(255);
      stroke(255);
      textAlign(CENTER, CENTER);
      textSize(12);
      text(t, width/2, height/2);

      if (millis() < time+550) {
        opacity += 0.01;
      }
      if (millis() > time+duree+500 && millis() < time+duree+900) {
        opacity -= 0.01;
      }
      if (millis() > time+duree+900) {
        awtSurface = (PSurfaceAWT)surface;
        smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
        smoothCanvas.getFrame().removeNotify();
        smoothCanvas = null;
      }

      if (0 <= opacity && opacity <= 1) {
        jframe.setOpacity(opacity);
      }

      delay(5);
    }
  }



  int findCharOccurs(String s, String ch) {
    int n = 0, idx = -1;
    while ((idx = s.indexOf(ch, idx + 1)) >= 0)  ++n;
    return n;
  }
}
