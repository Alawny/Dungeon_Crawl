class Hero extends GameObject {
  int dmgTimer;
  int dmgThreshold;
  Weapon myWeapon;
  AnimatedGIF currentAction;

  Hero() {
    super();
    speed = 8;
    roomX = 1;
    roomY = 1;
    size = 50;
    dmgTimer = 0;
    dmgThreshold = 50;
    weapon = BASICWAX;
    currentAction = heroIdleRight;
  }

  void show () {
    if (weapon == BASICWAX) {
      myWeapon = new BasicWax();
      weapon++;
    } else if (weapon == FLAMETHROWER) {
      myWeapon = new FlameThrower();
      weapon++;
    } else if (weapon == TELEFLAMES) {
      myWeapon = new Teleflames();
      spacekey = false;
      weapon++;
    } else if (weapon == ROCKETLAUNCHER) {
      myWeapon = new RocketLauncher();
      weapon++;
    }
  }

  void act () {
    super.act();

    if (e == true) {
      weapon++;
      e = false;
    }

    if (weapon > WEAPONLIMIT) {
      weapon = 0;
    } 
    if (WEAPONLIMIT > 7) {
      WEAPONLIMIT = 7;
    }

    dmgTimer++;

    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y =  speed;
    if (d) vel.x =  speed;

    if (!w && !s) vel.y = 0;
    if (!a && !d) vel.x = 0;

    if (vel.mag() > speed) vel.setMag(speed);

    //check exits
    if (!(roomX == myBoss.roomX && roomY == myBoss.roomY && myBoss.hp > 0)) {
      if (northRoom != #FFFFFF && loc.y == height*0.1 && loc.x >= width/2-50 && loc.x <= width/2+50) {
        roomY--;
        loc = new PVector(width/2, height*0.9-10);
        myCandle.loc.x = myHero.loc.x;
        myCandle.loc.y = myHero.loc.y;
        myGem.loc.x = myHero.loc.x;
        myGem.loc.y = myHero.loc.y;
      }
      if (southRoom != #FFFFFF && loc.y == height*0.9 && loc.x >= width/2-50 && loc.x <= width/2+50) {
        roomY++;
        loc = new PVector(width/2, height*0.1+10);
        myCandle.loc.x = myHero.loc.x;
        myCandle.loc.y = myHero.loc.y;
        myGem.loc.x = myHero.loc.x;
        myGem.loc.y = myHero.loc.y;
      }
      if (eastRoom != #FFFFFF && loc.x == width*0.9 && loc.y >= height/2-50 && loc.y <= height/2+50) {
        roomX++;
        loc = new PVector(width*0.1+10, height/2);
        myCandle.loc.x = myHero.loc.x;
        myCandle.loc.y = myHero.loc.y;
        myGem.loc.x = myHero.loc.x;
        myGem.loc.y = myHero.loc.y;
      }
      if (westRoom != #FFFFFF && loc.x == width*0.1 && loc.y >= height/2-50 && loc.y <= height/2+50) {
        roomX--;
        loc = new PVector(width*0.9-10, height/2);
        myCandle.loc.x = myHero.loc.x;
        myCandle.loc.y = myHero.loc.y;
        myGem.loc.x = myHero.loc.x;
        myGem.loc.y = myHero.loc.y;
      }
    }

    myWeapon.update();
    if (upkey || downkey || leftkey || rightkey) myWeapon.shoot();


    int i_ = 0;
    while (i_ < myObjects.size()) {
      GameObject myObj = myObjects.get(i_);

      if (myObj instanceof DroppedItem) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2 && myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {
          DroppedItem item = (DroppedItem) myObj;
          if (item.type == 7) {
            item.hp = 0;
            keyCount++;
            myObjects.add(new Message(myHero.loc.x, myHero.loc.y, 50, 2));
          }
          if (item.type >= 0 && item.type <= 6) {
            item.hp = 0;
            coinCount++;
            myObjects.add(new Message(myHero.loc.x, myHero.loc.y, 50, 1));
          }
        }
      }
      i_++;
    }

    if (dmgTimer < dmgThreshold) {
      tint(255, 0, 0);
    } else tint (255, 255, 255);
    if (vel.x > 0 || downkey && rightface == true || upkey && rightface == true) {
      currentAction = heroRight; 
      rightface = true;
    } else if (vel.x < 0 || downkey && rightface == false || upkey && rightface == false) {
      currentAction = heroLeft;
      rightface = false;
    }

    if (vel.x == 0 && vel.y == 0 && rightface == true) {
      currentAction = heroIdleRight;
    } else if (vel.x == 0 && vel.y == 0 && rightface == false) {
      currentAction = heroIdleLeft;
    }    
    currentAction.show(loc.x, loc.y, size*2.3, size*2.3);

    tint(255, 255, 255);
  }
}

