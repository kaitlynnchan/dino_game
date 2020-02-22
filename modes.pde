void modeIntro() {
  for (int i = 0; i < clouds.size(); i++) {
    clouds.remove(i);
  }
  for (int i = 0; i < birds.size(); i++) {
    birds.remove(i);
  }
  for (int i = 0; i < cacti.size(); i++) {
    cacti.remove(i);
  }
  background(255); 
  d.show();

  fill(100);
  textSize(40);
  text("PLAY", width/2-70, height/3);
  textSize(20);
  text("press the space or upkey to start", width/4 - 20, height/2 - 20);

  if (upkey) {
    d.jump(); 
    mode = PLAY;
  }
}

void modePlay() {
  int speed = 5;

  // cloud
  for (int i = 0; i < clouds.size(); i++) {
    Cloud c = clouds.get(i);
    c.move();
    //if(b.dead()) birds.remove(i);
  }
  if (frameCount %300 == 0) clouds.add(new Cloud());

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
  if (frameCount %250 == 0) birds.add(new Bird());

  // adding in new cacti with the specified speed
  for (int i = 0; i < cacti.size(); i++) {
    Cactus c = cacti.get(i);
    c.move(speed);

    // collision checking
    if (d.contact(c.getX(), c.getY(), c.getWidth(), c.getHeight())) mode = DEAD;

    // removing cacti when they are removed from the screen
    //if(b.dead()) birds.remove(i);
  }
  if (frameCount %200 == 0) cacti.add(new Cactus());
}




void modeDead() {

  g.show();
  d.show();
  for (int i = 0; i < clouds.size(); i++) {
    Cloud c = clouds.get(i);
    c.show();
  }
  for (int i = 0; i < birds.size(); i++) {
    Bird b = birds.get(i);
    b.show();
  }

  for (int i = 0; i < cacti.size(); i++) {
    Cactus c = cacti.get(i);
    c.show();
  }

  //background(0, alpha(1));
  fill(0, 30);
  rect(-1, -1, width+2, height+2);

  fill(0);
  text("G A M E  O V E R", width/2 -150, 100);
  image(back, width/2 - back.width/2, height/2 - back.height/2);
}
