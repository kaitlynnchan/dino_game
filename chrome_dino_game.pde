/*  
 * Kaitlynn Chan, 2020-02-01
 * my own version of the dino game on chrome
*/

// modes
final int INTRO = 0;
final int PLAY = 1;
final int DEAD = 2;
int mode = INTRO;

boolean downkey = false, upkey = false;

PFont font;

// objects
Ground g;
Dino d;
ArrayList<Bird> birds;
ArrayList<Cloud> clouds;
ArrayList<Cactus> cacti;
PImage back;

void setup() {
  size(1000, 400);
  background(255);
  //frameRate(15);

  // instantiating objects
  g = new Ground();
  d = new Dino();
  birds = new ArrayList<Bird>();
  clouds = new ArrayList<Cloud>();
  cacti = new ArrayList<Cactus>();
  back = loadImage("sprites/back.png");
  
  // font
  font = createFont("fonts/PressStart2P-Regular.ttf", 20);
  textFont(font);
}

void draw() {
  background(255);

  // modes
  if (mode == INTRO) {
    modeIntro();
  } else if (mode == PLAY) {
    modePlay();
  } else if (mode == DEAD) {
    modeDead();
  }
}

void keyPressed() {
  if (mode == PLAY) {
    if (key == ' ' || keyCode == UP) upkey = true; 
    if (keyCode == DOWN) downkey = true;
  }
}

void keyReleased() {
  if(mode == INTRO){
    if(key == ' ' || keyCode == UP) upkey = true;
  }
  if (mode == PLAY) {
    //if(key == ' ' || keyCode == UP) upkey = false; 
    if (keyCode == DOWN) downkey = false;
  }
}


void mouseReleased() {
  if (mode == DEAD) {
    if (mouseX >= width/2 - back.width/2 && mouseX <= width/2 + back.width/2 && mouseY >= height/2 - back.height/2 && mouseY <= height/2 + back.height/2)  mode = INTRO;
  }
}
