class Bullet extends GameObject {



  float timer;
  int hcheck;
  int dmg;
  int btype;


  Bullet(int bs, int size_, int x, int y, int dmg_, float timer_, int btype_) {

    loc    = new PVector (myCandle.loc.x, myCandle.loc.y - hcheck);  
    vel    = new PVector (x, y);
    vel.setMag(bs); 
    size   = size_;
    dmg = dmg_;
    timer = timer_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    btype = btype_;
    hp = 1;
  }

  Bullet(PVector aimVector, float bs, int size_, int dmg_, float timer_, int btype_) {

    
    loc    = new PVector (myCandle.loc.x, myCandle.loc.y - hcheck);
    vel    = aimVector.copy();
    vel.setMag(bs); 
    size   = size_;
    dmg = dmg_;
    timer = timer_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    btype = btype_;
    hp = 1;
  }
  
  Bullet(PVector aimVector, float bs, int size_, int dmg_, float timer_, int btype_, float x, float y) {


    loc    = new PVector (x, y);
    vel    = aimVector.copy();
    vel.setMag(bs); 
    size   = size_;
    dmg = dmg_;
    timer = timer_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    btype = btype_;
    hp = 1;
    
  }


  void show() {
    if (btype == 0) {
      image(fire, loc.x, loc.y, 100, 100);
    }

    if (btype == 1) {
      image(wax, loc.x, loc.y, size * 10, size * 10);
    }
    
    if (btype == 2) {
      image(wax, loc.x, loc.y, 250, 250);
    }
  }

  void act() {
    if (teleflamesCheck == 0) {
      spacekey = true;
    } 
    if (spacekey == true && TOKIWOTOMARE == 0) {
      loc.add(vel);
      if (loc.x < width*0.1)  hp = 0;
      if (loc.x > width*0.9)  hp = 0;
      if (loc.y < height*0.1)  hp = 0;
      if (loc.y > height*0.9)   hp = 0;

      timer--;
      if (timer <= 0) {
        hp = 0;
      }
    }

    if (roomX != myHero.roomX || roomY != myHero.roomY) {
      hp = 0;
    }


    if (hp <= 0) {
      if (btype == 0 && roomX == myHero.roomX && roomY == myHero.roomY) {
        for (int i_ = 0; i_ < 10; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 0, 7, red, 50, 80));
      }
      for (int i_ = 0; i_ < 25; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 0, 2.5, red, 30, 40));
      }
      } else if (btype == 1 && roomX == myHero.roomX && roomY == myHero.roomY) {
        for (int i_ = 0; i_ < 30; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, WAXDAMAGE + 1, white, WAXDAMAGE + 5, WAXDAMAGE + 5));
      }
      for (int i_ = 0; i_ < 100; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, int((WAXDAMAGE + 1) / 2), white, WAXDAMAGE, WAXDAMAGE));
      }
      }
    }
    
    if (hp <= 0 && roomX == myHero.roomX && roomY == myHero.roomY && btype == 2) {
      explode(loc.x, loc.y);
      for (int i_ = 0; i_ < 100; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, 7, white, 10, 30));
      }
      for (int i_ = 0; i_ < 250; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, 3, white, 4, 7));
      }
      
    }
  }
}
