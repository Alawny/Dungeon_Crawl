boolean w, s, a, d, e, q, x, b, minefield, upkey, downkey, leftkey, rightkey, mapkey, swapkey, spacekey, ZAWARUDO, enter;

void keyPressed () {
  if (keyCode == 'w' || keyCode == 'W')    w         = true;
  if (keyCode == 's' || keyCode == 'S')    s         = true;
  if (keyCode == 'a' || keyCode == 'A')    a         = true;
  if (keyCode == 'd' || keyCode == 'D')    d         = true;
  if (keyCode == 'm' || keyCode == 'M')    mapkey    = true;
  if (keyCode == 'p' || keyCode == 'P')    swapkey   = true;
  if (keyCode == UP)                       upkey     = true;
  if (keyCode == DOWN)                     downkey   = true;
  if (keyCode == LEFT)                     leftkey   = true;
  if (keyCode == RIGHT)                    rightkey  = true;
  if (keyCode == ' ')                      spacekey  = true;
  if (keyCode == 'e' || keyCode == 'E')    e         = true;
  if (keyCode == 'q' || keyCode == 'Q')    q         = true;
  if (keyCode == 'x' || keyCode == 'X')    x         = true;
  if (keyCode == 'b' || keyCode == 'B')    b         = true;
  if (keyCode == 'r' || keyCode == 'R')     ZAWARUDO = true;
  if (keyCode == 'r' || keyCode == 'R')    minefield = true;
  if (keyCode == ENTER)                        enter = true;
}



void keyReleased () {
  if (keyCode == 'w' || keyCode == 'W')    w         = false;
  if (keyCode == 's' || keyCode == 'S')    s         = false;
  if (keyCode == 'a' || keyCode == 'A')    a         = false;
  if (keyCode == 'd' || keyCode == 'D')    d         = false;
  if (keyCode == 'm' || keyCode == 'M')    mapkey    = false;
  if (keyCode == 'p' || keyCode == 'P')    swapkey   = false;
  if (keyCode == UP)                       upkey     = false;
  if (keyCode == DOWN)                     downkey   = false;
  if (keyCode == LEFT)                     leftkey   = false;
  if (keyCode == RIGHT)                    rightkey  = false;
  if (keyCode == ' ')                      spacekey  = false;
  if (keyCode == 'q' || keyCode == 'Q')    q         = false;
  if (keyCode == 'x' || keyCode == 'X')    x         = false;
  if (keyCode == 'r' || keyCode == 'R')    minefield = false;
}

void minePressed() {
  int e = 0;
  if (minefield == true) {
    e++;
  }

  if (e >= 1) {
    minefield = false;
  }
}

void timePressed() {
  if (ZAWARUDO == true && skillCDR < 1000) {
    ZAWARUDO = false;
  }
}
