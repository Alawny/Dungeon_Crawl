class Slime extends Enemy {
  float speed;
  int gifcounter;


  Slime(int x, int y) {
    super(30, 50, x, y, width/2, height/2, 8);
    speed = 2;
    gifcounter = int(random(0, 25));
    dmgCounter = 100;
    dmgThreshold = 10;
  }
  Slime(int x, int y, int h, float sx, float sy) {
    super(h, h*2.2 + 20, x, y, sx, sy, 3);
    speed = 2;
    gifcounter = int(random(0, 25));
    dmgCounter = 100;
    dmgThreshold = 10;
  }

  void show() {
    if (dmgCounter > dmgThreshold && TOKIWOTOMARE == 0) {
      gifcounter++;
    } else {
      vel.setMag(0);
    }
    tint(#BD46FF);


    if (gifcounter >= 70) {
      gifcounter = 0;
    }

    if (myHero.loc.x - loc.x > 0 && TOKIWOTOMARE == 0) {
      left = false;
    } else if (myHero.loc.x - loc.x < 0 && TOKIWOTOMARE == 0) {
      left = true;
    }

    if (gifcounter <= 35) {
      if (!left) {
        if (dmgCounter < dmgThreshold) {
          image(slimerightdmg0, loc.x, loc.y, size*2, size*2);
        } else image(slimeright0, loc.x, loc.y, size*2, size*2);
      } else if (left) {
        if (dmgCounter < dmgThreshold) {
          image(slimeleftdmg0, loc.x, loc.y, size*2, size*2);
        } else image(slimeleft0, loc.x, loc.y, size*2, size*2);
      }
    }
    if (gifcounter > 35) {
      if (!left) {
        if (dmgCounter < dmgThreshold) {
          image(slimerightdmg1, loc.x, loc.y, size*2, size*2);
        } else image(slimeright1, loc.x, loc.y, size*2, size*2);
      } else if (left) {
        if (dmgCounter < dmgThreshold) {
          image(slimeleftdmg1, loc.x, loc.y, size*2, size*2);
        } else image(slimeleft1, loc.x, loc.y, size*2, size*2);
      }
    }

    if (TOKIWOTOMARE == 0) dmgCounter++;

    fill(255);
    //text(hp, loc.x, loc.y);
    tint(255, 255, 255);
  }

  void act() {
    super.act();

    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(speed);



    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - ((Bullet) obj).dmg;
          obj.hp = obj.hp - 1;
          dmgCounter = 0;
        }
      }
      i++;
    }

    if (hp <= 0 && hp > -1000) {
      myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, int(random(0, 20))));
      for (int i_ = 0; i_ < 50; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, 6, purple, 8, 12));
      }
      for (int i_ = 0; i_ < 150; i_++) {
        myObjects.add(new Particle(loc.x, loc.y, 4, 3, purple, 2, 4));
      }
      for (int i_ = 0; i_ < 3; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
    }
  }
}

class Jumper extends Enemy {


  Jumper(int x, int y, float sx, float sy) {
    super(20, 50, x, y, sx, sy, 10);
  }




  void show () {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      float d = dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y);
      if (d <= size + myHero.size + 100) {
        stroke (black);
      } else stroke(black, 25);
      strokeWeight(2);

      if (d <= size + myHero.size + 100) {
        fill(maroon);
      } else fill(lpurple);
      circle(loc.x, loc.y, 40);
      if (d <= size + myHero.size + 100) {
        fill(black);
      } else stroke(black);
      textSize(15);
      //text(hp, loc.x, loc.y + 7);
    }
  }

  void act() {
    loc.add(vel);



    if (loc.x < width*0.1)  loc.x = width*0.1;
    if (loc.x > width*0.9)  loc.x = width*0.9;
    if (loc.y < height*0.1) loc.y = height*0.1;
    if (loc.y > height*0.9) loc.y = height*0.9;

    float d = dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y);

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float t = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size + myHero.size + 100) {
          if (t <= size/2 + obj.size/2) {
            hp = hp - ((Bullet) obj).dmg;
            obj.hp = obj.hp - 1;
          }
        }
      }
      i++;
    }

    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);

    if (d <= size + myHero.size + 100) {

      vel.setMag(6);
    } else vel.setMag(1);

    if (myHero.dmgTimer >= myHero.dmgThreshold) {
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 + myHero.size/2) {
        dimmer = dimmer - 30;
        myHero.dmgTimer = 0;
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
      }
    }

    if (hp <= 0 && hp > -1000) {
      myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, int(random(0, 20))));
      for (int i_ = 0; i_ < 3; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
    }
  }
}

