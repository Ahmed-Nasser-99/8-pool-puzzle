import processing.sound.*;

SoundFile hit;
SoundFile fall;
SoundFile levelCompleted;
SoundFile gameCompleted;

String[] levelStr;
int level;

char process = '0';

int leftBorder = 160;
int rightBorder = 440;
int upperBorder = 155;
int lowerBorder = 645;

Ball[] balls = new Ball[7];

int terminal1[] = new int [2];
int terminal2[] = new int [2];
int terminal3[] = new int [2];
int terminal4[] = new int [2];
int terminal5[] = new int [2];
int terminal6[] = new int [2];
int terminal7[] = new int [2];

int radius = 34;

float speed = 5;

boolean collided = false;
int i = 0;

int remaining;
boolean lostGame = false;

PImage table;
float randomTable;
float lastRandomTable;

PImage background;
float randomBackground;
float lastRandomBackground;

PImage imgBall;
PImage imgBall1;
PImage imgBall2;
PImage imgBall3;
PImage imgBall4;
PImage imgBall5;
PImage imgBall6;

PImage arrowUp;
PImage arrowDown;
PImage arrowLeft;
PImage arrowRight;

PImage pointer;

boolean levelIncreased = false;
boolean gameCompletedSound = false;
boolean gameFinished = false;
boolean startWithComplete = false;
boolean startWithCompleteClosed = false;
PImage gameFinishedPic;
PImage levelFinishedPic;

boolean mainmenu = true;
boolean resetConfirmation = false;
PImage mainmenuPic;


void setup(){
  size(600, 800);
  levelStr = loadStrings("level.txt");
  level = int(levelStr[0]);
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
  
  imageMode(CENTER);
  lastRandomTable = 100;
  lastRandomBackground = 100;
  startLevel(true);
  hit = new SoundFile(this, "hit.wav");
  fall = new SoundFile(this, "fall.wav");
  levelCompleted = new SoundFile(this, "levelCompleted.wav");
  gameCompleted = new SoundFile(this, "gameCompleted.wav");
  
  
}

