void intro () {
  frameRate(60);

 
 
  
  click();
  introGIF.show();
  introButton.show();
  
  
   textSize(75);
  fill(255);
  text("DUNGEON CRAWLER", 600, 200);
  
  if (introButton.clicked) mode = GAME;
  
}
