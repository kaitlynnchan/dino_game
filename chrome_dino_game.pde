/*  
 * Kaitlynn Chan, 2020-02-01
 * felt very bored and decided to make this game instead of studying
*/

// modes
final int PLAY = 1;
int mode = PLAY;

boolean downkey = false, upkey = false;

// objects
Ground g;
Dino d;
ArrayList<Bird> birds;
ArrayList<Cloud> clouds;
ArrayList<Cactus> cacti;

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
}

void draw() {
  background(255);

  // modes
  if (mode == PLAY) {
    int speed = 5;

    // cloud
    for (int i = 0; i < clouds.size(); i++) {
      Cloud c = clouds.get(i);
      c.move();
      //if(b.dead()) birds.remove(i);
    }
    if(frameCount %300 == 0) clouds.add(new Cloud());
    
    // ground
    g.show();
    g.move(speed);

    // moving dino
    if (upkey) d.jump();
    if (downkey) {
      d.duck(speed);
    } else {
      d.run(speed);
      //d.show();
    }
    
    // adding in new birds with the specified speed
    for (int i = 0; i < birds.size(); i++) {
      Bird b = birds.get(i);
      b.move(speed);
      
      // collision checking
      d.contact(b.getX(), b.getY(), b.getWidth(), b.getHeight());
      
      // removing birds when they are removed from the screen
      //if(b.dead()) birds.remove(i);
    }
    if(frameCount %250 == 0) birds.add(new Bird());
    
    // adding in new cacti with the specified speed
    for (int i = 0; i < cacti.size(); i++) {
      Cactus c = cacti.get(i);
      c.move(speed);
      
      // collision checking
      d.contact(c.getX(), c.getY(), c.getWidth(), c.getHeight());
      
      // removing cacti when they are removed from the screen
      //if(b.dead()) birds.remove(i);
    }
    if(frameCount %200 == 0) cacti.add(new Cactus());
    
    
  }
}

void keyPressed() {
  if (key == ' ' || keyCode == UP) upkey = true; 
  if (keyCode == DOWN) downkey = true;
}

void keyReleased() {
  //if(key == ' ' || keyCode == UP) upkey = false; 
  if (keyCode == DOWN) downkey = false;
}
