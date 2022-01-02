// to deal wiht the sound files
import processing.sound.*;

// when the game is launched for the first time
void setup(){
  size(600, 800);
  if (level == 14)
    gameFinished = true;
  // load the level value from the text file
  // levelStr is an array of strings which contains the level value as a string 
  // in the first element [0]
  levelStr = loadStrings("level.txt");
  level = int(levelStr[0]);
  
  // ball[0] is the white one
  balls[0] = new Ball(-100,-100);
  balls[1] = new Ball(-100,-100);
  balls[2] = new Ball(-100,-100);
  balls[3] = new Ball(-100,-100);
  balls[4] = new Ball(-100,-100);
  balls[5] = new Ball(-100,-100);
  balls[6] = new Ball(-100,-100);
  
  imgBall = loadImage("white-ball.png");
  imgBall1 = loadImage("yellow-ball.png");
  imgBall2 = loadImage("blue-ball.png");
  imgBall3 = loadImage("red-ball.png");
  imgBall4 = loadImage("purple-ball.png");
  imgBall5 = loadImage("orange-ball.png");
  imgBall6 = loadImage("green-ball.png");
  arrowUp = loadImage("up.png");
  arrowDown = loadImage("down.png");
  arrowLeft = loadImage("left.png");
  arrowRight = loadImage("right.png");
  gameFinishedPic = loadImage("victory.png");
  mainmenuPic = loadImage("mainmenu.png");
  levelFinishedPic = loadImage("complete.png");
  pointer = loadImage("pointer.png");
  arrowKeys = loadImage("arrow_keys.png");
  instructions = loadImage("instructions.png");
  hit = new SoundFile(this, "hit.wav");
  fall = new SoundFile(this, "fall.wav");
  levelCompleted = new SoundFile(this, "bravoWithSound.wav");
  gameCompleted = new SoundFile(this, "gameCompleted.wav");
  
  // to draw the images from its center not from the top left point of it 
  imageMode(CENTER);
  
  // set it to a very different number so first time it will not match the random value 
  lastRandomTable = 100;
  lastRandomBackground = 100;
  
 
}

