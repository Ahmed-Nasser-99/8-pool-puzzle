void startLevel(boolean isNotRetry){
  // set the collided ball to 0 to stop rotating them
  i = 0;
  
  // if the player completed the level it can be increased again
  levelIncreased = false;
  
  levelStarted = true;
  
  // if it is retry don't generate a new table and background
  if(isNotRetry == true){
    randomTable = int(random(4));
    randomBackground = int(random(5));
  }
  
  // while the new random table and background equal the last ones
  // generate another one
  while(lastRandomTable == randomTable && isNotRetry == true){
    randomTable = int(random(4));
  }
  
  while(randomBackground == lastRandomBackground && isNotRetry == true){
    randomBackground = int(random(5));
  }
  
  // set the table and the background value to an image according to the random variables
  if(randomTable == 0)
    table = loadImage("red-table.png");
  else if(randomTable == 1)
    table = loadImage("green-table.png");
  else if(randomTable == 2)
    table = loadImage("blue-table.png");
  else
    table = loadImage("cyan-table.png");
    
  if(randomBackground == 0)
    background = loadImage("blue-background.PNG");
  else if(randomBackground == 1)
    background = loadImage("green-background.PNG");
  else if(randomBackground == 2)
    background = loadImage("orange-background.PNG");
  else if(randomBackground == 3)
    background = loadImage("pink-background.PNG");
  else
    background = loadImage("purple-background.PNG");
  
  // just remember the last random table and background so it will not be displayed again
  lastRandomTable = randomTable;
  lastRandomBackground = randomBackground;
  lostGame = false;
  collided = false;
  process = '0';
  radius = 35;
  
  
  // according to the level the positions of the balls, terminals and the "remaining" will change
  if(level == 1){
    remaining = 1;
    balls[0].x = 300;
    balls[0].y = 505;
    
    balls[1].x = 300;
    balls[1].y = 260;
    
    terminal1[0] = 300;
    terminal1[1] = 125;
  }
  
  if(level == 2){
    remaining = 2;
    balls[0].x = 230;
    balls[0].y = 505;
    
    balls[1].x = 370;
    balls[1].y = 260;
    
    balls[2].x = 405;
    balls[2].y = 505;
    
    terminal1[0] = 370;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 505;
  }
  
  if(level == 3){
    remaining = 3;
    balls[0].x = 230;
    balls[0].y = 505;
    
    balls[1].x = 370;
    balls[1].y = 260;
    
    balls[2].x = 405;
    balls[2].y = 505;
    
    balls[3].x = 230;
    balls[3].y = 295;
    
    terminal1[0] = 370;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 505;
    
    terminal3[0] = 130;
    terminal3[1] = 295;
  }
  
  if(level == 4){
    remaining = 4;
    balls[0].x = 335;
    balls[0].y = 505;
    
    balls[1].x = 195;
    balls[1].y = 505;
    
    balls[2].x = 405;
    balls[2].y = 505;
    
    balls[3].x = 230;
    balls[3].y = 225;
    
    balls[4].x = 370;
    balls[4].y = 190;
    
    terminal1[0] = 130;
    terminal1[1] = 505;
    
    terminal2[0] = 470;
    terminal2[1] = 505;
    
    terminal3[0] = 130;
    terminal3[1] = 225;
    
    terminal4[0] = 370;
    terminal4[1] = 120;
    
    terminal5[0] = 230;
    terminal5[1] = 120;
  }
  
  if(level == 5){
    remaining = 4;
    balls[0].x = 230;
    balls[0].y = 260;
    
    balls[1].x = 265;
    balls[1].y = 225;
    
    balls[2].x = 335;
    balls[2].y = 260;
    
    balls[3].x = 300;
    balls[3].y = 505;
    
    balls[4].x = 230;
    balls[4].y = 540;
    
    terminal1[0] = 265;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 260;
    
    terminal3[0] = 470;
    terminal3[1] = 505;
    
    terminal4[0] = 300;
    terminal4[1] = 680;
    
    terminal5[0] = 230;
    terminal5[1] = 680;

  }
  
  if(level == 6){
    remaining = 5;
    balls[0].x = 300;
    balls[0].y = 225;
    
    balls[1].x = 335;
    balls[1].y = 260;
    
    balls[2].x = 230;
    balls[2].y = 295;
    
    balls[3].x = 370;
    balls[3].y = 400;
    
    balls[4].x = 300;
    balls[4].y = 435;
    
    balls[5].x = 335;
    balls[5].y = 610;
    
    terminal1[0] = 335;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 400;
    
    terminal3[0] = 335;
    terminal3[1] = 680;
    
    terminal4[0] = 300;
    terminal4[1] = 680;
    
    terminal5[0] = 130;
    terminal5[1] = 295;

  }
  
  if(level == 7){
    remaining = 5;
    balls[0].x = 230;
    balls[0].y = 225;
    
    balls[1].x = 300;
    balls[1].y = 505;
    
    balls[2].x = 405;
    balls[2].y = 470;
    
    balls[3].x = 335;
    balls[3].y = 225;
    
    balls[4].x = 230;
    balls[4].y = 470;
    
    balls[5].x = 265;
    balls[5].y = 575;
    
    terminal1[0] = 470;
    terminal1[1] = 225;
    
    terminal2[0] = 470;
    terminal2[1] = 470;
    
    terminal3[0] = 300;
    terminal3[1] = 680;
    
    terminal4[0] = 265;
    terminal4[1] = 680;
    
    terminal5[0] = 230;
    terminal5[1] = 680;
    
    terminal6[0] = 130;
    terminal6[1] = 470;

  }
  
  if(level == 8){
    remaining = 5;
    balls[0].x = 300;
    balls[0].y = 330;
    
    balls[1].x = 230;
    balls[1].y = 225;
    
    balls[2].x = 335;
    balls[2].y = 260;
    
    balls[3].x = 300;
    balls[3].y = 505;
    
    balls[4].x = 195;
    balls[4].y = 330;
    
    balls[5].x = 195;
    balls[5].y = 470;
    
    terminal1[0] = 230;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 260;
    
    terminal3[0] = 300;
    terminal3[1] = 680;
    
    terminal4[0] = 130;
    terminal4[1] = 470;
    
    terminal5[0] = 130;
    terminal5[1] = 330;

  }
  
  if(level == 9){
    remaining = 6;
    balls[0].x = 300;
    balls[0].y = 365;
    
    balls[1].x = 405;
    balls[1].y = 540;
    
    balls[2].x = 195;
    balls[2].y = 260;
    
    balls[3].x = 405;
    balls[3].y = 260;
    
    balls[4].x = 300;
    balls[4].y = 225;
    
    balls[5].x = 230;
    balls[5].y = 575;
    
    balls[6].x = 370;
    balls[6].y = 610;
    
    terminal1[0] = 300;
    terminal1[1] = 125;
    
    terminal2[0] = 470;
    terminal2[1] = 260;
    
    terminal3[0] = 470;
    terminal3[1] = 540;
    
    terminal4[0] = 370;
    terminal4[1] = 680;
    
    terminal5[0] = 230;
    terminal5[1] = 680;
    
    terminal6[0] = 130;
    terminal6[1] = 575;
    
    terminal7[0] = 130;
    terminal7[1] = 260;
  }
  
  if(level == 10){
    remaining = 6;
    balls[0].x = 230;
    balls[0].y = 505;
    
    balls[1].x = 335;
    balls[1].y = 295;
    
    balls[2].x = 230;
    balls[2].y = 575;
    
    balls[3].x = 265;
    balls[3].y = 435;
    
    balls[4].x = 230;
    balls[4].y = 260;
    
    balls[5].x = 300;
    balls[5].y = 610;
    
    balls[6].x = 300;
    balls[6].y = 190;
    
    terminal1[0] = 230;
    terminal1[1] = 125;
    
    terminal2[0] = 265;
    terminal2[1] = 125;
    
    terminal3[0] = 300;
    terminal3[1] = 125;
    
    terminal4[0] = 470;
    terminal4[1] = 295;
    
    terminal5[0] = 300;
    terminal5[1] = 680;
    
    terminal6[0] = 230;
    terminal6[1] = 680;
    
    terminal7[0] = 130;
    terminal7[1] = 575;

  }
  
  if(level == 11){
    remaining = 6;
    balls[0].x = 300;
    balls[0].y = 330;
    
    balls[1].x = 300;
    balls[1].y = 190;
    
    balls[2].x = 370;
    balls[2].y = 435;
    
    balls[3].x = 405;
    balls[3].y = 260;
    
    balls[4].x = 195;
    balls[4].y = 400;
    
    balls[5].x = 405;
    balls[5].y = 225;
    
    balls[6].x = 230;
    balls[6].y = 225;
    
    terminal1[0] = 300;
    terminal1[1] = 125;
    
    terminal2[0] = 230;
    terminal2[1] = 125;
    
    terminal3[0] = 470;
    terminal3[1] = 225;
    
    terminal4[0] = 470;
    terminal4[1] = 260;
    
    terminal5[0] = 370;
    terminal5[1] = 680;
    
    terminal6[0] = 130;
    terminal6[1] = 400;
    
    terminal7[0] = 130;
    terminal7[1] = 225;

  }
  
  if(level == 12){
    remaining = 6;
    balls[0].x = 230;
    balls[0].y = 470;
    
    balls[1].x = 300;
    balls[1].y = 610;
    
    balls[2].x = 335;
    balls[2].y = 540;
    
    balls[3].x = 230;
    balls[3].y = 260;
    
    balls[4].x = 300;
    balls[4].y = 260;
    
    balls[5].x = 370;
    balls[5].y = 295;
    
    balls[6].x = 230;
    balls[6].y = 575;
    
    terminal1[0] = 300;
    terminal1[1] = 125;
    
    terminal2[0] = 230;
    terminal2[1] = 125;
    
    terminal3[0] = 470;
    terminal3[1] = 295;
    
    terminal4[0] = 470;
    terminal4[1] = 540;
    
    terminal5[0] = 335;
    terminal5[1] = 680;
    
    terminal6[0] = 300;
    terminal6[1] = 680;
    
    terminal7[0] = 230;
    terminal7[1] = 680;

  }
  
  if(level == 14)
    level = 13;
  
  if(level == 13){
    remaining = 6;
    balls[0].x = 230;
    balls[0].y = 470;
    
    balls[1].x = 300;
    balls[1].y = 260;
    
    balls[2].x = 265;
    balls[2].y = 540;
    
    balls[3].x = 195;
    balls[3].y = 505;
    
    balls[4].x = 335;
    balls[4].y = 505;
    
    balls[5].x = 300;
    balls[5].y = 295;
    
    balls[6].x = 230;
    balls[6].y = 225;
    
    terminal1[0] = 300;
    terminal1[1] = 125;
    
    terminal2[0] = 230;
    terminal2[1] = 125;
    
    terminal3[0] = 470;
    terminal3[1] = 260;
    
    terminal4[0] = 470;
    terminal4[1] = 505;
    
    terminal5[0] = 265;
    terminal5[1] = 680;
    
    terminal6[0] = 130;
    terminal6[1] = 505;

  }
  
  
  
}
