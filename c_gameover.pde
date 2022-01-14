void gameover () {

 
 
  stroke(10);
  textSize(50);
  fill(255);
  text("yuh you lose", width/2, height/2);
}

void gamewin () {
  

 
  stroke(10);
  textSize(50);
  fill(255);
  text("yuh you win", width/2, height/2);
}

class Door extends GameObject {

  int winConCount;

  Door() {
    loc = new PVector(width/2, height/2);
    hp = 1;
    roomX = 1;
    roomY = 1;
    size = 250;
    winConCount = 0;
  }

  void show() {
    if (!winCon) {
      image(doorclosed, loc.x, loc.y, size, size);
    } else if (winCon) {
      winConCount++;

      if (winConCount <= 150) {
        image(doorclosedgem1, loc.x, loc.y, size, size);
      } else if (winConCount > 150 && winConCount <= 250) {
        image(doorclosedgem2, loc.x, loc.y, size, size);
      } else if (winConCount > 250) {
        image(dooropen, loc.x, loc.y, size, size);
      }
      
      if (winConCount > 275 && dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) < 50) {
        mode = GAMEWIN;
      }
    }
  }

  void act() {
  }
}
