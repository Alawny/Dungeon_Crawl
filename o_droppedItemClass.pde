class DroppedItem extends GameObject {
  int type;
  
  DroppedItem(float x, float y, int sx, int sy, int t) {
    type = t;
    
    if (stopItems) {
    hp = 0;
    } else hp = 1;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    
    size = 40;
    roomX = sx;
    roomY = sy;
    
  }
  
  void show() {
    
    loc.add(vel);
   // vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
   // vel.setMag(0.3);
    
    if (!(type >= 8)) {
    pushMatrix();
    
    
    if (type >= 0 && type <= 6) {
      image(coinItem, loc.x, loc.y, size, size);
    } 
    if (type == 7) {
      image(keyItem, loc.x, loc.y, size, size);
    }
    
    
    
    popMatrix();
    }
  }
  
}