class Summoner extends Enemy {

  int summonCount;
  int gifcounter;
  boolean summon;
  int summontime;
  int summonslime;


  Summoner(int x, int y) {
    super(40, 50, x, y, width/2, height/2, 10);
    summon = false;
    gifcounter = 0;
    summontime = 0;
    left = false;
    summonslime = 100;
    dmgCounter = 100;
    dmgThreshold = 10;
    summonCount = 125;
  }

  Summoner(int x, int y, float sx, float sy) {
    super(40, 50, x, y, sx, sy, 3);
    summon = false;
    gifcounter = 0;
    summontime = 0;
    left = false;
    summonslime = 100;
    dmgCounter = 100;
    dmgThreshold = 10;
    summonCount = 125;
  }

  Summoner() {

    super(25, 50, myBoss.roomX, myBoss.roomY, width - 200, 200, 8);
    summon = false;
    gifcounter = 0;
    summontime = 0;
    left = false;
    summonslime = 100;
    dmgCounter = 100;
    dmgThreshold = 10;
    summonCount = 125;
  }

  void show() {

    if (summon == false) {


      if (dmgCounter > dmgThreshold && TOKIWOTOMARE == 0) {
        gifcounter++;
      } else vel.setMag(0);



      if (gifcounter >= 70) {
        gifcounter = 0;
      }

      if (myHero.loc.x - loc.x > 0 && TOKIWOTOMARE == 0) {
        left = false;
      } else if (myHero.loc.x - loc.x < 0 && TOKIWOTOMARE == 0) {
        left = true;
      }


      if (gifcounter <= 35) {
        if (!left) {
          if (dmgCounter < dmgThreshold) {
            image(summonerrightdmg0, loc.x, loc.y, size*3, size*3);
          } else image(summonerright0, loc.x, loc.y, size*3, size*3);
        } else if (left) {
          if (dmgCounter < dmgThreshold) {
            image(summonerleftdmg0, loc.x, loc.y, size*3, size*3);
          } else image(summonerleft0, loc.x, loc.y, size*3, size*3);
        }
      }
      if (gifcounter > 35) {
        if (!left) {
          if (dmgCounter < dmgThreshold) {
            image(summonerrightdmg1, loc.x, loc.y, size*3, size*3);
          } else image(summonerright1, loc.x, loc.y, size*3, size*3);
        } else if (left) {
          if (dmgCounter < dmgThreshold) {
            image(summonerleftdmg1, loc.x, loc.y, size*3, size*3);
          } else image(summonerleft1, loc.x, loc.y, size*3, size*3);
        }
      }
    }
    if (summon == true && left == false) {
      if (TOKIWOTOMARE == 0) summontime++;
      vel.setMag(0);

      if (summontime <= 50) {
        image(summonright0, loc.x, loc.y, size*3, size*3);
      } else if (summontime > 50 && summontime <= 75) {
        image(summonright1, loc.x, loc.y, size*3, size*3);
      } else if (summontime > 75 && summontime <=100) {
        image(summonright2, loc.x, loc.y, size*3, size*3);
        if (TOKIWOTOMARE == 0)
          if (summonslime >= 100) {
            myObjects.add(new Slime(roomX, roomY, 6, loc.x, loc.y - 60)); 
            myObjects.add(new Slime(roomX, roomY, 6, loc.x - 60, loc.y + 40)); 
            myObjects.add(new Slime(roomX, roomY, 6, loc.x + 60, loc.y + 40)); 
            summonslime = 0;
          }
      } else if (summontime > 100 && summontime <= 140) {
        image(summonright3, loc.x, loc.y, size*3, size*3);
        summonslime = 100;
      }
      if (summontime >= 140) {
        summon = false;
        summontime = 0;
        summonCount = 0;
      }
    }
    if (summon == true && left == true) {
      if (TOKIWOTOMARE == 0) summontime++;
      vel.setMag(0);

      if (summontime <= 50) {
        image(summonleft0, loc.x, loc.y, size*3, size*3);
      } else if (summontime > 50 && summontime <= 75) {
        image(summonleft1, loc.x, loc.y, size*3, size*3);
      } else if (summontime > 75 && summontime <=100) {
        image(summonleft2, loc.x, loc.y, size*3, size*3);
        if (TOKIWOTOMARE == 0)
          if (summonslime >= 100) {
            myObjects.add(new Slime(roomX, roomY, 6, loc.x, loc.y - 60)); 
            myObjects.add(new Slime(roomX, roomY, 6, loc.x - 60, loc.y + 40)); 
            myObjects.add(new Slime(roomX, roomY, 6, loc.x + 60, loc.y + 40)); 
            summonslime = 0;
          }
      } else if (summontime > 100 && summontime <= 140) {
        image(summonleft3, loc.x, loc.y, size*3, size*3);
        summonslime = 100;
      }
      if (summontime >= 140) {
        summon = false;
        summontime = 0;
        summonCount = 0;
      }
    }

    fill(255);
    //text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    if (summonCount == 250) {
      summon = true;
      summonCount = 0;
    }

