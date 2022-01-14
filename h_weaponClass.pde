class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int x;
  int y;
  float cost;

  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
    cost = 1;
  }

  Weapon(int thr, int bs, float cst) {
    shotTimer = thr;
    threshold = thr;
    bulletSpeed = bs;
    cost = cst;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {



      if (upkey) {
        y = -1;
      } else if (!upkey && !downkey) y = 0;
      if (downkey) {
        y = 1;
      } else if (!upkey && !downkey) y = 0;
      if (rightkey) {
        x = 1;
      } else if (!leftkey && !rightkey) x = 0;
      if (leftkey) {
        x = -1;
      } else if (!leftkey && !rightkey) x = 0;

      myObjects.add(new Bullet(bulletSpeed, WAXDAMAGE*5, x, y, WAXDAMAGE, 99999, 1));

      dimmer = dimmer - cost;

      shotTimer = 0;
    }
  }
}
