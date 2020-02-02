class Ground{
  PImage ground, cactus;
  int gx;
  
  Ground(){
    ground = loadImage("sprites/ground.png");
    gx = 0;
  }
  
  void show(){
    image(ground, gx, 2*height/3);
    image(ground, gx+2404, 2*height/3);
    
  }
  
  void move(int s){
    //moves the ground
    gx-= s;
    if(gx <= -2404) gx += 2404;
  }
}

class Bird{
  PImage[] bird;
  int indx;
  float x,y;
  
  Bird(){
    bird = new PImage[2];
    for(int i = 0; i < 2; i++){
      bird[i] = loadImage("sprites/bird" + (i+1) + ".png");
    }
    
    x = width;
    y = random(100, 150);
  }
  
  void move(int s){
    image(bird[indx], x, y);
    if(frameCount %s == 0) indx++;
    if(indx >= 2) indx = 0;
    x -= s;
  }
  
  //boolean dead(){
  // return x < -92; 
  //}
  
}

class Cloud{
  PImage cloud;
  float x, y, dx;
  
  Cloud(){
   cloud = loadImage("sprites/cloud.png"); 
   x = width;
   y = random(50, 200);
   dx = random(1, 2);
  }
  
  void move(){
    image(cloud, x, y);
    x -= dx;
  }
}

class Cactus{
  PImage[] cactus;
  int x, indx;
  
  Cactus(){
    // instantiating array of cactus picture
    cactus = new PImage[11];
    for(int i = 0; i < 11; i++){
      cactus[i] = loadImage("sprites/cactus" + i + ".png");
    }
    
    // variables
    x = width;
    indx = (int)random(10);
  }
  
  void move(int s){
    image(cactus[indx], x, height/2);
    x -= s;
  }
  
}