void draw(){
  noStroke();
  background(background);
  fill(0);
  textSize(18);
  
  if(mainmenu == false){
    
      
    if ((keyPressed && (key == CODED)) && remaining > 0) { 
      if (keyCode == LEFT && process == '0' && balls[0].x != leftBorder && level != 1 && level != 2) {
        if((level == 3 && remaining == 1) || level > 3)
        process = 'l';
      } 
      else if (keyCode == RIGHT && process == '0' && balls[0].x != rightBorder) { 
        if((level == 2 && remaining == 2) || (level == 3 && remaining == 3) || level > 3)
        process = 'r';
      }
      else if (keyCode == UP && process == '0' && balls[0].y != upperBorder) {
        if(level == 1 || (level == 2 && remaining == 1) || (level == 3 && remaining == 2) || level > 3)
          process = 'u';
      }
      else if (keyCode == DOWN && process == '0'  && balls[0].y != lowerBorder && level > 3) {
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
  
  
  
  
  image(table, 300, 400);
  if(randomTable == 0)
    fill(100);
  else if(randomTable == 2)
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
  
  pushMatrix();
    translate(balls[0].x,balls[0].y);
    if(i == 0 && process != '0'){
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
  
  // tutorial stuff
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
  
  if(remaining == 0 && level < 13){
    
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
    if(levelIncreased == false){
      levelCompleted.play();
      level++;
      levelStr[0] = "" + level;
      saveStrings("./data/level.txt",levelStr);
      levelIncreased = true;  
    }
    
  }
  
  if(level == 13 && remaining == 0){
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
    textSize(30);
    text("PLEASE CONSIDER GIVING US A BONUS", 30, 750);
    if(gameCompletedSound == false){
      gameCompleted.play();
      gameCompletedSound = true;
    }
  }

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
  
  if(remaining > 0){
    fill(#b48cf6);
    rect(0, 0, 140,40);
    fill(250);
    textSize(30);
    text("LEVEL " + level, 5, 30);
  }
  
  
  if(remaining != 0 && lostGame == false){
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
  
  if(balls[0].x == leftBorder || balls[0].x == rightBorder || balls[0].y == upperBorder || balls[0].y == lowerBorder ){
      image(pointer,width - 100,70);
  }
  
  if(mainmenu){
    image(mainmenuPic,width/2,height/2);
    fill(255,0,0);
    rect(width - 100, 0, 100, 50);
    textSize(35);
    fill(255);
    text("Reset", width - 95, 40);
    if(level == 13 && startWithCompleteClosed == false){
      startWithComplete = true;
      fill(0,0,0,200);
      rect(0,0,width,height);
      textSize(40);
      fill(255,0,0);
      rect(25,250,550,120);
      fill(255);
      text("You Have Already", 120, 300);
      text("Completed The Game", 100, 350);
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
  
  if(resetConfirmation == true){
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(40);
    fill(255,0,0);
    rect(25,250,550,120);
    fill(255);
    text("YOU ARE ABOUT TO LOSE", 50, 300);
    text("ALL YOUR PROGRESS ", 100, 350);
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
}

void mouseReleased() {
  if(mainmenu == true){
    if (resetConfirmation == false && startWithComplete == false && mainmenu == true && mouseY < height - 50 && mouseX < width - 100) {
        mainmenu = false;
        startLevel(true);
    }
    
    if (mouseY < 50 && mouseX > width - 100 && mainmenu == true) {
        resetConfirmation = true;
    }
    
    if(resetConfirmation == true){
      if ( mouseX > 100 && mouseX < 200 && mouseY > 500 && mouseY < 550 && mainmenu == true) {
        levelStr[0] = "1";
        saveStrings("./data/level.txt",levelStr);
        level = int(levelStr[0]);
        for(int j = 1; j < 7; j++){
          balls[j].x = -100;
          balls[j].y = -100;
        }
        terminal1[0] = -100;
        terminal1[1] = -100;
        terminal2[0] = -100;
        terminal2[1] = -100;
        terminal3[0] = -100;
        terminal3[1] = -100;
        terminal4[0] = -100;
        terminal4[1] = -100;
        terminal5[0] = -100;
        terminal5[1] = -100;
        terminal6[0] = -100;
        terminal6[1] = -100;
        terminal7[0] = -100;
        terminal7[1] = -100;
        resetConfirmation = false;
      }
      if ( mouseX > 400 && mouseX < 500 && mouseY > 500 && mouseY < 550 && mainmenu == true) {
        resetConfirmation = false;
      } 
    }
    
    if(startWithComplete == true){
      if ( mouseX > 100 && mouseX < 200 && mouseY > 500 && mouseY < 550 && mainmenu == true) {
        levelStr[0] = "1";
        saveStrings("./data/level.txt",levelStr);
        level = int(levelStr[0]);
        for(int j = 1; j < 7; j++){
          balls[j].x = -100;
          balls[j].y = -100;
        }
        terminal1[0] = -100;
        terminal1[1] = -100;
        terminal2[0] = -100;
        terminal2[1] = -100;
        terminal3[0] = -100;
        terminal3[1] = -100;
        terminal4[0] = -100;
        terminal4[1] = -100;
        terminal5[0] = -100;
        terminal5[1] = -100;
        terminal6[0] = -100;
        terminal6[1] = -100;
        terminal7[0] = -100;
        terminal7[1] = -100;
        startWithComplete = false;
      }
      if ( mouseX > 400 && mouseX < 500 && mouseY > 500 && mouseY < 550 && mainmenu == true) {
        
        startWithComplete = false;
        startWithCompleteClosed = true;
      } 
    }
  }
  
  else{
    if (mouseY < 50 && mouseX > width - 100 && remaining != 0 && lostGame == false && gameFinished == false) {
      startLevel(false);
    }
    
    if (mouseY > 600 && mouseY < 670 && mouseX > width / 2 - 180 && mouseX < width / 2 - 180 + 360 && remaining == 0 && gameFinished == false) {
      startLevel(true);

    }
    
    if (mouseY > 500 && mouseY < 570 && mouseX > width / 2 - 180 && mouseX < width / 2 - 180 + 360 && lostGame && gameFinished == false) {
      startLevel(false);
    }
    
    if (mouseY > height - 50 && mouseX > width - 100 && gameFinished == false && mainmenu == false) {
      mainmenu = true;
    }
  }
}
