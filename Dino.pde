class Dino{
 
  PImage dino;
  PImage[] dinoRun, dinoDuck, dinoJump; // different dino modes
  //PImage[] dinoMove;
  //int di;
  int ri, di, dinoMode; // indices for the different dino modes
  float dy, x, y, w, h;
  
  Dino(){
    dino = loadImage("sprites/dino.png");
    
    //// dinoMove
    //dinoMove = new PImage[5];
    //for(int i = 0; i < 5; i++){
    //  if(i < 3) dinoMove[i] = loadImage("sprites/dino" + (i+2) + ".png");
    //  if(i >= 3) dinoMove[i] = loadImage("sprites/dino" + (i+4) + ".png");
    //}
    //di = 0;
    
    // dinoRun
    dinoRun = new PImage[3];
    for(int i = 0; i < 3; i++){
      dinoRun[i] = loadImage("sprites/dino" + (i+2) + ".png");
    }
    ri = 0;    
  
    // dinoDuck
    dinoDuck = new PImage[2];
    for(int i = 0; i < 2; i++){
      dinoDuck[i] = loadImage("sprites/dino" + (i+7) + ".png");
    }
    di = 0;    
    
    
    // variables
    dy = 8;
    y = height/2;
    x = 100;
    w = dino.width;
    h = dino.height;
  }
  
  void show(){
    image(dino, x, y);
  }
  
  void showDead(){
    if(dinoMode == 1) image(dinoRun[ri], x, y);
    if(dinoMode == 2) image(dinoDuck[di], x, y);
    //image(dinoMove[di], x, y);
  }
  
  void run(int s){
    dinoMode = 1;
    image(dinoRun[ri], x, y);
    if(frameCount %s == 0) ri++;
    if(ri >= 3) ri = 0;
    
    // setting w and h to new size
    w = dinoRun[0].width;
    h = dinoRun[0].height;
  }
  
  void duck(int s){
    //image(dinoDuck[di], x, y+35);
    //di = 3;
    dinoMode = 2;
    image(dinoDuck[di], x, y+35);
    if(frameCount %s == 0) di++;
    if(di >= 2) di = 0;
    
    // setting w and h to new size
    w = dinoDuck[0].width;
    h = dinoDuck[0].height;
  }
  
  void jump(){
    if(y > height/2){ // dino does not jump
      dy = 8;
      y = height/2;
      upkey = false;
    } else{ // dino jumping with respect to gravity
      y -= dy;
      dy -= 0.3;
      
    }
  }
  
  
  boolean contact(float terrainX, float terrainY, float terrainW, float terrainH){
    // rect rect collision checking
    //if(rectRect(this.x, this.y, this.w, this.h, terrainX, terrainY, terrainW, terrainH)) print("check");
    
    // circle circle collision checking
    if(dist(this.x + this.w/2, this.y + this.h/2, terrainX + terrainW/2, terrainY + terrainH/2) < this.w/2 + terrainW/2) return true;
    return false;
  }
  
}
