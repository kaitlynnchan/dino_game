class Terrain {
  Terrain(){
  }
  
  void move(){
    
  }
}

class Ground extends Terrain{
  PImage ground, cactus;
  int gx;
  
  Ground(){
    ground = loadImage("sprites/ground.png");
    gx = 0;
  }
  
  void show(){
    image(ground, gx, 2*height/3);
    
  }
  
  void moveGround(int s){
    //moves the ground
    gx-= s;
  }
}

//void drawTerrain(){
//  int gx = 0;
//  image(ground, gx, 2*height/3);
//  gx++;
//}
