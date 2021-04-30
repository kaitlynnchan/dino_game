class Terrain {
  float x, y, w, h;
  
  float getY(){
    return this.y;
  }
  
  float getX(){
    return this.x;
  }
  
  float getWidth(){
    return this.w;
  }
  
  float getHeight(){
    return this.h;
  }
  
}

class Ground extends Terrain{
  PImage ground;
  
  Ground(){
    ground = loadImage("sprites/ground.png");
    x = 100;
    w = ground.width;
    h = ground.height;
  }
  
  void show(){
    image(ground, x, 2*height/3);
    image(ground, x+2404, 2*height/3); 
  }
  
  void move(int s){
    //moves the ground
    x-= s;
    if(x <= -2404) x += 2404;
  }
  
  
}

class Bird extends Terrain{
  PImage[] bird;
  int indx;
  
  Bird(){
    bird = new PImage[2];
    for(int i = 0; i < 2; i++){
      bird[i] = loadImage("sprites/bird" + (i+1) + ".png");
    }
    
    // setting variables
    x = width;
    y = random(100, 150);
    w = bird[0].width;
    h = bird[0].height;
  }
  
  void show(){
    image(bird[indx], x, y);
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

class Cloud extends Terrain{
  PImage cloud;
  float dx;
  
  Cloud(){
   cloud = loadImage("sprites/cloud.png"); 
   x = width;
   y = random(50, 200);
   dx = random(1, 2);
  }
  
  void show(){
    image(cloud, x, y);
  }
  
  void move(){
    image(cloud, x, y);
    x -= dx;
  }
}

class Cactus extends Terrain{
  PImage[] cactus;
  int indx;
  
  Cactus(){
    // instantiating array of cactus picture
    cactus = new PImage[11];
    for(int i = 0; i < 11; i++){
      cactus[i] = loadImage("sprites/cactus" + i + ".png");
    }
    
    // variables
    x = width;
    y = height/2;
    indx = (int)random(10);
    w = cactus[indx].width;
    h = cactus[indx].height;
  }
  
  void show(){
    image(cactus[indx], x, y);
  }
  
  void move(int s){
    image(cactus[indx], x, y);
    x -= s;
  }
  
}