void draw(){
  noStroke();
  if(levelStarted == true)
    background(background);
  
  // if we are not in the mainmenu
  if(mainmenu == false){
    if ((keyPressed && (key == CODED)) && remaining > 0) { 
      if (keyCode == LEFT && process == '0' && balls[0].x != leftBorder && level != 1 && level != 2) {
        if((level == 3 && remaining == 1) || level > 3)
        // if the player pressed the left arrow key and there is no current process
        // (the white ball is static) and the white ball doesn't touch the left border
        // and it is valid to move left at this situation set the process "l"
        process = 'l';
      } 
      else if (keyCode == RIGHT && process == '0' && balls[0].x != rightBorder) { 
        if((level == 2 && remaining == 2) || (level == 3 && remaining == 3) || level > 3)
        // if the player pressed the right arrow key and there is no current process
        // (the white ball is static) and the white ball doesn't touch the right border
        // and it is valid to move right at this situation set the process "r"
          process = 'r';
      }
      else if (keyCode == UP && process == '0' && balls[0].y != upperBorder) {
        if(level == 1 || (level == 2 && remaining == 1) || (level == 3 && remaining == 2) || level > 3)
        // if the player pressed the up arrow key and there is no current process
        // (the white ball is static) and the white ball doesn't touch the upper border
        // and it is valid to move up at this situation set the process "u"
          process = 'u';
      }
      else if (keyCode == DOWN && process == '0'  && balls[0].y != lowerBorder && level > 3) {
        // if the player pressed the down arrow key and there is no current process
        // (the white ball is static) and the white ball doesn't touch the lower border
        // and it is valid to move down at this situation set the process "d"
        process = 'd';
      }
    }
  
    if(process == 'l'){
      moveLeft();
    }
    else if(process == 'r'){
      moveRight();
    }
    else if(process == 'u'){
      moveUp();
    }
    else if(process == 'd'){
      moveDown();
    }
  }
  
  if(levelStarted)
  // render the image of the table at the center of the screen
    image(table, width / 2, height / 2);
  
  // set the terminals color according to the rendered table
  if(randomTable == 0) // black table
    fill(100);
  else if(randomTable == 2) // blue table
    fill(150);
  else 
    fill(0);
    
  circle(terminal1[0],terminal1[1],radius);
  
  if (terminal2[0] != 0){
    circle(terminal2[0],terminal2[1],radius);
  }
  if (terminal3[0] != 0){
    circle(terminal3[0],terminal3[1],radius);
  }
  if (terminal4[0] != 0){
    circle(terminal4[0],terminal4[1],radius);
  }
  if (terminal5[0] != 0){
    circle(terminal5[0],terminal5[1],radius);
  }
  if (terminal6[0] != 0){
    circle(terminal6[0],terminal6[1],radius);
  }
  if (terminal7[0] != 0){
    circle(terminal7[0],terminal7[1],radius);
  }
  
  // translation and rotation of the balls according to its position and the collided status
  pushMatrix();
    translate(balls[0].x,balls[0].y);
    if(i == 0 && process != '0'){
      // process == 0 -> the white ball hasn't collided to any ball yet
      // process != '0' -> there is a current process in the game
      balls[0].angle += 0.3;
      rotate(balls[0].angle);
    }
    image(imgBall,0,0);
  popMatrix();
  
  pushMatrix();
    translate(balls[1].x,balls[1].y);
    if(i == 1 ){
      balls[1].angle +=0.3;
      rotate(balls[1].angle);
    }
    image(imgBall1,0,0);
  popMatrix();
  
  
  if(balls[2].x != -100){
    pushMatrix();
      translate(balls[2].x,balls[2].y);
      if(i == 2 ){
      balls[2].angle +=0.3;
      rotate(balls[2].angle);
    }
      image(imgBall2,0,0);
    popMatrix();
  }
  
  if(balls[3].x != -100){
    pushMatrix();
      translate(balls[3].x, balls[3].y);
      if(i == 3 ){
      balls[3].angle +=0.3;
      rotate(balls[3].angle);
    }
      image(imgBall3,0,0);
    popMatrix();
  }
  
  if(balls[4].x != -100){
    pushMatrix();
      translate(balls[4].x, balls[4].y);
      if(i == 4 ){
      balls[4].angle +=0.3;
      rotate(balls[4].angle);
    }
      image(imgBall4,0,0);
    popMatrix();
  }
  if(balls[5].x != -100){
    pushMatrix();
      translate(balls[5].x,balls[5].y);
      if(i == 5 ){
      balls[5].angle +=0.3;
      rotate(balls[5].angle);
    }
      image(imgBall5,0,0);
    popMatrix();
  }
  if(balls[6].x != -100){
    pushMatrix();
      translate(balls[6].x,balls[6].y);
      if(i == 6 ){
      balls[6].angle +=0.3;
      rotate(balls[6].angle);
    }
      image(imgBall6,0,0);
    popMatrix();
  }
  
  // tutorial stuff to show the arrows images in the tutorial levels
  if(level == 1 && process == '0' && remaining == 1)
    image(arrowUp, 300, 400, 75, 75);
  if(level == 2 && process == '0' && remaining == 2)
    image(arrowRight, 300, 500, 75, 75);
  if(level == 2 && process == '0' && remaining == 1)
    image(arrowUp, 370, 365, 75, 75);
  if(level == 3 && process == '0' && remaining == 3)
    image(arrowRight, 300, 500, 75, 75);
  if(level == 3 && process == '0' && remaining == 2)
    image(arrowUp, 370, 365, 75, 75);
  if(level == 3 && process == '0' && remaining == 1)
    image(arrowLeft, 295, 300, 75, 75);
  
  
  
  // if the player compeleted the level and it is not the last level
  if(remaining == 0 && level < 14 && mainmenu == false){  
    
    // levelIncreased is set to false every start level
    // so it will compute this piece of code JUST ONCE
    if(levelIncreased == false){
      
      // play the sound
      // 1 -> rate of the clip (speed of the clip) || 0.5 -> is the sound of the clip (amp)
      level++;
      // saving system 
      levelStr[0] = "" + level;
      saveStrings("./data/level.txt",levelStr);
      levelIncreased = true;
      
      if(level < 14)
      levelCompleted.play(1, 0.5);
    }
    
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(50);
    fill(255);
    text("LEVEL COMPELETED", 65, 200);
    image(levelFinishedPic,300,400);
    fill(0,255,0);
    rect(width / 2 - 180, 600, 360, 70);
    textSize(50);
    fill(255);
    text("NEXT LEVEL", width / 2 - 135, 650);
  }
  
  // if the player finished the game
  if(level == 14 && remaining == 0 && mainmenu == false){
    stroke(0);
    strokeWeight(2);
    gameFinished = true;
    fill(0,0,0,100);
    image(gameFinishedPic,width/2,height/2);
    rect(0,0,width,height);
    textSize(40);
    fill(255);
    fill(0,255,0);
    text("THANKS FOR PLAYING", 80, 100);
    fill(255);
    text("POOL 8 BUZZLE", 150, 150);
    fill(0,255,0);
    text("A GAME DEVELOPED BY", 80, 250);
    fill(255);
    text("AHMED NASSER", 160, 300);
    text("AHMED YOUNES", 160, 350);
    text("AHMED HESHAM", 160, 400);
    text("MOHAMED YASSER", 140, 450);
    fill(0,255,0);
    text("UNDER THE SUPERVISION OF", 30, 550);
    fill(255);
    text("DR SHAIMAA RIZK", 140, 600);
    text("ENG MOFIDA MAHMOUD", 80, 650);
    
    fill(255,0,0);
    rect(10, 710, width-20,60);
    fill(255);
    textSize(30);
    text("PLEASE CONSIDER GIVING US A BONUS", 20, 750);
    
    if(gameCompletedSound == false){
      gameCompleted.play();
      gameCompletedSound = true;
    }
  }

  // if the player fell the white ball in a pocket
  if(lostGame){
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(80);
    fill(255);
    text("YOU LOST ", 100, 300);
    textSize(30);
    text("The White Ball Fell Into A pocket", 60, 350);
    
    fill(0,255,0);
    rect(width / 2 - 180, 500, 360, 70);
    textSize(50);
    fill(255);
    text("RETRY, It's OK", width / 2 - 170, 550);
  }
  
  // show level counter in the top right corner if there are balls in the level
  if(remaining > 0){
    fill(#b48cf6);
    rect(0, 0, 140,40);
    fill(250);
    textSize(30);
    text("LEVEL " + level, 5, 30);
  }
  
  // retry button in the top right corner if there are balls in the level
  if(remaining > 0 && lostGame == false){
    fill(0,255,0);
    rect(width - 100, 0, 100, 50);
    textSize(35);
    fill(255);
    text("Retry", width - 95, 40);
    
    fill(150);
    rect(width - 120, height-50, 120, 50);
    textSize(35);
    fill(255);
    text("Return", width - 115, height-10);
  }
  
  // if the player stuck and the white ball touched any border
  // show the pointer to the retry button
  if(balls[0].x == leftBorder || balls[0].x == rightBorder || balls[0].y == upperBorder || balls[0].y == lowerBorder ){
      image(pointer,width - 100,70);
  }
  
  // if we are at the mainmenu
  if(mainmenu){
    image(mainmenuPic,width/2,height/2);
    fill(255,0,0);
    rect(width - 100, 0, 100, 50);
    textSize(35);
    fill(255);
    text("Reset", width - 95, 40);
    
    fill(0,0,255);
    rect(0, height - 50, 50, 50);
    textSize(35);
    fill(255);
    image(instructions, 25, height-25);
    
    if(level == 14 && startWithCompleteClosed == false){
      startWithComplete = true;
      fill(0,0,0,200);
      rect(0,0,width,height);
      textSize(40);
      fill(255,0,0);
      rect(65,240,470,130);
      fill(255);
      textAlign(CENTER);
      text("You Have Already Completed The Game", 20, 250, width - 40, 200);
      textAlign(LEFT);
      textSize(30);
      text("Do You Wish To Reset The Game !?", 50, 420);
      
      fill(0,255,0);
      rect(100,500,100,50);
      fill(255);
      text("YES", 120, 535);
      
      fill(255,0,0);
      rect(400,500,100,50);
      fill(255);
      text("NO", 425, 535);
    }
  }
  
  // if the player clicked on the reset button show the reset confirmation layer
  if(resetConfirmation == true){
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(40);
    fill(255,0,0);
    rect(25,230,550,140);
    fill(255);
    textAlign(CENTER);
    text("YOU ARE ABOUT TO LOSE ALL YOUR PROGRESS", 40, 250, width-80, 200);
    textAlign(LEFT);
    textSize(35);
    text("Are You Sure !?", 170, 420);
    
    fill(255,0,0);
    rect(100,500,100,50);
    fill(255);
    text("YES", 120, 535);
    
    fill(0,255,0);
    rect(400,500,100,50);
    fill(255);
    text("NO", 425, 535);
    
  }
  
  // the player clicked on the instructions button
  if(mainmenu && showInstructions){
    textAlign(LEFT);
    stroke(0);
    strokeWeight(2);
    fill(0,0,0,200);
    rect(0,0,width,height);
    fill(0,200,0);
    rect(90,40,430,80);
    textSize(60);
    fill(255);
    text("HOW TO PLAY", 100, 100);
    textSize(35);
    text("use            to direct the white ball", 20, 180);
    image(arrowKeys, 145, 160);
    
    textSize(40);
    fill(255,0,0);
    textAlign(CENTER);
    textSize(35);
    text("The White Ball Will Keep Moving Until Hitting The Table's Border Or Another Ball ",10 , 210, width -20, 200);
    fill(200,0,0);
    rect(30,375,width - 60,120);
    fill(255);
    text("You Have No Control On The White Ball While Moving", 10, 380, width - 10, 500);
    text("The Goal Is To Figure Out The Right Sequence Of Steps To Put All The Balls (Except The White One) In The Pockets", 0, 500, width, 250);
    fill(255,255,0);
    textSize(35);
    text("GOOD LUCK AND HAVE FUN!!", 0, 720, width, 100);
    textAlign(LEFT);
  }
}
