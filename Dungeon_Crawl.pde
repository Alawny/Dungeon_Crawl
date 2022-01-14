/*
Alan Lu

=================

hi, this code is a mess with a lot of unused variables and even enemies.

i really do not want to go through everything and search for things im not using

otherwise, 

enjoy

=================
CONTROLS:

WASD = MOVEMENTS
ARROWKEYS = FIRE WEAPON
Q = SHOP (ONLY IN SHOP ROOM)
E = WEAPON SWAP (ONLY IF YOU HAVE ANOTHER WEAPON)
M = HUD
R = ABILITY (BUY FROM SHOP)
=================
MAP:

CHECK WITH HUD KEY
BLACK = ENEMY ROOM / EMPTY ROOM
PURPLE = SHOP ROOM
RED = BOSS ROOM
GOLD = CHEST ROOM (UNUSED)
ORANGE = CURRENT LOCATION
=================
SHOP:

FOUND IN THE PURPLE ROOM, PRESS THE "Q" KEY TO ACCESS SHOP

FEEL FREE TO BUY AS MANY UPGRADES AS YOU SEE FIT

CERTAIN ITEMS DOUBLE IN PRICE AS YOU PURCHASE MORE AND MORE

ITEMS MARKED "(S)" ARE SPECIALS, ONLY 1 SPECIAL IS ALLOWED
=================
GOAL IS TO STEAL THE MAIN BOSS'S GEMSTONE IN ORDER TO OPEN THE BIG DOOR IN THE BEGINNING AND ESCAPE

BUT YOU ONLY HAVE A CANDLE THAT IS DIES IF YOU ARE TOO SLOW

UPGRADE YOUR CANDLE AND BEAT THE BOSS AND YEAH...

ANYWAYS GOODLUCK

*/

//{MODE FRAMEWORK VARIABLES}======================================================================================================================================================================

int mode;
final int INTRO    = 0;
final int GAME     = 1;
final int SHOP     = 2;
final int GAMEOVER = 3;
final int PAUSE    = 4;
final int GAMEWIN = 5;


Hero myHero;
Candle myCandle;
Boss myBoss;
Gem myGem;
Door myDoor;
ArrayList<GameObject> myObjects;
ArrayList<DarknessCube> darkness;


//{MOUSE RELEASED FUNCTION VARIABLES}=============================================================================================================================================================

boolean mouseReleased;
boolean wasPressed;

//{COLOUR PALLETE}================================================================================================================================================================================

color dpurple  = #300030;
color purple   = #480048;
color lpurple  = #601848;
color maroon   = #C04848;
color orange   = #F07241;
color black    = #000000;
color ddpurple = #0A0012;
color dgrey    = #868686;
color mpurple  = #9B08FF;
color dred     = #310105;
color red      = #F50202;
color cyan     = #02E8E6;
color lblue    = #8FF5F4;
color grey     = #ADADAD;
color white    = #FFFFFF;
color green    = #73FC78;
color dgreen   = #0EC115;
color dbrown   = #4d2d0b;
color brown    = #7a480f;

//{ROOM COLOR PALLETE}============================================================================================================================================================================

color f3r      = #010000;
color f4s1     = #020000;
color s2       = #030000;
color j2r      = #040000;
color f8r      = #050000;
color s4       = #060000;
color g2       = #070000;
color shopr    = #F20DFF;
color chestr   = #FFF703;
color bossr    = #FF0303;





//{GIF ARRAY SETUP}===============================================================================================================================================================================

AnimatedGIF introGIF;

AnimatedGIF myCandle100;

AnimatedGIF myCandle66;

AnimatedGIF myCandle33;

AnimatedGIF heroRight;
AnimatedGIF heroLeft;
AnimatedGIF heroIdleRight;
AnimatedGIF heroIdleLeft;

AnimatedGIF slimeRight;
AnimatedGIF slimeLeft;



Button introButton;

