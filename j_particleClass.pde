class Particle extends GameObject {
  //PARTICLE CLASS=====================================================================================================================================================================================

  //INSTANCE VARIABLES
  int t;     //TRANSPARENCY + LIFE SPAN CALCULATOR
  int red;   //RED CONTRUCTOR
  int green; //GREEN CONTRUCTOR
  int blue;  //BLUE CONTRUCTOR
  int ptype;
  float speed;
  color c;
  


  //CONTRUCTOR
  Particle(float x, float y, color c_) {
    hp    = 1;
    size     = int(random(8, 12));
    t        = int(random(200, 500));
    loc      = new PVector (x, y);
    vel      = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI)); //180 degrees or (radians(180)); random(0, TWO_PI);
    vel.setMag(2);
    c = c_;
    ptype    = 4;
  }

  Particle(float x, float y, int ptype_, float speed_) {
    hp    = 1;
    size     = int(random(8, 12));
    speed = speed_;
    t        = int(random(200, 500));
    loc      = new PVector (x, y);
    vel      = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI)); 
    vel.setMag(speed);
    ptype = ptype_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
  
  Particle(float x, float y, int ptype_, float speed_, color c_, int s, int s2) {
    hp    = 1;
    size     = int(random(s, s2));
    speed = speed_;
    t        = int(random(200, 500));
    loc      = new PVector (x, y);
    vel      = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI)); 
    vel.setMag(speed);
    ptype = ptype_;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    c = c_;
  }

  //SHOW PARTICLE
  void show() {

    if (ptype == 0) {
      image(fire, loc.x, loc.y, size, size);
    } else if (ptype == 1) {
      image(wax, loc.x, loc.y, 40, 40);
    } else if (ptype == 4) {
    noStroke();
    fill(c, t);
    square(loc.x, loc.y, size);
    }
  } 
    
    
  

  //PARTICLE TRANSPARENCY AND LIFE SPAN + SUPERCLASS ACT
  void act() {
    super.act();

    if (roomX != myHero.roomX || roomY != myHero.roomY) {
      hp = 0;
    }

    if (ptype == 0) {
      t = t - 25;
    } else if (ptype == 1) {
      t = t - 10;
    } else if (ptype == 4) {
      t = t - 15;
    }
    if (t <= 0) hp = 0;
  }
}
