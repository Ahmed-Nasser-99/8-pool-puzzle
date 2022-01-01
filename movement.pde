void moveLeft() {
  
  // checks if there are pocket on the left so the white ball will not stop at the left border
  // thus the leftborder is reachable before the pockets
  boolean noLeftPockets = true;
  if (terminal1[1] == balls[0].y && terminal1[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal2[1] == balls[0].y && terminal2[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal3[1] == balls[0].y && terminal3[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal4[1] == balls[0].y && terminal4[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal5[1] == balls[0].y && terminal5[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal6[1] == balls[0].y && terminal6[0] < balls[0].x)
    noLeftPockets = false;
  if (terminal7[1] == balls[0].y && terminal7[0] < balls[0].x)
    noLeftPockets = false;
  
  // if the process if left (the player pressed the left arrow while it is valid)
  if (process == 'l' && collided == false) {
    balls[0].x -= speed;
    if (balls[0].x == balls[1].x + radius && balls[0].y == balls[1].y) {
      hit.play(1,0.5);
      i = 1;
      collided = true;
      
    }
    else if (balls[0].x == balls[2].x + radius && balls[0].y == balls[2].y) {
      i = 2;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[3].x + radius && balls[0].y == balls[3].y) {
      i = 3;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[4].x + radius && balls[0].y == balls[4].y) {
      i = 4;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[5].x + radius && balls[0].y == balls[5].y) {
      i = 5;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[6].x + radius && balls[0].y == balls[6].y) {
      i = 6;
      collided = true;
      hit.play(1,0.5);
    }
    else if ((balls[0].x == terminal1[0] && balls[0].y == terminal1[1])
      || (balls[0].x == terminal2[0]  && balls[0].y == terminal2[1])
      || (balls[0].x == terminal3[0]  && balls[0].y == terminal3[1])
      || (balls[0].x == terminal4[0]  && balls[0].y == terminal4[1])
      || (balls[0].x == terminal5[0]  && balls[0].y == terminal5[1])
      || (balls[0].x == terminal6[0]  && balls[0].y == terminal6[1])
      || (balls[0].x == terminal7[0]  && balls[0].y == terminal7[1])) {
      balls[0].x = -100;
      lostGame = true;
      fall.play(1,0.25);
    }
    // if the white ball reached the left border
    else if (balls[0].x == leftBorder && noLeftPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  // if there are a collided ball
  if (i > 0) {
    balls[i].x -= speed;
    
    // if that ball fell into a pocket
    if ((balls[i].x == terminal1[0] - 10 && balls[i].y == terminal1[1])
      || (balls[i].x == terminal2[0] - 10 && balls[i].y == terminal2[1])
      || (balls[i].x == terminal3[0] - 10 && balls[i].y == terminal3[1])
      || (balls[i].x == terminal4[0] - 10 && balls[i].y == terminal4[1])
      || (balls[i].x == terminal5[0] - 10 && balls[i].y == terminal5[1])
      || (balls[i].x == terminal6[0] - 10 && balls[i].y == terminal6[1])
      || (balls[i].x == terminal7[0] - 10 && balls[i].y == terminal7[1])) {
      balls[i].x = -100;
      i = 0;
      process = '0';
      collided = false;
      remaining--;
      fall.play(1,0.25);
    }
    // if the collided ball reached the left border (impossible!)
    else if (balls[i].x == leftBorder && noLeftPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
}

void moveRight() {
  // checks if there are pocket on the right so the white ball will not stop at the right border
  // thus the right border is reachable before the pockets
  boolean noRightPockets = true;
  if (terminal1[1] == balls[0].y && terminal1[0] > balls[0].x)
    noRightPockets = false;
  if (terminal2[1] == balls[0].y && terminal2[0] > balls[0].x)
    noRightPockets = false;
  if (terminal3[1] == balls[0].y && terminal3[0] > balls[0].x)
    noRightPockets = false;
  if (terminal4[1] == balls[0].y && terminal4[0] > balls[0].x)
    noRightPockets = false;
  if (terminal5[1] == balls[0].y && terminal5[0] > balls[0].x)
    noRightPockets = false;
  if (terminal6[1] == balls[0].y && terminal6[0] > balls[0].x)
    noRightPockets = false;
  if (terminal7[1] == balls[0].y && terminal7[0] > balls[0].x)
    noRightPockets = false;
  
  // if the process if right (the player pressed the right arrow while it is valid)
  if (process == 'r' && collided == false) {
    balls[0].x += speed;
    if (balls[0].x == balls[1].x - radius &&  balls[0].y == balls[1].y) {
      hit.play(1,0.5);
      i = 1;
      collided = true;
    }
    else if (balls[0].x == balls[2].x - radius &&  balls[0].y == balls[2].y) {
      hit.play(1,0.5);
      i = 2;
      collided = true;
      
    }
    else if (balls[0].x == balls[3].x - radius &&  balls[0].y == balls[3].y) {
      i = 3;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[4].x - radius &&  balls[0].y == balls[4].y) {
      i = 4;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[5].x - radius &&  balls[0].y == balls[5].y) {
      i = 5;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].x == balls[6].x - radius &&  balls[0].y == balls[6].y) {
      i = 6;
      collided = true;
      hit.play(1,0.5);
    }
    else if ((balls[0].x == terminal1[0] && balls[0].y == terminal1[1])
      || (balls[0].x == terminal2[0]  && balls[0].y == terminal2[1])
      || (balls[0].x == terminal3[0]  && balls[0].y == terminal3[1])
      || (balls[0].x == terminal4[0]  && balls[0].y == terminal4[1])
      || (balls[0].x == terminal5[0]  && balls[0].y == terminal5[1])
      || (balls[0].x == terminal6[0]  && balls[0].y == terminal6[1])
      || (balls[0].x == terminal7[0]  && balls[0].y == terminal7[1])) {
      balls[0].x = -100;
      collided = true;
      lostGame = true;
      fall.play(1,0.25);
    }
    // if the white ball reached the right border
    else if (balls[0].x == rightBorder && noRightPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  // if there are a collided ball
  if (i > 0) {
    balls[i].x += speed;
    
    // if that ball fell into a pocket
    if ((balls[i].x == terminal1[0] + 10 && balls[i].y == terminal1[1])
      || (balls[i].x == terminal2[0] + 10 && balls[i].y == terminal2[1])
      || (balls[i].x == terminal3[0] + 10 && balls[i].y == terminal3[1])
      || (balls[i].x == terminal4[0] + 10 && balls[i].y == terminal4[1])
      || (balls[i].x == terminal5[0] + 10 && balls[i].y == terminal5[1])
      || (balls[i].x == terminal6[0] + 10 && balls[i].y == terminal6[1])
      || (balls[i].x == terminal7[0] + 10 && balls[i].y == terminal7[1])) {
      balls[i].x = -100;
      i = 0;
      process = '0';
      collided = false;
      remaining--;
      fall.play(1,0.25);
    }
    // if the collided ball reached the right border (impossible!)
    else if (balls[i].x == rightBorder && noRightPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
}

void moveUp() {
  // checks if there are pocket on the upper so the white ball will not stop at the upper border
  // thus the upper border is reachable before the pockets
  boolean noUpperPockets = true;
  if (terminal1[0] == balls[0].x && terminal1[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal2[0] == balls[0].x && terminal2[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal3[0] == balls[0].x && terminal3[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal4[0] == balls[0].x && terminal4[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal5[0] == balls[0].x && terminal5[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal6[0] == balls[0].x && terminal6[1] < balls[0].y)
    noUpperPockets = false;
  if (terminal7[0] == balls[0].x && terminal7[1] < balls[0].y)
    noUpperPockets = false;
  
  // if the process if up (the player pressed the up arrow while it is valid)
  if (process == 'u' && collided == false) {
    balls[0].y -= speed;
    if (balls[0].y == balls[1].y + radius &&  balls[0].x == balls[1].x) {
      hit.play(1,0,0.5);
      i = 1;
      collided = true;
      
    }
    else if (balls[0].y == balls[2].y + radius &&  balls[0].x == balls[2].x) {
      i = 2;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[3].y + radius &&  balls[0].x == balls[3].x) {
      i = 3;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[4].y + radius &&  balls[0].x == balls[4].x) {
      i = 4;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[5].y + radius &&  balls[0].x == balls[5].x) {
      i = 5;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[6].y + radius &&  balls[0].x == balls[6].x) {
      i = 6;
      collided = true;
      hit.play(1,0.5);
    }
    else if ((balls[0].x == terminal1[0] && balls[0].y == terminal1[1])
      || (balls[0].x == terminal2[0]  && balls[0].y == terminal2[1])
      || (balls[0].x == terminal3[0]  && balls[0].y == terminal3[1])
      || (balls[0].x == terminal4[0]  && balls[0].y == terminal4[1])
      || (balls[0].x == terminal5[0]  && balls[0].y == terminal5[1])
      || (balls[0].x == terminal6[0]  && balls[0].y == terminal6[1])
      || (balls[0].x == terminal7[0]  && balls[0].y == terminal7[1])) {
      balls[0].x = -100;
      collided = true;
      lostGame = true;
      fall.play(1,0.25);
    }
    // if the white ball reached the upper border
    else if (balls[0].y == upperBorder && noUpperPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  // if there are a collided ball
  if (i > 0) {
    balls[i].y -= speed;
    
    // if that ball fell into a pocket
    if ((balls[i].y == terminal1[1] - 10 && balls[i].x == terminal1[0])
      || (balls[i].y == terminal2[1] - 10 && balls[i].x == terminal2[0])
      || (balls[i].y == terminal3[1] - 10 && balls[i].x == terminal3[0])
      || (balls[i].y == terminal4[1] - 10 && balls[i].x == terminal4[0])
      || (balls[i].y == terminal5[1] - 10 && balls[i].x == terminal5[0])
      || (balls[i].y == terminal6[1] - 10 && balls[i].x == terminal6[0])
      || (balls[i].y == terminal7[1] - 10 && balls[i].x == terminal7[0])) {
      balls[i].x = -100;
      i = 0;
      process = '0';
      collided = false;
      remaining--;
      fall.play(1,0.25);
    }
    // if the collided ball reached the upper border (impossible!)
    else if (balls[i].x == upperBorder && noUpperPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
}

void moveDown(){
  // checks if there are pocket on the lower so the white ball will not stop at the lower border
  // thus the lower border is reachable before the pockets
  boolean noLowerPockets = true;
  if (terminal1[0] == balls[0].x && terminal1[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal2[0] == balls[0].x && terminal2[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal3[0] == balls[0].x && terminal3[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal4[0] == balls[0].x && terminal4[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal5[0] == balls[0].x && terminal5[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal6[0] == balls[0].x && terminal6[1] > balls[0].y)
    noLowerPockets = false;
  if (terminal6[0] == balls[0].x && terminal6[1] > balls[0].y)
    noLowerPockets = false;
  
  // if the process if down (the player pressed the down arrow while it is valid)
  if (process == 'd' && collided == false) {
    balls[0].y += speed;
    
    // if the white ball collided with any other ball
    if (balls[0].y == balls[1].y - radius &&  balls[0].x == balls[1].x) {
      i = 1;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[2].y - radius &&  balls[0].x == balls[2].x) {
      i = 2;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[3].y - radius &&  balls[0].x == balls[3].x) {
      i = 3;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[4].y - radius &&  balls[0].x == balls[4].x) {
      i = 4;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[5].y - radius &&  balls[0].x == balls[5].x) {
      i = 5;
      collided = true;
      hit.play(1,0.5);
    }
    else if (balls[0].y == balls[6].y - radius &&  balls[0].x == balls[6].x) {
      i = 6;
      collided = true;
      hit.play(1,0.5);
    }
    
    // if the white ball fell in any pocket
    else if ((balls[0].x == terminal1[0] && balls[0].y == terminal1[1])
      || (balls[0].x == terminal2[0]  && balls[0].y == terminal2[1])
      || (balls[0].x == terminal3[0]  && balls[0].y == terminal3[1])
      || (balls[0].x == terminal4[0]  && balls[0].y == terminal4[1])
      || (balls[0].x == terminal5[0]  && balls[0].y == terminal5[1])
      || (balls[0].x == terminal6[0]  && balls[0].y == terminal6[1])
      || (balls[0].x == terminal7[0]  && balls[0].y == terminal7[1])) {
      balls[0].x = -100;
      collided = true;
      lostGame = true;
      fall.play(1,0.25);
    }
    // if the white ball reached the lower border
    else if (balls[0].y == lowerBorder && noLowerPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  
  // if there are a collided ball
  if (i > 0) {
    balls[i].y += speed;
    
    // if that ball fell into a pocket
    if ((balls[i].y == terminal1[1] + 10 && balls[i].x == terminal1[0])
      || (balls[i].y == terminal2[1] + 10 && balls[i].x == terminal2[0])
      || (balls[i].y == terminal3[1] + 10 && balls[i].x == terminal3[0])
      || (balls[i].y == terminal4[1] + 10 && balls[i].x == terminal4[0])
      || (balls[i].y == terminal5[1] + 10 && balls[i].x == terminal5[0])
      || (balls[i].y == terminal6[1] + 10 && balls[i].x == terminal6[0])
      || (balls[i].y == terminal7[1] + 10 && balls[i].x == terminal7[0])) {
      balls[i].x = -100;
      i = 0;
      process = '0';
      collided = false;
      remaining--;
      fall.play(1,0.25);
    }
    // if the collided ball reached the lower border (impossible!)
    else if (balls[i].x == lowerBorder && noLowerPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
}
