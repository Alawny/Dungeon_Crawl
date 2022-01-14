class HeroHealerOrb extends Enemy {
  int timer;
  int h;



  HeroHealerOrb(float x, float y, int h_) {
    super(1, 25, myHero.roomX, myHero.roomY, x, y, 0);
    vel = new PVector (loc.x - random(width*0.1, width*0.9), loc.y - random(height*0.1, height*0.9));
    vel.setMag(1);
    if (loc.x == vel.x && loc.y == vel.y) {
      vel.setMag(0);
    }
    h = h_;
  }
  
  HeroHealerOrb(float x, float y) {
    super(1, 25, myHero.roomX, myHero.roomY, x, y, 0);
    vel = new PVector (loc.x - random(width*0.1, width*0.9), loc.y - random(height*0.1, height*0.9));
    vel.setMag(1);
    if (loc.x == vel.x && loc.y == vel.y) {
      vel.setMag(0);
    }
    h = 3;
  }
  
  void show() {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
    image(fire, loc.x, loc.y, 50, 50);
    }
  }

  void act() {
    
    loc.add(vel);
    
    
      if (dist(loc.x, loc.y, myCandle.loc.x, myCandle.loc.y) <= size/2 + myCandle.size/2) {
        dimmer = dimmer + h;
      }

    timer++;

    if (timer >= 50) {
      vel = new PVector (myCandle.loc.x - loc.x, myCandle.loc.y - loc.y);
      vel.setMag(12);
    }

    if (dist(loc.x, loc.y, myCandle.loc.x, myCandle.loc.y) <= size/2 + myCandle.size/2) {
      hp = 0;
    }
  }
}