Button shopButton1;
Button shopButton2;
Button shopButton3;
Button shopButton4;
Button shopButton5;
Button shopButton6;
Button shopButton7;
Button shopButton8;
Button shopExit;

boolean AbilityCheck;

PImage map;

PImage fire;

PImage wax;

PImage keyItem;

PImage coinItem;

PImage coinUI;

PImage keyUI;

PImage shop1;
PImage shop2;
PImage shop3;

PImage slimeleft0;
PImage slimeleft1;
PImage slimeright0;
PImage slimeright1;
PImage slimeleftdmg0;
PImage slimeleftdmg1;
PImage slimerightdmg0;
PImage slimerightdmg1;

PImage summonerright0;
PImage summonerright1;
PImage summonright0;
PImage summonright1;
PImage summonright2;
PImage summonright3;
PImage summonerleft0;
PImage summonerleft1;
PImage summonleft0;
PImage summonleft1;
PImage summonleft2;
PImage summonleft3;
PImage summonerleftdmg0;
PImage summonerleftdmg1;
PImage summonerrightdmg0;
PImage summonerrightdmg1;

PImage healerright0;
PImage healerright1;
PImage healright0;
PImage healright1;
PImage healright2;
PImage healright3;
PImage healerleft0;
PImage healerleft1;
PImage healleft0;
PImage healleft1;
PImage healleft2;
PImage healleft3;
PImage healerleftdmg0;
PImage healerleftdmg1;
PImage healerrightdmg0;
PImage healerrightdmg1;

PImage bossidle0;
PImage bossidle1;
PImage bossattack;
PImage bossheal;
PImage bosssummon;
PImage bossweak;
PImage bossweakdmg;

PImage bosshpbar;

PImage doorclosed;
PImage doorclosedgem1;
PImage doorclosedgem2;
PImage dooropen;
PImage gemkey;



color northRoom, eastRoom, southRoom, westRoom;

float dim;

float dimmer;

float dimmerCheck;

int teleflamesCheck;

boolean winCon;


//
float t;
int tcounter;
int tcount;

int TOKIWOTOMARE;
int c;
boolean ex, sh, res;

int coinCount;
int keyCount;

boolean rightface;

int WAXDAMAGE;
int WAXSPEED;
int WAXTHRESHOLD;
int MAXHP;
int WEAPONLIMIT;

int WAXDAMAGECOST;
int WAXSPEEDCOST;
int WAXTHRESHOLDCOST;
int MAXHPCOST;
int WEAPONLIMITCOST;

int skillCDR;

int TIMESTOPCOST;
int MINEFIELDCOST;
int REGENWAXCOST;

int code;

boolean TIMESTOPCHECK;
boolean MINEFIELDCHECK;
boolean REGENWAXCHECK;

float distance;

float eeeoe;
float eeeoee;
int eeeeeoee;
boolean es;
int eeeeeeeoe;

boolean stopItems;
//

int weapon;
final int BASICWAX = 0;
final int FLAMETHROWER = 2;
final int TELEFLAMES = 4;
final int ROCKETLAUNCHER = 6;


