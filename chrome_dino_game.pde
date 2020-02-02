/*  Kaitlynn Chan, 2020-02-01
    felt very bored and decided to make this game instead of studying
*/

final int PLAY = 1;
int mode = PLAY;

boolean downkey = false, upkey = false;

Ground g;
Dino d;

void setup(){
  size(1000, 700);
  //fullScreen();
  background(255);
  //frameRate(15);
  
  // instantiating objects
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
    
    // moving dino
    if(upkey) d.jump();
    if(downkey){
      d.duck();
    } else{
      //d.run();
      d.show();
    }
  }
  
}

void keyPressed(){
  if(key == ' ' || keyCode == UP) upkey = true; 
  if(keyCode == DOWN) downkey = true;
}

void keyReleased(){
  //if(key == ' ' || keyCode == UP) upkey = false; 
  if(keyCode == DOWN) downkey = false;
}