    if (abs(dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) - 250) > 5)
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) < 250) {
        vel = new PVector (-(myHero.loc.x - loc.x), -(myHero.loc.y - loc.y));
        vel.setMag(2);
      } else {
        vel = new PVector ((myHero.loc.x - loc.x), (myHero.loc.y - loc.y));
        vel.setMag(2);
      } else vel.setMag(0);

    if (TOKIWOTOMARE == 0) {
      summonCount++;
    }

    if (TOKIWOTOMARE == 0) dmgCounter++;

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - ((Bullet) obj).dmg;
          obj.hp = obj.hp - 1;
          vel.setMag(0);
          dmgCounter = 0;
        }
      }
      i++;
    }
    if (hp <= 0 && hp > -1000) {
      myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, int(random(0, 20))));
      for (int i_ = 0; i_ < 5; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
    }
  }
}

class Boss extends Enemy {

  int attackCount;
  int summonCounter;
  int mainCount;
  int random;
  int doublecheck;
  int dmgTimer;
  int dmgThreshold;
  int bossAniTimer;


  Boss(int x, int y) {
    super(333, 125, x, y, width/2, height/2, 100);
    mainCount = 700;
    random = 0;
    dmgTimer = 20;
    dmgThreshold = 5;
    bossAniTimer = 0;
  }

  void show() {



    if (roomX == myHero.roomX && roomY == myHero.roomY) {

      if (TOKIWOTOMARE == 0) {
        bossAniTimer++;
      }

      stopItems = true;

      rectMode(CORNER);
      fill(black);
      rect(width/2 - 140, height/2 + 149, 333/1.229, 19);
      fill (orange);

      strokeWeight(0);
      stroke(orange);
      rect(width/2 - 140, height/2 + 149, hp/1.229, 19);
      image(bosshpbar, loc.x, loc.y + 30, 400, 300);
      //stroke (black);
      //strokeWeight(2);
      //if (random == 0) {
      //  if (dmgTimer < 20) {
      //    fill(red);
      //  } else fill(maroon);
      //} else fill(red);
      //circle(loc.x, loc.y, size);

      //fill(black);
      //textSize(15);
      //text(hp, loc.x, loc.y + 7);

      if (random == 0) {
        if (dmgTimer < dmgThreshold) {
          image(bossweakdmg, loc.x, loc.y, size*2.5, size*2.5);
        } else image(bossweak, loc.x, loc.y, size*2.5, size*2.5);
      } else if (random == 1) {
        image(bossattack, loc.x, loc.y, size*2.5, size*2.5);
      } else if (random == 2) {
        image(bossheal, loc.x, loc.y, size*2.5, size*2.5);
      } else if (random == 3) {
        image(bosssummon, loc.x, loc.y, size*2.5, size*2.5);
      } else if (random == 5) {



        if (bossAniTimer >= 100) {
          bossAniTimer = 0;
        }
        if (bossAniTimer < 50) {
          image(bossidle0, loc.x, loc.y, size*2.5, size*2.5);
        } else if (bossAniTimer >= 50) {
          image(bossidle1, loc.x, loc.y, size*2.5, size*2.5);
        }
      }
    }
  }

