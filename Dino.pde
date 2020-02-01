class Dino{
 
  PImage dino;
  PImage[] dinoRun, dinoDuck, dinoJump;
  int dr, dd;
  
  Dino(){
    dino = loadImage("sprites/dino1.png");
    
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
    
  }
  
  void show(){
    image(dino, 100, height/2 + 50);
  }
  
  void run(){
    image(dinoRun[dr], 100, height/2 + 50);
    dr++;
    if(dr >= 3) dr = 0;
  }
  
  void duck(){
    image(dinoDuck[dd], 100, height/2 + 85);
    dd++;
    if(dd >= 2) dd = 0;
  }
  
  void jump(){
    
  }
  
}
