class Enemy extends GameObject {

  int h;
  boolean click;
  int dmgCounter;
  int dmgThreshold;
  boolean left;

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    vel.setMag(2);
    hp = 100;
    size = 50;
    roomX = 1;
    roomY = 1;
    h = 10000;
  }

  Enemy(int hp_, float size_, int roomX_, int roomY_, float x, float y, int h_) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    vel.setMag(5);
    hp = hp_;
    size = size_;
    roomX = roomX_;
    roomY = roomY_;
    h = h_;
    click = false;
  }

  void show() {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      stroke (black);
      strokeWeight(2);
      fill(lpurple);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(15);
      text(hp, loc.x, loc.y + 7);
    }
  }

  void act() {
    super.act();


    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - ((Bullet) obj).dmg;
          obj.hp = obj.hp - 1;
          vel.setMag(0);
        }
      }
      i++;
    }

    if (myHero.dmgTimer >= myHero.dmgThreshold) {
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 + myHero.size/2) {
        dimmer = dimmer - 15;
        myHero.dmgTimer = 0;
        click = true;

        for (int i_ = 0; i_ < 10; i_++) {
          myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 4, 4, white, 5, 10));
        }
      }
    }
    if (hp <= 0 && hp > -1000) {
      myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, int(random(0, 20))));
      //for (int i_ = 0; i_ < h; i_++) {
      //  myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      //}
    }
    
    if (click && x) {
      hp = 0;
      explode(loc.x, loc.y);
    }
  }
}
