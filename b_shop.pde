void shop () {

  fill(black, 3);
  rect(width/2, height/2, width, height);


  if      (WEAPONLIMIT == 1) {
    image(shop1, width/2, height/2);
  } else if (WEAPONLIMIT == 3) {
    image(shop2, width/2, height/2);
  } else if (WEAPONLIMIT >= 5) {
    image(shop3, width/2, height/2);
  } 

  image(coinUI, width - 115, 250, 100, 100);
  textSize(45);
  fill(white);
  textAlign(CENTER);
  text("x" + coinCount, width - 50, 277.5);

  click();
  shopButton1.show();
  shopButton2.show();
  shopButton3.show();
  shopButton4.show();
 
    shopButton5.show();
    shopButton6.show();
    shopButton7.show();
  
  shopButton8.show();
  shopExit.show();

 // println(WAXSPEED);

  if (shopExit.clicked) {
    mode = GAME;
  }

  if (shopButton1.clicked && coinCount >= WAXSPEEDCOST) {
    WAXSPEED = WAXSPEED + 2;
    coinCount = coinCount - WAXSPEEDCOST;
    WAXSPEEDCOST = WAXSPEEDCOST * 2;
  }
  if (shopButton2.clicked && coinCount >= WAXTHRESHOLDCOST) {
    WAXTHRESHOLD = WAXTHRESHOLD - 2;
    coinCount = coinCount - WAXTHRESHOLDCOST;
    WAXTHRESHOLDCOST = WAXTHRESHOLDCOST * 2;
  }
  if (shopButton3.clicked && coinCount >= WAXDAMAGECOST) {
    WAXDAMAGE = WAXDAMAGE + 1;
    coinCount = coinCount - WAXDAMAGECOST;
    WAXDAMAGECOST = WAXDAMAGECOST * 2;
  }
  if (shopButton4.clicked && coinCount >= WEAPONLIMITCOST) {
    WEAPONLIMIT = WEAPONLIMIT + 2;
    coinCount = coinCount - WEAPONLIMITCOST;
    WEAPONLIMITCOST = WEAPONLIMITCOST + 10;
  }


  if (shopButton5.clicked && coinCount >= TIMESTOPCOST && AbilityCheck == false) {
    AbilityCheck = true;
    coinCount = coinCount - TIMESTOPCOST;
    TIMESTOPCHECK = true;
  }
  if (shopButton6.clicked && coinCount >= MINEFIELDCOST && AbilityCheck == false) {
    AbilityCheck = true;
    coinCount = coinCount - MINEFIELDCOST;
    MINEFIELDCHECK = true;
  }
  if (shopButton7.clicked && coinCount >= REGENWAXCOST && AbilityCheck == false) {
    AbilityCheck = true;
    coinCount = coinCount - REGENWAXCOST;
    REGENWAXCHECK = true;
  }
  if (shopButton8.clicked && coinCount >= MAXHPCOST) {
    MAXHP = MAXHP + 60;
    coinCount = coinCount - MAXHPCOST;
    MAXHPCOST = MAXHPCOST + 10;
  }

pushMatrix();
  textSize(65);
  fill(white);
  textAlign(LEFT);
  if (mouseX > 25 && mouseX < 225 && mouseY > 10 && mouseY < 210) {
    text("Wax Speed $" + WAXSPEEDCOST, 600, 100);
  } else if (mouseX > 25 && mouseX < 225 && mouseY > 230 && mouseY < 430) {
    text("Wax Threshold $" + WAXTHRESHOLDCOST, 600, 100);
  } else  if (mouseX > 25 && mouseX < 225 && mouseY > 450 && mouseY < 650) {
    text("Wax Damage $" + WAXDAMAGECOST, 600, 100);
  } else  if (mouseX > 25 && mouseX < 225 && mouseY > 670 && mouseY < 870) {
    if (WEAPONLIMIT == 1) {
      text("Flamethrower $" + WEAPONLIMITCOST, 600, 100);
    } else if (WEAPONLIMIT == 3) {
      text("Teleflames $" + WEAPONLIMITCOST, 600, 100);
    } else if (WEAPONLIMIT == 5) {
      text("Frag Cannon $" + WEAPONLIMITCOST, 600, 100);
    } else if (WEAPONLIMIT == 7) {
      text("SOLD OUT", 600, 100);
    }
  } else if (mouseX > 257.5 && mouseX < 457.5 && mouseY > 10 && mouseY < 210) {
    if (!AbilityCheck) {
    text("(S) Time Stop $" + TIMESTOPCOST, 600, 100);
    } else text("ONLY ONE (S)", 600, 100);
  } else if (mouseX > 257.5 && mouseX < 457.5 && mouseY > 230 && mouseY < 430) {
    if (!AbilityCheck) {
    text("(S) Mine Field $" + MINEFIELDCOST, 600, 100);
    } else text("ONLY ONE (S)", 600, 100);
  } else if (mouseX > 257.5 && mouseX < 457.5 && mouseY > 450 && mouseY < 650) {
    if (!AbilityCheck) {
    text("(S) Regen Wax $" + REGENWAXCOST, 600, 100);
    } else text("ONLY ONE (S)", 600, 100);
  } else if (mouseX > 257.5 && mouseX < 457.5 && mouseY > 670 && mouseY < 870) {
    text("Max HP $" + MAXHPCOST, 600, 100);
  } else text("WELCOME", 600, 100);
  
popMatrix();

if (upkey) {
  code = code + 2;
  upkey = false;
}

if (downkey) {
  code = code + 17;
  downkey = false;
}

if (leftkey) {
  code = code + 29;
  leftkey = false;
}

if (rightkey) {
  code = code + 801;
  rightkey = false;
}

if (b) {
  code = code + 716;
  b = false;
}

if (a) {
  code = code + 1982;
  a = false;
}

if (enter && code == 4396) {
  coinCount = 9999;
  MAXHP = 30031;
  dimmer = 30031;
  enter = false;
  code = 0;
} else if (enter && code != 4396) {
  code = 0;
  enter = false;
}

println(code);

}
