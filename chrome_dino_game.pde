/*  Kaitlynn Chan, 2020-02-01
    felt very bored and decided to make this game instead of studying
*/

final int PLAY = 1;
int mode = PLAY;

PImage bird;

boolean downkey = false;

Ground g;
Dino d;

void setup(){
  size(2000, 700);
  //fullScreen();
  background(255);
  frameRate(15);
  
  
  g = new Ground();
  d = new Dino();
  
}

void draw(){
  background(255);
  
  // modes
  if(mode == PLAY) {
    int speed = 10;
    g.show();
    //g.moveGround(speed);
    
    if(downkey){
      d.duck();
    } else{
      d.run();
    }
  }
  
}

void keyPressed(){
  if(keyCode == DOWN) downkey = true;
}

void keyReleased(){
  if(keyCode == DOWN) downkey = false;
}
