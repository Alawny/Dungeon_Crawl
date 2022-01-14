class DarknessCube {
  float opacity;
  float x, y, size, d, e;



  DarknessCube(float x_, float y_, float s) {
    size = s;
    x = x_;
    y = y_;
    opacity = 0;
  }



  void show() {

    rectMode(CENTER);
    noStroke();
    
    if(myHero.dmgTimer < myHero.dmgThreshold) {
      fill(dred, opacity);
    } else fill(ddpurple, opacity);
    
    rect(x, y, size, size);
  }

  void act() {

    d = dist(myCandle.loc.x, myCandle.loc.y, x, y);
    opacity = map(d, 0, dim + c/10, 0, 100);
  }
}
