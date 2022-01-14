class Chest extends GameObject {
  
  Chest(int x, int y) {
    hp = 1;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    roomX = x;
    roomY = y;
    size = 150;
  }
  
  void show() {
    fill(orange);
    circle(loc.x, loc.y, size);
  }
  
  void act() {
    if (dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y) < size/2 + myHero.size/2 && keyCount > 0) {
      hp = 0;
      keyCount--;
    }
  }
}
