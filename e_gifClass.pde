class AnimatedGIF {

//{INSTANCE VARIABLES}============================================================================================================================================================================

  PImage[] pics; //image array
  int nFrame;    //nunber of frames
  int cFrame;    //current frame
  int rate;
  float x, y, w, h;

//{CONSTRUCTOR}===============================================================================================================================================================

  AnimatedGIF(int nf, String pre, String post, int r) { //for making basic that covers whole screen
    nFrame = nf;

    x = width/2;
    y = height/2;
    w = width;
    h = height;
    
    rate = r;
    
  
    pics = new PImage[nFrame];
    int i = 1;
    while (i < nFrame) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    cFrame = 1;
  }
  
   AnimatedGIF(int nf, String pre, String post, float xp, float yp, float wp, float hp, int r) { //for making custom gif size and location
    nFrame = nf;

    x = xp;
    y = yp;
    w = wp;
    h = hp;
    
    rate = r;


    pics = new PImage[nFrame];
    int i = 0;
    while (i < nFrame) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    cFrame = 0;
  }


//{BEHAVIOUR FUNCTIONS}===========================================================================================================================================================================
  void show (float x, float y, float w, float h) {
    imageMode(CENTER);
    if (cFrame == nFrame) cFrame = 0;
    image(pics[cFrame], x, y, w, h);
    if (frameCount % rate == 0) cFrame++;
  }
  
  void show () {
    imageMode(CENTER);
    if (cFrame == nFrame) cFrame = 1;
    image(pics[cFrame], x, y, w, h);
    if (frameCount % rate == 0) cFrame++;
  }
}