  void act() {


    mainCount++;

    if (mainCount >= 700) {

      random = 5;

      if (mainCount >= 1000) {

        random = int(random(0, 4));
        while (random == doublecheck) {
          random = int(random(0, 4));
        }

        doublecheck = random;

        if (random == 2) {
          mainCount = 400;
        } else if (random == 3) {
          mainCount = 500;
        } else mainCount = 0;

        summonCounter = 0;
        attackCount = 0;
      }
    }

    if (random == 1) {
      attackCount++;

      if (attackCount >= 50) {
        hell(myBoss.loc.x, myBoss.loc.y);
      }


      if (attackCount >= 50 && attackCount < 400) {
        summonCounter++;
      }

      if (attackCount >= 400) {
        attackCount = 50;
      }

      if (summonCounter % 40 == 1) {

        myObjects.add(new Minion());
      }
    } else if (random == 2) {
      summonCounter++;

      if (summonCounter % 10 == 1 && summonCounter < 150) { 
        myObjects.add(new HealerOrb());
      }
    }

    if (random == 0) {
      dmgTimer++;
      int i = 0;
      while (i < myObjects.size()) {
        GameObject obj = myObjects.get(i);
        if (obj instanceof Bullet) {
          float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
          if (d <= size/2 + obj.size/2 && dmgTimer >= dmgThreshold) {
            hp = hp - ((Bullet) obj).dmg;
            obj.hp = obj.hp - 1;
            dmgTimer = 0;
          }
        }
        i++;
      }
    }

    if (random == 3) {
      attackCount++;

      if (attackCount == 50) {
        attackCount = 100;
        myObjects.add(new Summoner());
        myObjects.add(new Healer());
      }
      if (attackCount == 400) {
        attackCount = 100;
        myObjects.add(new Summoner());
        myObjects.add(new Healer());
      }
    }

    if (hp <= 0 && hp > -1000) {
      for (int i_ = 0; i_ < 100; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
      myObjects.add(myGem);
      myGem.loc.x = loc.x;
      myGem.loc.y = loc.y;
    }
  }
}



class Minion extends Enemy {
  int timer;



  Minion() {
    super(1, 25, myHero.roomX, myHero.roomY, width/2, height/2, 1);
    vel = new PVector (width/2 - random(width*0.1, width*0.9), height/2 - random(height*0.1, height*0.9));
    vel.setMag(1.5);
    if (loc.x == vel.x && loc.y == vel.y) {
      vel.setMag(0);
    }
  }

  void show() {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      stroke (red);
      strokeWeight(2);
      fill(red);
      circle(loc.x, loc.y, size);
      fill(black);
      textSize(15);
      //text(hp, loc.x, loc.y + 7);
    }
  }

  void act() {

    loc.add(vel);

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          //hp = hp - ((Bullet) obj).dmg;
          //obj.hp = obj.hp - 1;
        }
      }
      i++;
    }

    if (myHero.dmgTimer >= myHero.dmgThreshold) {
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 + myHero.size/2) {
        dimmer = dimmer - 15;
        myHero.dmgTimer = 0;
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
        myObjects.add(new Particle(myHero.loc.x, myHero.loc.y, 1, 1));
      }
    }

    timer++;

    if (timer >= 150 && timer <= 160) {
      vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(12);
    }

    if (ZAWARUDO == true) {
      timer = 161;
      vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(12);
    }

    if (timer > 300) {
      hp = -1001;
    }

    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 + myHero.size/2) {
      hp = -1001;
    }
  }
}

class HealerOrb extends Enemy {

  float ranBH;


