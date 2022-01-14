class enemyBullet extends GameObject {
//UFOBULLET CLASS=====================================================================================================================================================================================

  //INSTANCE VARIABLES
  int enemyBTimer;  //UFO BULLET LIFE SPAN TIMER
  int dmg;
  float speed;

  //CONTRUCTOR
  enemyBullet (float x, float y, float vx, float vy, float s, int time, int d, float size_) {
    enemyBTimer = time;
    hp = 1;
    loc = new PVector (x, y);
    vel = new PVector (vx, vy);
    vel.setMag(s);
    size = size_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    dmg = d;
  }
  
  enemyBullet (PVector aimVector, float x, float y, float s, int time, int d, float size_) {
    enemyBTimer = time;
    hp = 1;
    loc = new PVector (x, y);
    vel = aimVector.copy();
    speed = s;
    vel.setMag(speed);
    size = size_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    dmg = d;
  }


//ENEMY BULLET BEHAVIOUR FUNCTIONS======================================================================================================================================================================

  //SHOW ENEMY BULLET
  void show () {
    pushMatrix();
    stroke(red);
    fill(black);
    ellipse(loc.x, loc.y, size, size);
    popMatrix();
  } 

  void act () {
    
    ////SUPERCLASS ACT
    //super.act();
    
    


if (TOKIWOTOMARE == 0) {
      loc.add(vel);
      if (loc.x < width*0.1)  hp = 0;
      if (loc.x > width*0.9)  hp = 0;
      if (loc.y < height*0.1)  hp = 0;
      if (loc.y > height*0.9)   hp = 0;
}
    
    
    //DAMAGE HERO IF TOUCHING ENEMY BULLET + KILL BULLET + MAKE HERO INVINCIBLE
    if (myHero.dmgTimer >= myHero.dmgThreshold) {
      if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) <= size/2 - 5 + myHero.size/2) {
        dimmer = dimmer - 3*dmg;
        myHero.dmgTimer = 0;
      }
    }
    enemyBTimer--;
    if (enemyBTimer <= 0) {
      hp = 0;
      enemyBTimer = 0;
    }
  }
}


//FIX THIS
