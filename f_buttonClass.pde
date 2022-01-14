class Button {

  //{INSTANCE VARIABLES}============================================================================================================================================================================

  float   x;
  float   y;
  float   w;
  float   h;
  String  text;
  color   normal;
  color   highlight;
  boolean clicked;
  int     curve;
  int     size;
  int     stroke;
  int     strokec;
  float   pcheck;
  int     shopb;

  //{BUTTON CONSTRUCTION}===========================================================================================================================================================================

  Button (String text_, float x_, float y_, float w_, float h_, color normal_, color highlight_, int size_, int curve_, int stroke_, color strokec_, float pcheck_, int shopb_) {

    x          = x_;
    y          = y_;
    w          = w_;
    h          = h_;
    normal     = normal_;
    highlight  = highlight_;
    text       = text_;
    clicked    = false;
    curve      = curve_;
    size       = size_;
    stroke     = stroke_;
    strokec    = strokec_;
    pcheck     = pcheck_;
    shopb      = shopb_;
  }

  //{BEHAVIOUR FUNCTIONS}===========================================================================================================================================================================

  void show () {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);

    if (shopb == 0 || shopb == 1 && mouseX >= x - 100 && mouseX <= x + 100 && mouseY >= y - 100 && mouseY <= y + 100) {
      //fill(strokec);
      strokeWeight(stroke);
      if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
        fill(highlight);
      } else {
        fill(normal);
      }

      rect(x, y, w, h, curve);

      if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
        fill(normal);
      } else {
        fill(highlight);
      }
      textSize(size);
      text(text, x, y - pcheck);
    }

    clicked = (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2 && mouseReleased);
  }
}

//{FUNCTION FOR MOUSERELEASED}====================================================================================================================================================================
void click () {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