//
boolean flicker;
void setup () {

  tcount = 0;

  myHero = new Hero();
  myCandle = new Candle();
  myGem = new Gem();
  myDoor = new Door();
  myObjects = new ArrayList<GameObject>(1000);
  myObjects.add(myHero);
  myObjects.add(myCandle);
  myObjects.add(myDoor);

  //myObjects.add(new Enemy()); //dev mode

  flicker = false;
  
  coinCount = 10;
  keyCount = 0;
  
  rightface = true;
  
  MAXHP = 331;
  WAXDAMAGE = 1;
  WAXTHRESHOLD = 15;
  WAXSPEED = 12;
  WEAPONLIMIT = 1;
  
  WAXDAMAGECOST = 5;
  WAXSPEEDCOST = 5;
  WAXTHRESHOLDCOST = 5;
  MAXHPCOST = 5;
  WEAPONLIMITCOST = 10;
  
  code = 0;
  
  skillCDR = 500;
  
  TIMESTOPCOST = 25;
  MINEFIELDCOST = 20;
  REGENWAXCOST = 15;
  
 TIMESTOPCHECK = false;
 MINEFIELDCHECK = false;
 REGENWAXCHECK = false;
 
 stopItems = false;
 
  eeeoe = 0;
  eeeoee = 0;
  eeeeeoee = 0;
  eeeeeeeoe = 0;
  
  AbilityCheck = false;
  
  distance = 100000;
  
  winCon = false;
  

  //{DARKNESS GRID SETUP}===========================================================================================================================================================================
  darkness = new ArrayList<DarknessCube>();
  float size = 20;
  float x = size/2, y = size/2;

  int e = 0;
  c = 1;
  sh = false;
  ex = false;
  res = false;

  TOKIWOTOMARE = 0;

  while (e < 99999999 && y < height) {
    darkness.add(new DarknessCube(x, y, size));
    x = x + size;
    if (x > width) {
      x = size/2;
      y = y+size;
    }
    e++;
  } 

  dimmer = 331;

  dim = 300;
  

  //{BASIC SETUP}===================================================================================================================================================================================

  size(1200, 900, FX2D);
  mode = 0;
  
  //images

  map = loadImage("Map.png");

  fire = loadImage("fire.png");

  wax = loadImage("wax.png");
  
  keyItem = loadImage("Key.png");
  
  coinItem = loadImage("Coin.png");
  
  coinUI = loadImage("CoinUI.png");
  
  keyUI = loadImage("KeyUI.png");

  shop1 = loadImage("Shop/shop1.png");
  shop2 = loadImage("Shop/shop2.png");
  shop3 = loadImage("Shop/shop3.png");
  
  slimeleft0  = loadImage("Enemies/Slime/SlimeLeft/slimeleft0.png");
  slimeleft1  = loadImage("Enemies/Slime/SlimeLeft/slimeleft1.png");
  slimeright0 = loadImage("Enemies/Slime/SlimeRight/slimeright0.png");
  slimeright1 = loadImage("Enemies/Slime/SlimeRight/slimeright1.png");
  
  slimeleftdmg0  = loadImage("Enemies/Slime/SlimeLeft/slimeleftdmg0.png");
  slimeleftdmg1  = loadImage("Enemies/Slime/SlimeLeft/slimeleftdmg1.png");
  slimerightdmg0 = loadImage("Enemies/Slime/SlimeRight/slimerightdmg0.png");
  slimerightdmg1 = loadImage("Enemies/Slime/SlimeRight/slimerightdmg1.png");
  
 summonerright0 = loadImage("Enemies/Summoner/SummonerRight/summonerright0.png");
 summonerright1 = loadImage("Enemies/Summoner/SummonerRight/summonerright1.png");
 summonright0 = loadImage("Enemies/Summoner/SummonerRight/summonright0.png");
 summonright1 = loadImage("Enemies/Summoner/SummonerRight/summonright1.png");
 summonright2 = loadImage("Enemies/Summoner/SummonerRight/summonright2.png");
 summonright3 = loadImage("Enemies/Summoner/SummonerRight/summonright3.png");
 summonerrightdmg0 = loadImage("Enemies/Summoner/SummonerRight/summonerrightdmg0.png");
 summonerrightdmg1 = loadImage("Enemies/Summoner/SummonerRight/summonerrightdmg1.png");
 
 summonerleft0 = loadImage("Enemies/Summoner/SummonerLeft/summonerleft0.png");
 summonerleft1 = loadImage("Enemies/Summoner/SummonerLeft/summonerleft1.png");
 summonleft0 = loadImage("Enemies/Summoner/SummonerLeft/summonleft0.png");
 summonleft1 = loadImage("Enemies/Summoner/SummonerLeft/summonleft1.png");
 summonleft2 = loadImage("Enemies/Summoner/SummonerLeft/summonleft2.png");
 summonleft3 = loadImage("Enemies/Summoner/SummonerLeft/summonleft3.png");
 summonerleftdmg0 = loadImage("Enemies/Summoner/SummonerLeft/summonerleftdmg0.png");
 summonerleftdmg1 = loadImage("Enemies/Summoner/SummonerLeft/summonerleftdmg1.png");
 
healerright0 = loadImage("Enemies/Healer/HealerRight/healerright0.png");
healerright1 = loadImage("Enemies/Healer/HealerRight/healerright1.png");
healright0 = loadImage("Enemies/Healer/HealerRight/healright0.png");
healright1 = loadImage("Enemies/Healer/HealerRight/healright1.png");
healright2 = loadImage("Enemies/Healer/HealerRight/healright2.png");
healright3 = loadImage("Enemies/Healer/HealerRight/healright3.png");
healerleft0 = loadImage("Enemies/Healer/HealerLeft/healerleft0.png");
healerleft1 = loadImage("Enemies/Healer/HealerLeft/healerleft1.png");
healleft0 = loadImage("Enemies/Healer/HealerLeft/healleft0.png");
healleft1 = loadImage("Enemies/Healer/HealerLeft/healleft1.png");
healleft2 = loadImage("Enemies/Healer/HealerLeft/healleft2.png");
healleft3 = loadImage("Enemies/Healer/HealerLeft/healleft3.png");
healerleftdmg0 = loadImage("Enemies/Healer/HealerLeft/healerleftdmg0.png");
healerleftdmg1 = loadImage("Enemies/Healer/HealerLeft/healerleftdmg1.png");
healerrightdmg0 = loadImage("Enemies/Healer/HealerRight/healerrightdmg0.png");
healerrightdmg1 = loadImage("Enemies/Healer/HealerRight/healerrightdmg1.png");

bossidle0 = loadImage("Enemies/Boss/bossidle0.png");
bossidle1 = loadImage("Enemies/Boss/bossidle1.png");
bossattack = loadImage("Enemies/Boss/bossattack.png");
bossheal = loadImage("Enemies/Boss/bossheal.png");
bosssummon = loadImage("Enemies/Boss/bosssummon.png");
bossweak = loadImage("Enemies/Boss/bossweak.png");
bossweakdmg = loadImage("Enemies/Boss/bossweakdmg.png");

bosshpbar = loadImage("Enemies/Boss/bosshpbar.png");

gemkey = loadImage("Door/gemkey.png");
doorclosed = loadImage("Door/doorclosed.png");
doorclosedgem1 = loadImage("Door/doorclosedgem1.png");
doorclosedgem2 = loadImage("Door/doorclosedgem2.png");
dooropen = loadImage("Door/dooropen.png");






  //{GIF CREATION}

  introGIF = new AnimatedGIF(4, "frame_", "_delay-0.16s.gif", 10);
  
  myCandle100 = new AnimatedGIF(3, "Hero/Candle100/candle", ".png", myHero.loc.x, myHero.loc.y, 50, 50, 22);

  myCandle66 = new AnimatedGIF(3, "Hero/Candle66/candle66", ".png", myHero.loc.x, myHero.loc.y, 50, 50, 22);

  myCandle33 = new AnimatedGIF(3, "Hero/Candle33/candle33", ".png", myHero.loc.x, myHero.loc.y, 50, 50, 22);
  
  heroRight = new AnimatedGIF(4, "Hero/right/right", ".png", myHero.loc.x, myHero.loc.y, 100, 100, 12);
  
  heroLeft = new AnimatedGIF(4, "Hero/left/left", ".png", myHero.loc.x, myHero.loc.y, 100, 100, 12);
  
  heroIdleRight = new AnimatedGIF(2, "Hero/idle_right/idle_right", ".png", myHero.loc.x, myHero.loc.y, 100, 100, 35);
  
  heroIdleLeft = new AnimatedGIF(2, "Hero/idle_left/idle_left", ".png", myHero.loc.x, myHero.loc.y, 100, 100, 35);
  

  
  slimeRight = new AnimatedGIF(2, "Enemies/Slime/SlimeRight/slimeright", ".png", 0, 0, 100, 100, 35);
  slimeLeft = new AnimatedGIF(2, "Enemies/Slime/SlimeLeft/slimeleft", ".png", 0, 0, 100, 100, 35);
  
  //Buttons

  introButton = new Button("Start", width/2, height/2 + 100, 300, 150, purple, lpurple, 100, 10, 5, black, 15, 0);
  
  shopButton1 = new Button("+", 125, 110, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton2 = new Button("+", 125, 330, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton3 = new Button("+", 125, 550, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton4 = new Button("+", 125, 770, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  
  shopButton5 = new Button("+", 357.5, 110, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton6 = new Button("+", 357.5, 330, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton7 = new Button("+", 357.5, 550, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  shopButton8 = new Button("+", 357.5, 770, 75, 75, green, dgreen, 100, 5, 5, black, 24, 1);
  
  shopExit    = new Button("x", width - 40, 40, 75, 75, brown, red, 75, 10, 5, dbrown, 19, 0);

  


  //setup enemy
  
   //myObjects.add(new Slime(1, 1, 1000, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));

  int x_ = 0;
  int y_ = 0;
  while (y_ < map.height) {
    color roomType = map.get(x_, y_);
    if (roomType == f3r) {
      myObjects.add(new Slime(x_, y_, 20, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 20, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 20, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
    }
    if (roomType == f4s1) {
      myObjects.add(new Slime(x_, y_, 15, 150, 150));
      myObjects.add(new Slime(x_, y_, 15, width - 150, height - 150));
      myObjects.add(new Slime(x_, y_, 15, width - 150, 150));
      myObjects.add(new Slime(x_, y_, 15, 150, height - 150));
      myObjects.add(new Summoner(x_, y_));
    }
    if (roomType == s2) {
      myObjects.add(new Summoner(x_, y_, 200, 200));
      myObjects.add(new Summoner(x_, y_, width - 200, height - 200));
    }
    if (roomType == j2r) {
      myObjects.add(new Jumper(x_, y_, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Jumper(x_, y_, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
    }
    if (roomType == f8r) {
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 10, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
    }
    if (roomType == s4) {
      myObjects.add(new Summoner(x_, y_, 200, 200));
      myObjects.add(new Summoner(x_, y_, width - 200, height - 200));
      myObjects.add(new Summoner(x_, y_, width - 200, 200));
      myObjects.add(new Summoner(x_, y_, 200, height - 200));
    }
    if (roomType == g2) {
      myObjects.add(new Mage(x_, y_, width/2, height/2));
    }
    if (roomType == chestr) {
      myObjects.add(new Chest(x_, y_));
    }
    if (roomType == shopr) {
    }
    if (roomType == bossr) {
      myBoss = new Boss(x_, y_);
      myObjects.add(myBoss);
      myObjects.add(new Summoner(x_, y_, 200, 200));
      myObjects.add(new Summoner(x_, y_, width - 200, height - 200));
      myObjects.add(new Summoner(x_, y_, width - 200, 200));
      myObjects.add(new Summoner(x_, y_, 200, height - 200));
      myObjects.add(new Slime(x_, y_, 21, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 21, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
      myObjects.add(new Slime(x_, y_, 21, random(width*0.1, width*0.9), random(height*0.1, height*0.9)));
    }

    x_++;
    if (x_ == map.width) {
      x_ = 0;
      y_++;
    }
  }
}

void draw () {

  //{MODE FRAMEWORK}================================================================================================================================================================================
    if      (mode == INTRO)    {
    intro();
  } else if (mode == GAME)     {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE)    {
    pause();
  } else if (mode == SHOP)     {
    shop();
  } else if (mode == GAMEWIN)  {
    gamewin();
  } else                       {
     println("ERROR MODE=" + mode);
  }
}