  HealerOrb() {

    super(1, 25, myHero.roomX, myHero.roomY, 1000, 1000, 5);

    ranBH = int(random(0, 4));
    if (ranBH == 0) {
      loc = new PVector (random(0, width), -100);
      vel = new PVector (width/2 - loc.x, height/2 - loc.y - 75);
      vel.setMag(4);
    }
    if (ranBH == 1) {
      loc = new PVector (-100, random(0, height));
      vel = new PVector (width/2 - loc.x, height/2 - loc.y - 75);
      vel.setMag(4);
    }
    if (ranBH == 2) {
      loc = new PVector (1100, random(0, height));
      vel = new PVector (width/2 - loc.x, height/2 - loc.y - 75);
      vel.setMag(4);
    }
    if (ranBH == 3) {
      loc = new PVector (random(0, width), 1000);
      vel = new PVector (width/2 - loc.x, height/2 - loc.y - 75);
      vel.setMag(4);
    }
  }

  HealerOrb(float x, float y) {
    super(1, 25, myHero.roomX, myHero.roomY, x, y, 5);
    vel = new PVector (width/2 - loc.x, height/2 - loc.y - 75);
    vel.setMag(6);
  }

  void show() {
    if (roomX == myHero.roomX && roomY == myHero.roomY) {
      stroke (black);
      strokeWeight(2);
      fill(cyan);
      circle(loc.x, loc.y, size);
      fill(lblue);
      textSize(15);
      //text(hp, loc.x, loc.y + 7);
    }
  }

  void act() {

    loc.add(vel);

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - ((Bullet) obj).dmg;
          obj.hp = obj.hp - 1;
        }
      }
      i++;
    }

    if (dist(loc.x, loc.y, width/2, height/2 - 75) < 20) {
      hp = -1001;
      myBoss.hp = myBoss.hp + 3;
    }

    if (hp <= 0 && hp > -1000) {
      for (int i_ = 0; i_ < 5; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
    }
  }
}


class Healer extends Enemy {

  int summonCount;
  int gifcounter;
  boolean heal;
  int healtime;
  int summonheal;


  Healer() {
    super(25, 50, myBoss.roomX, myBoss.roomY, 200, 200, 8);
    heal = false;
    gifcounter = 0;
    healtime = 0;
    left = false;
    summonheal = 10;
    dmgCounter = 100;
    dmgThreshold = 10;
    summonCount = 125;
  }

  void show() {
    if (heal == false) {


      if (dmgCounter > dmgThreshold && TOKIWOTOMARE == 0) {
        gifcounter++;
      } else vel.setMag(0);



      if (gifcounter >= 70) {
        gifcounter = 0;
      }

      if (myHero.loc.x - loc.x > 0 && TOKIWOTOMARE == 0) {
        left = false;
      } else if (myHero.loc.x - loc.x < 0 && TOKIWOTOMARE == 0) {
        left = true;
      }


      if (gifcounter <= 35) {
        if (!left) {
          if (dmgCounter < dmgThreshold) {
            image(healerrightdmg0, loc.x, loc.y, size*3, size*3);
          } else image(healerright0, loc.x, loc.y, size*3, size*3);
        } else if (left) {
          if (dmgCounter < dmgThreshold) {
            image(healerleftdmg0, loc.x, loc.y, size*3, size*3);
          } else image(healerleft0, loc.x, loc.y, size*3, size*3);
        }
      }
      if (gifcounter > 35) {
        if (!left) {
          if (dmgCounter < dmgThreshold) {
            image(healerrightdmg1, loc.x, loc.y, size*3, size*3);
          } else image(healerright1, loc.x, loc.y, size*3, size*3);
        } else if (left) {
          if (dmgCounter < dmgThreshold) {
            image(healerleftdmg1, loc.x, loc.y, size*3, size*3);
          } else image(healerleft1, loc.x, loc.y, size*3, size*3);
        }
      }
    }
    if (heal == true && left == false) {
      if (TOKIWOTOMARE == 0) healtime++;
      vel.setMag(0);

      if (healtime <= 50) {
        image(healright0, loc.x, loc.y, size*3, size*3);
      } else if (healtime > 50 && healtime <= 75) {
        image(healright1, loc.x, loc.y, size*3, size*3);
      } else if (healtime > 75 && healtime <=100) {
        image(healright2, loc.x, loc.y, size*3, size*3);
        if (TOKIWOTOMARE == 0) summonheal++;
        if (summonheal >= 10) {
          myObjects.add(new HealerOrb(loc.x + 50, loc.y - 30));
          summonheal = 0;
        }
      } else if (healtime > 100 && healtime <= 140) {
        image(healright3, loc.x, loc.y, size*3, size*3);
        summonheal = 10;
      }
      if (healtime >= 140) {
        heal = false;
        healtime = 0;
        summonCount = 0;
      }
    }
    if (heal == true && left == true) {
      if (TOKIWOTOMARE == 0) healtime++;
      vel.setMag(0);

      if (healtime <= 50) {
        image(healleft0, loc.x, loc.y, size*3, size*3);
      } else if (healtime > 50 && healtime <= 75) {
        image(healleft1, loc.x, loc.y, size*3, size*3);
      } else if (healtime > 75 && healtime <=100) {
        image(healleft2, loc.x, loc.y, size*3, size*3);
        if (TOKIWOTOMARE == 0) summonheal++;
        if (summonheal >= 10) {
          myObjects.add(new HealerOrb(loc.x - 50, loc.y - 30));
          summonheal = 0;
        }
      } else if (healtime > 100 && healtime <= 140) {
        image(healleft3, loc.x, loc.y, size*3, size*3);
        summonheal = 10;
      }
      if (healtime >= 140) {
        heal = false;
        healtime = 0;
        summonCount = 0;
      }
    }

    fill(255);
    //text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    if (summonCount == 250) {
      heal = true;
      summonCount = 0;
    }

