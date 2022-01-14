void game () {
  frameRate(60);
  textAlign(CENTER);


  drawRoom();

  drawGameObjects();

  drawDarknessCube();
  drawMiniMap();


  
  skillCDR++;
  
  if (x) {
    myObjects.add(new Mage(myHero.roomX, myHero.roomY, width/2, height/2));
  }

  
    
  // myObjects.add(new Message(myHero.loc.x, myHero.loc.y, 50, 1));
  
  if (q && myHero.roomX == 4 && myHero.roomY == 3) { 
    mode = SHOP;
  }
  
  if (TIMESTOPCHECK) {
  ZAWARUDO();
  timePressed();
  }
  
  if (!TIMESTOPCHECK) {
    ZAWARUDO = false;
  }  
  
  if (ZAWARUDO && skillCDR < 1000) {
    ZAWARUDO = false;
  }

  if (minefield == true && skillCDR >= 1000 && TOKIWOTOMARE == 0 && MINEFIELDCHECK) {
    minefield();
    minePressed();
    skillCDR = 0;
    minefield = false;
  }
  
  //println(skillCDR);
  
  distance();
  
  

  if (dimmer > MAXHP) {
    dimmer = MAXHP;
  }


  if (dimmer <= 31) {
    mode = GAMEOVER;
  }



  if (dim <= dimmer - 30) {
    flicker = true;
  } else if (dim >= dimmer) {
    flicker = false;
  }

  if (dimmer > 31) {
    if (flicker == true) {
      dim = dim + 0.5;
    } else if (flicker == false) {
      dim = dim - 0.5;
    }
  }

if (REGENWAXCHECK == false) {
  dimmerCheck++;
  if (dimmerCheck >= 50) {
    dimmer--;
    dimmerCheck = 0;
  }
} else if (REGENWAXCHECK) {
  dimmerCheck++;
  if (dimmerCheck >= 150) {
    dimmer++;
    dimmerCheck = 0;
  }
}

  if (dimmer <= 31) dimmer = 31;
}

void drawGameObjects() {



  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);

    if (obj instanceof Bullet || obj instanceof Particle && TOKIWOTOMARE == 0) {
      obj.act();
    }
    if (obj instanceof Hero && TOKIWOTOMARE > 0) {
      obj.act();
    }
    if (obj instanceof Candle || obj instanceof Gem) {
      obj.show();
      obj.act();
    }
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY && (!(obj instanceof Candle || obj instanceof Gem))) {
      obj.show();
      if (!(obj instanceof Bullet || obj instanceof Particle || obj instanceof Candle || obj instanceof Gem)) {
        if (TOKIWOTOMARE == 0) {
          obj.act();
        }
      }
    }
    if (obj.hp <= 0 ) {
      myObjects.remove(i);
      i--;
    }
  }
}

void drawDarknessCube() {
  for (int i = 0; i < darkness.size(); i++) {
    DarknessCube dark = darkness.get(i);
    dark.show();
    dark.act();
  }
}

void drawRoom() {
  background(dpurple);

  stroke(black);
  strokeWeight(4);
  line(0, 0, width, height);
  line(width, 0, 0, height);

  //draw exits
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom  = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom  = map.get(myHero.roomX-1, myHero.roomY);

  //draw doors
  noStroke();
  fill(black);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }



  rectMode(CENTER);
  stroke(black);
  fill(lpurple);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void drawMiniMap() {
  float size = 18;
  int x = 0;
  int y = 0;


  if (mapkey == true) {
    tcount = 1;
  }
  if (tcount == 1) {
    t = t + 2;
  }

  if (t >= 200) {
    tcount = 0;
    if (mapkey == true) {
      t = 200;
    } else if (mapkey == false) {
      tcounter++;
    }
  }

  if (tcounter >= 100) {
    t = t - 1;
  }

  if (t <= 0) {
    tcounter = 0;
  }
  while (y < map.height) {
    color c = map.get(x, y);
    if (x == myHero.roomX && y == myHero.roomY) c = orange;
    fill(c, t);
    noStroke();
    square(x * size + size * 2, y * size + size * 2, size);
    x = x + 1;
    if (x >= map.width) {
      x = 0;
      y = y + 1;
    }
  }

  textSize(30);
  fill(white, t);
  text("hp  " + int(dimmer - 31) / 3, width - 130, 75);
  text(coinCount, width - 100, 125);
  text(keyCount, width - 100, 175);


  tint(255, t);
  image(keyUI, width - 160, 175, 50, 50);
  image(coinUI, width - 160, 125, 50, 50);

  tint(255, 255);
}

void ZAWARUDO() {

  if (skillCDR >= 1000) {
    if (ZAWARUDO == true) {
      TOKIWOTOMARE++;

      if (c >= 3000) {
        ex = false;
        sh = true;
        res = true;
      }


      if (c == 1) {
        ex = true;
        sh = false;
      }

      if (res == true) {
        ex = false;
      }

      if (sh == true) {
        c = c - 150;
      } else if (ex == true) {
        c = c + 150;
      }

      fill(lblue, 20);
      circle(myCandle.loc.x, myCandle.loc.y, c);


      pushMatrix();
      rectMode(CENTER);
      fill(grey, 30);
      rect(width/2, height/2, width, height);
      popMatrix();
    }
  }

  if (TOKIWOTOMARE >= 300) {
    ZAWARUDO = false;
    TOKIWOTOMARE = 0;

    res = false;
    ex = false;
    sh = false;
    c = 1;
    skillCDR = 0;
  }
}
