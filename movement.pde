void moveLeft() {
  
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
    else if (balls[0].x == leftBorder && noLeftPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  
  
  if (i > 0) {
    balls[i].x -= speed;
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
    else if (balls[i].x == leftBorder && noLeftPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
  
  
  keyCode = 0;
  return;
}

void moveRight() {
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
    else if (balls[0].x == rightBorder && noRightPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  
  
  if (i > 0) {
    balls[i].x += speed;
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
    else if (balls[i].x == rightBorder && noRightPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
  
  keyCode = 0;
  return;
}

void moveUp() {
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
    else if (balls[0].y == upperBorder && noUpperPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  
  
  if (i > 0) {
    balls[i].y -= speed;
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
    else if (balls[i].x == upperBorder && noUpperPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
  
  keyCode = 0;
  return;
}

void moveDown() {
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
  
  
  
  if (process == 'd' && collided == false) {
    balls[0].y += speed;
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
    else if (balls[0].y == lowerBorder && noLowerPockets) {
      collided = true;
      process = '0';
      collided = false;
    }
  }
  
  
  
  if (i > 0) {
    balls[i].y += speed;
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
    else if (balls[i].x == lowerBorder && noLowerPockets) {
      i = 0;
      process = '0';
      collided = false;
    }
  }
  
  keyCode = 0;
  return;
}
