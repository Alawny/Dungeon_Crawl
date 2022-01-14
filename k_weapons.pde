class BasicWax extends Weapon {

  BasicWax() {
    super(WAXTHRESHOLD, WAXSPEED, 0.2);
    teleflamesCheck = 0;
  }
}

class Teleflames extends Weapon {

  Teleflames() {
    super(6, 1, 2);
    teleflamesCheck = 1;
  }

  void shoot () {
    if (shotTimer >= threshold && spacekey == false) {
      for (int i = 0; i < 1; i++) {
        PVector aimVector = new PVector(0, 0);
        if (upkey) {
          aimVector = new PVector(0, -1);
        } 
        if (downkey) {
          aimVector = new PVector(0, 1);
        } 
        if (rightkey) {
          aimVector = new PVector(1, 0);
        } 
        if (leftkey) {
          aimVector = new PVector(-1, 0);
        } 
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, bulletSpeed, 10, 1, 99999, 0));
      }
      shotTimer = 0;
      dimmer = dimmer - cost;
    }
  }
}



class FlameThrower extends Weapon {



  FlameThrower() {
    super(2, 10, 1);
    teleflamesCheck = 0;
  }


  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 2; i++) {
        PVector aimVector = new PVector(0, 0);
        if (upkey) {
          aimVector = new PVector(0, -1);
        } 
        if (downkey) {
          aimVector = new PVector(0, 1);
        } 
        if (rightkey) {
          aimVector = new PVector(1, 0);
        } 
        if (leftkey) {
          aimVector = new PVector(-1, 0);
        } 
        aimVector.rotate((random(-0.35, 0.35))); 
        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, bulletSpeed, 10, 1, dimmer/int(random(8, 14)), 0));
      }
      shotTimer = 0;
      dimmer = dimmer - cost;
    }
  }
}

class RocketLauncher extends Weapon {



  RocketLauncher() {
    super(100, 3, 1);
    teleflamesCheck = 0;
  }


  void shoot() {
    if (shotTimer >= threshold) {
      for (int i = 0; i < 2; i++) {
        PVector aimVector = new PVector(0, 0);
        if (upkey) {
          aimVector = new PVector(0, -1);
        } 
        if (downkey) {
          aimVector = new PVector(0, 1);
        } 
        if (rightkey) {
          aimVector = new PVector(1, 0);
        } 
        if (leftkey) {
          aimVector = new PVector(-1, 0);
        } 

        aimVector.setMag(bulletSpeed);
        myObjects.add(new Bullet(aimVector, bulletSpeed, 10, 1, 100, 2));
      }
      shotTimer = 0;
      dimmer = dimmer - cost;
    }
  }
}







//void hell(float x, float y) {
//  int i = 0;



//  if (eeeeeoee <= 0) {
//    es = false;
//  } else if (eeeeeoee >= 80) {
//    es = true;
//  }


//  if (es) {
//    eeeeeoee--;
//    eeeoe = eeeoe + PI/200;
//  } else { 
//    eeeeeoee++;
//    eeeoe = eeeoe - PI/200;
//  }
//  println(eeeeeoee);
//  eeeeeeeoe++;
//  eeeoee++;

//  if (eeeoee >= 80) {
//    eeeoee = 0;
//  }
//  if (eeeeeeeoe % 12 == 0 && eeeoee >= 30) {
//    while (i < 6) {
//      PVector aimVector = new PVector(0, 0);
//      aimVector = new PVector(1, 0);

//      aimVector.rotate(eeeoe); 
//      aimVector.setMag(4);
//      myObjects.add(new enemyBullet(aimVector, x, y, 3, 500, 5, 25));

//      i++;
//      eeeoe = eeeoe + PI/3;
//    }
//  }
//}



//void explode(float x, float y) {
//  int i = 0;
//  float e = 0;



//  while (i < 32) {
//    PVector aimVector = new PVector(0, 0);
//    aimVector = new PVector(1, 0);

//    aimVector.rotate(e); 
//    aimVector.setMag(4);
//    myObjects.add(new Bullet(aimVector, 10, 10, 1, 99999, 0, x, y));
//    //myObjects.add(new enemyBullet (myBoss.loc.x, myBoss.loc.y, myHero.loc.x - myBoss.loc.x, myHero.loc.y - myBoss.loc.y, 5, 500, 1));

//    i++;
//    e = e + PI/16;
//  }
//}

//void minefield() {
//  int i = 0;
//  float e = 0;
//  int i_ = 0;
//  float e_ = 0;
//  int i__ = 0;
//  float e__ = 0;

//  while (i < 16) {
//    PVector aimVector = new PVector(0, 0);
//    aimVector = new PVector(1, 0);

//    aimVector.rotate(e); 
//    aimVector.setMag(3);
//    myObjects.add(new Bullet(aimVector, 3, 10, 3, 90, 2));

//    i++;
//    e = e + PI/8;
//  }

//  while (i_ < 8) {
//    PVector aimVector = new PVector(0, 0);
//    aimVector = new PVector(1, 0);

//    aimVector.rotate(e_); 
//    aimVector.setMag(2);
//    myObjects.add(new Bullet(aimVector, 2, 10, 3, 90, 2));

//    i_++;
//    e_ = e_ + PI/4;
//  }

//  while (i__ < 4) {
//    PVector aimVector = new PVector(0, 0);
//    aimVector = new PVector(1, 0);

//    aimVector.rotate(e__); 
//    aimVector.setMag(1);
//    myObjects.add(new Bullet(aimVector, 1, 10, 3, 80, 2));

//    i__++;
//    e__ = e__ + PI/2;
//  }
//}
