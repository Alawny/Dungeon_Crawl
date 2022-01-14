class Message extends GameObject {
  
  int type;
  int lifespan;
  
  Message(float x, float y, float s, int t) {
    hp = 1;
    loc = new PVector (x, y);
    vel = new PVector (0, -1);
    size = s;
    type = t;
    lifespan = 75;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }
  
  void show() {
    loc.add(vel);
    
    textSize(20);
    fill(white);
    text("+1", loc.x + 23.5, loc.y - 3);
    
    if (type == 1) {
    image(coinItem, loc.x, loc.y, size, size);
    } else if (type == 2) {
    image(keyItem, loc.x, loc.y, size, size);
    }
    
    
    
    lifespan--;
    if (lifespan <= 0) {
      hp = 0;
    }
  }
  
  
  
  
  
  
  
}