class Candle extends GameObject {

  AnimatedGIF currentCandle;
  float speed;

  Candle() {
    loc = new PVector(width/2, height/2);
    hp = 1;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    size = 15;
  }

  void show() {

    if (myHero.dmgTimer < myHero.dmgThreshold) {
      tint(255, 0, 0);
    } else tint(255, 255, 255);

    if (dimmer > 231) {
      currentCandle = myCandle100;
    } else if (dimmer <= 231 && dimmer > 131) {
      currentCandle = myCandle66;
    } else if (dimmer <= 131 && dimmer > 31) {
      currentCandle = myCandle33;
    }

    currentCandle.show(loc.x, loc.y, size*2.3, size*2.3);
    tint(255, 255, 255);
  }

  void act() {
    loc.add(vel);
    if (rightface) {
      vel = new PVector (myHero.loc.x + 45 - loc.x, myHero.loc.y - 25 - loc.y);
      if (loc.x >= myHero.loc.x + 35 && loc.y >= myHero.loc.y - 27 && loc.x <= myHero.loc.x + 55 && loc.y <= myHero.loc.y - 23) {
        speed = 0;
      } else speed = 6;
    } else {
      vel = new PVector (myHero.loc.x - 45 - loc.x, myHero.loc.y - 25 - loc.y);
      if (loc.x >= myHero.loc.x - 55 && loc.y >= myHero.loc.y - 27 && loc.x <= myHero.loc.x - 35 && loc.y <= myHero.loc.y - 23) {
        speed = 0;
      } else speed = 6;
    }


    vel.setMag(speed);

    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
}

class Gem extends GameObject {

  Gem() {
    loc = new PVector(width/2, height/2);
    hp = 1;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    size = 250;
  }

  void show() {
    image(gemkey, loc.x, loc.y, size, size);
  }

  void act() {
    loc.add(vel);

    if (!(roomX == 1 && roomY == 1)) {
      if (!rightface) {
        vel = new PVector (myHero.loc.x + 45 - loc.x, myHero.loc.y - 25 - loc.y);
        if (loc.x >= myHero.loc.x + 35 && loc.y >= myHero.loc.y - 27 && loc.x <= myHero.loc.x + 55 && loc.y <= myHero.loc.y - 23) {
          speed = 0;
        } else speed = 2;
      } else {
        vel = new PVector (myHero.loc.x - 45 - loc.x, myHero.loc.y - 25 - loc.y);
        if (loc.x >= myHero.loc.x - 55 && loc.y >= myHero.loc.y - 27 && loc.x <= myHero.loc.x - 35 && loc.y <= myHero.loc.y - 23) {
          speed = 0;
        } else speed = 2;
      }
    }


    

    roomX = myHero.roomX;
    roomY = myHero.roomY;

    if (roomX == 1 && roomY == 1) {
       vel = new PVector (myDoor.loc.x - loc.x, myDoor.loc.y - loc.y);
       if (!(loc.x == height/2 && loc.y == width/2)) {
         speed = 1;
       } 
       if (dist(myDoor.loc.x, myDoor.loc.y, loc.x, loc.y) < 3) {
         hp = 0;
         speed = 0;
         //loc.x = 200000;
         //loc.y = 200000;
         winCon = true;
       }
    }
    vel.setMag(speed);
  }
}