    if (abs(dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) - 250) > 5)
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) < 250) {
        vel = new PVector (-(myHero.loc.x - loc.x), -(myHero.loc.y - loc.y));
        vel.setMag(2);
      } else {
        vel = new PVector ((myHero.loc.x - loc.x), (myHero.loc.y - loc.y));
        vel.setMag(2);
      } else vel.setMag(0);

    if (TOKIWOTOMARE == 0) {
      summonCount++;
      dmgCounter++;
    }

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - ((Bullet) obj).dmg;
          obj.hp = obj.hp - 1;
          vel.setMag(0);
          dmgCounter = 0;
        }
      }
      i++;
    }
    if (hp <= 0 && hp > -1000) {
      myObjects.add(new DroppedItem(loc.x, loc.y, roomX, roomY, int(random(0, 20))));
      for (int i_ = 0; i_ < 5; i_++) {
        myObjects.add(new HeroHealerOrb(loc.x, loc.y));
      }
    }
  }
}



class Mage extends Enemy { //UNUSED ENEMY
  int firetimer;
  boolean fire;
  int reset;
  boolean randomMove;
  int randomMoveTimer;
  float x_, y_;


  Mage(int x, int y, float sx, float sy) {
    super(25, 50, y, x, sx, sy, 5);
    vel = new PVector (0, 0);
    fire = true;
    x_ = 0;
    y_ = 0;
    randomMoveTimer = 150;
  }

  void show() {
    super.show();
  } 


  void act() {
    super.act();
    loc.add(vel);

    firetimer++;
    randomMoveTimer++;



    if (randomMoveTimer >= 100) {
      x_ = random(-100, 100);
      y_ = random(-100, 100);

      randomMoveTimer = 0;
    }

    if (loc.x >= width * 0.9 || loc.x <= width* 0.1) {
      x_ = -x_;
    }

    if (loc.y >= height * 0.9 || loc.y <= height * 0.1) {
      y_ = -y_;
    }




    if (fire && reset >= 50) {
      if (firetimer >= 45) {
        myObjects.add(new enemyBullet(loc.x, loc.y, myHero.loc.x - loc.x, myHero.loc.y - loc.y, 10, 500, 3, 25));
        firetimer = 0;
      }
    }

    if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) < myHero.size/2 + size/2 + 200) {
      vel = new PVector(loc.x - myHero.loc.x, loc.y - myHero.loc.y);
      vel.setMag(1);
      fire = false;
      reset = 0;
    } else {
      vel = new PVector(x_, y_);
      vel.setMag(0.7);
      fire = true;
      reset++;
    }
  }
}
