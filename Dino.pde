class Dino{
 
  PImage dino;
  PImage[] dinoRun, dinoDuck, dinoJump;
  int dr, dd;
  float dy, y;
  
  Dino(){
    dino = loadImage("sprites/dino2.png");
    
    // dinoRun
    dinoRun = new PImage[3];
    for(int i = 0; i < 3; i++){
      dinoRun[i] = loadImage("sprites/dino" + (i+2) + ".png");
    }
    dr = 0;    
  
    // dinoDuck
    dinoDuck = new PImage[2];
    for(int i = 0; i < 2; i++){
      dinoDuck[i] = loadImage("sprites/dino" + (i+7) + ".png");
    }
    dd = 0;    
    
    
    // variables
    dy = 8;
    y = height/2;
  }
  
  void show(){
    image(dino, 100, y);
  }
  
  void run(int s){
    image(dinoRun[dr], 100, y);
    if(frameCount %s == 0) dr++;
    if(dr >= 3) dr = 0;
  }
  
  void duck(int s){
    image(dinoDuck[dd], 100, y+35);
    if(frameCount %s == 0) dd++;
    if(dd >= 2) dd = 0;
  }
  
  void jump(){
    if(y > height/2){ // base case
      dy = 8;
      y = height/2;
      upkey = false;
    } else{ // dino jumping with respect to gravity
      y -= dy;
      dy -= 0.3;
      
    }
  }
  
  //void contact(){
  //  if(rectRect(100, y, 89,97, ))
    
  //}
  
}
