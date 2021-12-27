/*
  A "To Do List" In The Final Project:
  1) Levels (about 10 levels)
  2) Good Tutorials In The First 3 levels
  3) Sound Effects
  4) Improve Visualizations
  5) Refractor The Code
  6) try making a saving system
  7) implement the transformations
*/

int ballX = 335;
int ballY = 505;

char process = '0';

int leftBorder = 160;
int rightBorder = 440;
int upperBorder = 155;
int lowerBorder = 645;

int ball1[] = new int[2];
int ball2[] = new int[2];
int ball3[] = new int[2];
int ball4[] = new int[2];
int ball5[] = new int[2];
int ball6[] = new int[2];

int terminal1[] = new int [2];
int terminal2[] = new int [2];
int terminal3[] = new int [2];
int terminal4[] = new int [2];
int terminal5[] = new int [2];
int terminal6[] = new int [2];

int radius = 35;
int radius1 = 35;
int radius2 = 35;
int radius3 = 35;
int radius4 = 35;
int radius5 = 35;
int radius6 = 35;

int positions[] = new int[8];
float speed = 5;

boolean collided = false;
boolean ball1collided = false;
boolean ball2collided = false;
boolean ball3collided = false;
boolean ball4collided = false;
boolean ball5collided = false;
boolean ball6collided = false;

int remaining = 4;
boolean lostGame = false;


PImage table;
float randomTable;

void setup(){
  size(600, 800);
  randomTable = int(random(4));
  startLevel();
}

void startLevel(){
  lostGame = false;
  collided = false;
  process = '0';
  remaining = 4;
  ballX = 335;
  ballY = 505;
  
  ball1[0] = 195;
  ball1[1] = 505;
  
  ball2[0] = 405;
  ball2[1] = 505;
  
  ball3[0] = 230;
  ball3[1] = 225;
  
  ball4[0] = 370;
  ball4[1] = 190;
  
  radius = 35;
  radius1 = 35;
  radius2 = 35;
  radius3 = 35;
  radius4 = 35;
  radius5 = 35;
  radius6 = 35;
  
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

  
  
  if(randomTable == 0)
    table = loadImage("red-table.png");
  else if(randomTable == 1)
    table = loadImage("green-table.png");
  else if(randomTable == 2)
    table = loadImage("blue-table.png");
  else
    table = loadImage("cyan-table.png");
}

void draw(){
  noStroke();
  background(200);
  fill(0);
  textSize(18);
  text("Use The Arrwo Keys To Move The White Ball In Straight Lines (the ball will move until hitting another ball or reach the wall)",50, 10, 450, 100);
  text("The Goal Is To Put All The Red Balls In The Pockets", 50, 720, 500, 100);
  
  if (mousePressed && mouseButton == LEFT && mouseY < 50 && mouseX > width - 100) {
    startLevel();
  }
  
  if ((keyPressed && (key == CODED)) && remaining > 0) { 
    if (keyCode == LEFT && process == '0' && ballX != leftBorder) {
      process = 'l';
    } 
    else if (keyCode == RIGHT && process == '0' && ballX != rightBorder) { 
      process = 'r';
    }
    else if (keyCode == UP && process == '0'  && ballY != upperBorder) {
      process = 'u';
    }
    else if (keyCode == DOWN && process == '0'  && ballY != lowerBorder) {
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
  
  
  
  image(table, 100, 100);
  if(randomTable == 0)
    fill(100);
  else if(randomTable == 2)
    fill(150);
  else 
    fill(0);
  circle(terminal1[0],terminal1[1],radius);
  circle(terminal2[0],terminal2[1],radius);
  circle(terminal3[0],terminal3[1],radius);
  circle(terminal4[0],terminal4[1],radius);
  circle(terminal5[0],terminal5[1],radius);
  
  fill(255);
  circle(ballX,ballY,radius);
  fill(255, 0, 0);
  circle(ball1[0],ball1[1],radius1);
  circle(ball2[0],ball2[1],radius2);
  circle(ball3[0],ball3[1],radius3);
  circle(ball4[0],ball4[1],radius4);
  
  if(remaining == 0){
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(80);
    fill(255);
    text("YOU WIN", 130, 300);
  }

  if(lostGame){
    fill(0,0,0,200);
    rect(0,0,width,height);
    textSize(80);
    fill(255);
    text("YOU LOST ", 100, 300);
    textSize(30);
    text("The White Ball Fell Into A pocket", 60, 350);
  }
  
  fill(0,255,0);
  rect(width - 100, 0, 100, 50);
  textSize(35);
  fill(255);
  text("Retry", width - 90, 40);
  
  keyPressed = false;  
}

void moveLeft(){
  
  boolean noLeftPockets = true;
  if(terminal1[1] == ballY && terminal1[0] < ballX)
    noLeftPockets = false;
  if(terminal2[1] == ballY && terminal2[0] < ballX)
    noLeftPockets = false;
  if(terminal3[1] == ballY && terminal3[0] < ballX)
    noLeftPockets = false;
  if(terminal4[1] == ballY && terminal4[0] < ballX)
    noLeftPockets = false;
  if(terminal5[1] == ballY && terminal5[0] < ballX)
    noLeftPockets = false;
  if(terminal6[1] == ballY && terminal6[0] < ballX)
    noLeftPockets = false;
    
  if(process == 'l' && collided == false){
       ballX -= speed;
       if(ballX == ball1[0] + radius && ballY == ball1[1]){
         ball1collided = true;
         collided = true;
       }
       else if(ballX == ball2[0] + radius && ballY == ball2[1]){
         ball2collided = true;
         collided = true;
       }
       else if(ballX == ball3[0] + radius && ballY == ball3[1]){
         ball3collided = true;
         collided = true;
       }
       else if(ballX == ball4[0] + radius && ballY == ball4[1]){
         ball4collided = true;
         collided = true;
       }
       else if(ballX == ball5[0] + radius && ballY == ball5[1]){
         ball5collided = true;
         collided = true;
       }
       else if(ballX == ball6[0] + radius && ballY == ball6[1]){
         ball6collided = true;
         collided = true;
       }
       else if((ballX == terminal1[0] && ballY == terminal1[1])
       || (ballX == terminal2[0]  && ballY == terminal2[1])
       || (ballX == terminal3[0]  && ballY == terminal3[1])
       || (ballX == terminal4[0]  && ballY == terminal4[1])
       || (ballX == terminal5[0]  && ballY == terminal5[1])
       || (ballX == terminal6[0]  && ballY == terminal6[1])){
         collided = true;
         lostGame = true;
       }
       else if(ballX == leftBorder && noLeftPockets){
         collided = true;
         process = '0';
         collided = false;
       }
     }
     
     
     
  if (ball1collided == true ){
     ball1[0] -= speed;
     if((ball1[0] == terminal1[0] - 10 && ball1[1] == terminal1[1])
     || (ball1[0] == terminal2[0] - 10 && ball1[1] == terminal2[1])
     || (ball1[0] == terminal3[0] - 10 && ball1[1] == terminal3[1])
     || (ball1[0] == terminal4[0] - 10 && ball1[1] == terminal4[1])
     || (ball1[0] == terminal5[0] - 10 && ball1[1] == terminal5[1])
     || (ball1[0] == terminal6[0] - 10 && ball1[1] == terminal6[1])){
       ball1collided = false;
       radius1 = 0;
       ball1[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball1[0] == leftBorder && noLeftPockets){
       ball1collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball2collided == true ){
     ball2[0] -= speed;
     if((ball2[0] == terminal1[0] - 10 && ball2[1] == terminal1[1])
     || (ball2[0] == terminal2[0] - 10 && ball2[1] == terminal2[1])
     || (ball2[0] == terminal3[0] - 10 && ball2[1] == terminal3[1])
     || (ball2[0] == terminal4[0] - 10 && ball2[1] == terminal4[1])
     || (ball2[0] == terminal5[0] - 10 && ball2[1] == terminal5[1])
     || (ball2[0] == terminal6[0] - 10 && ball2[1] == terminal6[1])){
       ball2collided = false;
       radius2 = 0;
       ball2[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball2[0] == leftBorder && noLeftPockets){
       ball2collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball3collided == true ){
     ball3[0] -= speed;
     if((ball3[0] == terminal1[0] - 10 && ball3[1] == terminal1[1])
     || (ball3[0] == terminal2[0] - 10 && ball3[1] == terminal2[1])
     || (ball3[0] == terminal3[0] - 10 && ball3[1] == terminal3[1])
     || (ball3[0] == terminal4[0] - 10 && ball3[1] == terminal4[1])
     || (ball3[0] == terminal5[0] - 10 && ball3[1] == terminal5[1])
     || (ball3[0] == terminal6[0] - 10 && ball3[1] == terminal6[1])){
       ball3collided = false;
       radius3 = 0;
       ball3[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball3[0] == leftBorder && noLeftPockets){
       ball3collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball4collided == true ){
     ball4[0] -= speed;
     if((ball4[0] == terminal1[0] - 10 && ball4[1] == terminal1[1])
     || (ball4[0] == terminal2[0] - 10 && ball4[1] == terminal2[1])
     || (ball4[0] == terminal3[0] - 10 && ball4[1] == terminal3[1])
     || (ball4[0] == terminal4[0] - 10 && ball4[1] == terminal4[1])
     || (ball4[0] == terminal5[0] - 10 && ball4[1] == terminal5[1])
     || (ball4[0] == terminal6[0] - 10 && ball4[1] == terminal6[1])){
       ball4collided = false;
       radius4 = 0;
       ball4[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball4[0] == leftBorder && noLeftPockets){
       ball4collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball5collided == true ){
     ball5[0] -= speed;
     if((ball5[0] == terminal1[0] - 10 && ball5[1] == terminal1[1])
     || (ball5[0] == terminal2[0] - 10 && ball5[1] == terminal2[1])
     || (ball5[0] == terminal3[0] - 10 && ball5[1] == terminal3[1])
     || (ball5[0] == terminal4[0] - 10 && ball5[1] == terminal4[1])
     || (ball5[0] == terminal5[0] - 10 && ball5[1] == terminal5[1])
     || (ball5[0] == terminal6[0] - 10 && ball5[1] == terminal6[1])){
       ball5collided = false;
       radius5 = 0;
       ball5[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball5[0] == leftBorder && noLeftPockets){
       ball5collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball6collided == true ){
     ball6[0] -= speed;
     if((ball6[0] == terminal1[0] - 10 && ball6[1] == terminal1[1])
     || (ball6[0] == terminal2[0] - 10 && ball6[1] == terminal2[1])
     || (ball6[0] == terminal3[0] - 10 && ball6[1] == terminal3[1])
     || (ball6[0] == terminal4[0] - 10 && ball6[1] == terminal4[1])
     || (ball6[0] == terminal5[0] - 10 && ball6[1] == terminal5[1])
     || (ball6[0] == terminal6[0] - 10 && ball6[1] == terminal6[1])){
       ball6collided = false;
       radius6 = 0;
       ball6[0] =-100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball6[0] == leftBorder && noLeftPockets){
       ball6collided = false;
       process = '0';
       collided = false;
     }
  }
  
     keyCode = 0;
     return;
}

void moveRight(){
  boolean noRightPockets = true;
  if(terminal1[1] == ballY && terminal1[0] > ballX)
    noRightPockets = false;
  if(terminal2[1] == ballY && terminal2[0] > ballX)
    noRightPockets = false;
  if(terminal3[1] == ballY && terminal3[0] > ballX)
    noRightPockets = false;
  if(terminal4[1] == ballY && terminal4[0] > ballX)
    noRightPockets = false;
  if(terminal5[1] == ballY && terminal5[0] > ballX)
    noRightPockets = false;
  if(terminal6[1] == ballY && terminal6[0] > ballX)
    noRightPockets = false;
  
  
  if(process == 'r' && collided == false){
       ballX += speed;
       if(ballX == ball1[0] - radius &&  ballY == ball1[1]){
         ball1collided = true;
         collided = true;
       }
       else if(ballX == ball2[0] - radius &&  ballY == ball2[1]){
         ball2collided = true;
         collided = true;
       }
       else if(ballX == ball3[0] - radius &&  ballY == ball3[1]){
         ball3collided = true;
         collided = true;
       }
       else if(ballX == ball4[0] - radius &&  ballY == ball4[1]){
         ball4collided = true;
         collided = true;
       }
       else if(ballX == ball5[0] - radius &&  ballY == ball5[1]){
         ball5collided = true;
         collided = true;
       }
       else if(ballX == ball6[0] - radius &&  ballY == ball6[1]){
         ball6collided = true;
         collided = true;
       }
       else if((ballX == terminal1[0] && ballY == terminal1[1])
       || (ballX == terminal2[0]  && ballY == terminal2[1])
       || (ballX == terminal3[0]  && ballY == terminal3[1])
       || (ballX == terminal4[0]  && ballY == terminal4[1])
       || (ballX == terminal5[0]  && ballY == terminal5[1])
       || (ballX == terminal6[0]  && ballY == terminal6[1])){
         collided = true;
         lostGame = true;
       }
       else if(ballX == rightBorder && noRightPockets){
         collided = true;
         process = '0';
         collided = false;
       }
     }
     
     
     
  if (ball1collided == true ){
     ball1[0] += speed;
     if((ball1[0] == terminal1[0] + 10 && ball1[1] == terminal1[1])
     || (ball1[0] == terminal2[0] + 10 && ball1[1] == terminal2[1])
     || (ball1[0] == terminal3[0] + 10 && ball1[1] == terminal3[1])
     || (ball1[0] == terminal4[0] + 10 && ball1[1] == terminal4[1])
     || (ball1[0] == terminal5[0] + 10 && ball1[1] == terminal5[1])
     || (ball1[0] == terminal6[0] + 10 && ball1[1] == terminal6[1])){
       ball1collided = false;
       radius1 = 0;
       ball1[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball1[0] == rightBorder && noRightPockets){
       ball1collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball2collided == true ){
     ball2[0] += speed;
     if((ball2[0] == terminal1[0] + 10 && ball2[1] == terminal1[1])
     || (ball2[0] == terminal2[0] + 10 && ball2[1] == terminal2[1])
     || (ball2[0] == terminal3[0] + 10 && ball2[1] == terminal3[1])
     || (ball2[0] == terminal4[0] + 10 && ball2[1] == terminal4[1])
     || (ball2[0] == terminal5[0] + 10 && ball2[1] == terminal5[1])
     || (ball2[0] == terminal6[0] + 10 && ball2[1] == terminal6[1])){
       ball2collided = false;
       radius2 = 0;
       ball2[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball2[0] == rightBorder && noRightPockets){
       ball2collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball3collided == true ){
     ball3[0] += speed;
     if((ball3[0] == terminal1[0] + 10 && ball3[1] == terminal1[1])
     || (ball3[0] == terminal2[0] + 10 && ball3[1] == terminal2[1])
     || (ball3[0] == terminal3[0] + 10 && ball3[1] == terminal3[1])
     || (ball3[0] == terminal4[0] + 10 && ball3[1] == terminal4[1])
     || (ball3[0] == terminal5[0] + 10 && ball3[1] == terminal5[1])
     || (ball3[0] == terminal6[0] + 10 && ball3[1] == terminal6[1])){
       ball3collided = false;
       radius3 = 0;
       ball3[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball3[0] == rightBorder && noRightPockets){
       ball3collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball4collided == true ){
     ball4[0] += speed;
     if((ball4[0] == terminal1[0] + 10 && ball4[1] == terminal1[1])
     || (ball4[0] == terminal2[0] + 10 && ball4[1] == terminal2[1])
     || (ball4[0] == terminal3[0] + 10 && ball4[1] == terminal3[1])
     || (ball4[0] == terminal4[0] + 10 && ball4[1] == terminal4[1])
     || (ball4[0] == terminal5[0] + 10 && ball4[1] == terminal5[1])
     || (ball4[0] == terminal6[0] + 10 && ball4[1] == terminal6[1])){
       ball4collided = false;
       radius4 = 0;
       ball4[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball4[0] == rightBorder && noRightPockets){
       ball4collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball5collided == true ){
     ball5[0] += speed;
     if((ball5[0] == terminal1[0] + 10 && ball5[1] == terminal1[1])
     || (ball5[0] == terminal2[0] + 10 && ball5[1] == terminal2[1])
     || (ball5[0] == terminal3[0] + 10 && ball5[1] == terminal3[1])
     || (ball5[0] == terminal4[0] + 10 && ball5[1] == terminal4[1])
     || (ball5[0] == terminal5[0] + 10 && ball5[1] == terminal5[1])
     || (ball5[0] == terminal6[0] + 10 && ball5[1] == terminal6[1])){
       ball5collided = false;
       radius5 = 0;
       ball5[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball5[0] == rightBorder && noRightPockets){
       ball5collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball6collided == true ){
     ball6[0] += speed;
     if((ball6[0] == terminal1[0] + 10 && ball6[1] == terminal1[1])
     || (ball6[0] == terminal2[0] + 10 && ball6[1] == terminal2[1])
     || (ball6[0] == terminal3[0] + 10 && ball6[1] == terminal3[1])
     || (ball6[0] == terminal4[0] + 10 && ball6[1] == terminal4[1])
     || (ball6[0] == terminal5[0] + 10 && ball6[1] == terminal5[1])
     || (ball6[0] == terminal6[0] + 10 && ball6[1] == terminal6[1])){
       ball6collided = false;
       radius6 = 0;
       ball6[0] =-100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball6[0] == rightBorder && noRightPockets){
       ball6collided = false;
       process = '0';
       collided = false;
     }
  }
     keyCode = 0;
     return;
}

void moveUp(){
  boolean noUpperPockets = true;
  if(terminal1[0] == ballX && terminal1[1] < ballY)
    noUpperPockets = false;
  if(terminal2[0] == ballX && terminal2[1] < ballY)
    noUpperPockets = false;
  if(terminal3[0] == ballX && terminal3[1] < ballY)
    noUpperPockets = false;
  if(terminal4[0] == ballX && terminal4[1] < ballY)
    noUpperPockets = false;
  if(terminal5[0] == ballX && terminal5[1] < ballY)
    noUpperPockets = false;
  if(terminal6[0] == ballX && terminal6[1] < ballY)
    noUpperPockets = false;
  
  if(process == 'u' && collided == false){
       ballY -= speed;
       if(ballY == ball1[1] + radius &&  ballX == ball1[0]){
         ball1collided = true;
         collided = true;
       }
       else if(ballY == ball2[1] + radius &&  ballX == ball2[0]){
         ball2collided = true;
         collided = true;
       }
       else if(ballY == ball3[1] + radius &&  ballX == ball3[0]){
         ball3collided = true;
         collided = true;
       }
       else if(ballY == ball4[1] + radius &&  ballX == ball4[0]){
         ball4collided = true;
         collided = true;
       }
       else if(ballY == ball5[1] + radius &&  ballX == ball5[0]){
         ball5collided = true;
         collided = true;
       }
       else if(ballY == ball6[1] + radius &&  ballX == ball6[0]){
         ball6collided = true;
         collided = true;
       }
       else if((ballX == terminal1[0] && ballY == terminal1[1])
       || (ballX == terminal2[0]  && ballY == terminal2[1])
       || (ballX == terminal3[0]  && ballY == terminal3[1])
       || (ballX == terminal4[0]  && ballY == terminal4[1])
       || (ballX == terminal5[0]  && ballY == terminal5[1])
       || (ballX == terminal6[0]  && ballY == terminal6[1])){
         collided = true;
         lostGame = true;
       }
       else if(ballY == upperBorder && noUpperPockets){
         collided = true;
         process = '0';
         collided = false;
       }
     }
     
     
     
  if (ball1collided == true){
     ball1[1] -= speed;
     if((ball1[1] == terminal1[1] - 10 && ball1[0] == terminal1[0])
     || (ball1[1] == terminal2[1] - 10 && ball1[0] == terminal2[0])
     || (ball1[1] == terminal3[1] - 10 && ball1[0] == terminal3[0])
     || (ball1[1] == terminal4[1] - 10 && ball1[0] == terminal4[0])
     || (ball1[1] == terminal5[1] - 10 && ball1[0] == terminal5[0])
     || (ball1[1] == terminal6[1] - 10 && ball1[0] == terminal6[0])){
       ball1collided = false;
       radius1 = 0;
       ball1[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball1[0] == upperBorder && noUpperPockets){
       ball1collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball2collided == true ){
     ball2[1] -= speed;
     if((ball2[1] == terminal1[1] - 10 && ball2[0] == terminal1[0])
     || (ball2[1] == terminal2[1] - 10 && ball2[0] == terminal2[0])
     || (ball2[1] == terminal3[1] - 10 && ball2[0] == terminal3[0])
     || (ball2[1] == terminal4[1] - 10 && ball2[0] == terminal4[0])
     || (ball2[1] == terminal5[1] - 10 && ball2[0] == terminal5[0])
     || (ball2[1] == terminal6[1] - 10 && ball2[0] == terminal6[0])){
       ball2collided = false;
       radius2 = 0;
       ball2[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball2[0] == upperBorder && noUpperPockets){
       ball2collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball3collided == true){
     ball3[1] -= speed;
     if((ball3[1] == terminal1[1] - 10 && ball3[0] == terminal1[0])
     || (ball3[1] == terminal2[1] - 10 && ball3[0] == terminal2[0])
     || (ball3[1] == terminal3[1] - 10 && ball3[0] == terminal3[0])
     || (ball3[1] == terminal4[1] - 10 && ball3[0] == terminal4[0])
     || (ball3[1] == terminal5[1] - 10 && ball3[0] == terminal5[0])
     || (ball3[1] == terminal6[1] - 10 && ball3[0] == terminal6[0])){
       ball3collided = false;
       radius3 = 0;
       ball3[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball3[1] == upperBorder && noUpperPockets){
       ball3collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball4collided == true ){
     ball4[1] -= speed;
     if((ball4[1] == terminal1[1] - 10 && ball4[0] == terminal1[0])
     || (ball4[1] == terminal2[1] - 10 && ball4[0] == terminal2[0])
     || (ball4[1] == terminal3[1] - 10 && ball4[0] == terminal3[0])
     || (ball4[1] == terminal4[1] - 10 && ball4[0] == terminal4[0])
     || (ball4[1] == terminal5[1] - 10 && ball4[0] == terminal5[0])
     || (ball4[1] == terminal6[1] - 10 && ball4[0] == terminal6[0])){
       ball4collided = false;
       radius4 = 0;
       ball4[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball4[0] == upperBorder && noUpperPockets){
       ball4collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball5collided == true ){
     ball5[1] -= speed;
     if((ball5[1] == terminal1[1] - 10 && ball5[0] == terminal1[0])
     || (ball5[1] == terminal2[1] - 10 && ball5[0] == terminal2[0])
     || (ball5[1] == terminal3[1] - 10 && ball5[0] == terminal3[0])
     || (ball5[1] == terminal4[1] - 10 && ball5[0] == terminal4[0])
     || (ball5[1] == terminal5[1] - 10 && ball5[0] == terminal5[0])
     || (ball5[1] == terminal6[1] - 10 && ball5[0] == terminal6[0])){
       ball5collided = false;
       radius5 = 0;
       ball5[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball5[0] == upperBorder && noUpperPockets){
       ball5collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball6collided == true ){
     ball6[1] -= speed;
     if((ball6[1] == terminal1[1] - 10 && ball6[0] == terminal1[0])
     || (ball6[1] == terminal2[1] - 10 && ball6[0] == terminal2[0])
     || (ball6[1] == terminal3[1] - 10 && ball6[0] == terminal3[0])
     || (ball6[1] == terminal4[1] - 10 && ball6[0] == terminal4[0])
     || (ball6[1] == terminal5[1] - 10 && ball6[0] == terminal5[0])
     || (ball6[1] == terminal6[1] - 10 && ball6[0] == terminal6[0])){
       ball6collided = false;
       radius6 = 0;
       ball6[0] =-100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball6[0] == upperBorder && noUpperPockets){
       ball6collided = false;
       process = '0';
       collided = false;
     }
  }
     keyCode = 0;
     return;
}

void moveDown(){
boolean noLowerPockets = true;
  if(terminal1[0] == ballX && terminal1[1] > ballY)
    noLowerPockets = false;
  if(terminal2[0] == ballX && terminal2[1] > ballY)
    noLowerPockets = false;
  if(terminal3[0] == ballX && terminal3[1] > ballY)
    noLowerPockets = false;
  if(terminal4[0] == ballX && terminal4[1] > ballY)
    noLowerPockets = false;
  if(terminal5[0] == ballX && terminal5[1] > ballY)
    noLowerPockets = false;
  if(terminal6[0] == ballX && terminal6[1] > ballY)
    noLowerPockets = false;
  
  
  if(process == 'd' && collided == false){
       ballY += speed;
       if(ballY == ball1[1] - radius &&  ballX == ball1[0]){
         ball1collided = true;
         collided = true;
       }
       else if(ballY == ball2[1] - radius &&  ballX == ball2[0]){
         ball2collided = true;
         collided = true;
       }
       else if(ballY == ball3[1] - radius &&  ballX == ball3[0]){
         ball3collided = true;
         collided = true;
       }
       else if(ballY == ball4[1] - radius &&  ballX == ball4[0]){
         ball4collided = true;
         collided = true;
       }
       else if(ballY == ball5[1] - radius &&  ballX == ball5[0]){
         ball5collided = true;
         collided = true;
       }
       else if(ballY == ball6[1] - radius &&  ballX == ball6[0]){
         ball6collided = true;
         collided = true;
       }
       else if((ballX == terminal1[0] && ballY == terminal1[1])
       || (ballX == terminal2[0]  && ballY == terminal2[1])
       || (ballX == terminal3[0]  && ballY == terminal3[1])
       || (ballX == terminal4[0]  && ballY == terminal4[1])
       || (ballX == terminal5[0]  && ballY == terminal5[1])
       || (ballX == terminal6[0]  && ballY == terminal6[1])){
         collided = true;
         lostGame = true;
       }
       else if(ballY == lowerBorder && noLowerPockets){
         collided = true;
         process = '0';
         collided = false;
       }
     }
     
     
     
  if (ball1collided == true){
     ball1[1] += speed;
     if((ball1[1] == terminal1[1] + 10 && ball1[0] == terminal1[0])
     || (ball1[1] == terminal2[1] + 10 && ball1[0] == terminal2[0])
     || (ball1[1] == terminal3[1] + 10 && ball1[0] == terminal3[0])
     || (ball1[1] == terminal4[1] + 10 && ball1[0] == terminal4[0])
     || (ball1[1] == terminal5[1] + 10 && ball1[0] == terminal5[0])
     || (ball1[1] == terminal6[1] + 10 && ball1[0] == terminal6[0])){
       ball1collided = false;
       radius1 = 0;
       ball1[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball1[0] == lowerBorder && noLowerPockets){
       ball1collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball2collided == true ){
     ball2[1] += speed;
     if((ball2[1] == terminal1[1] + 10 && ball2[0] == terminal1[0])
     || (ball2[1] == terminal2[1] + 10 && ball2[0] == terminal2[0])
     || (ball2[1] == terminal3[1] + 10 && ball2[0] == terminal3[0])
     || (ball2[1] == terminal4[1] + 10 && ball2[0] == terminal4[0])
     || (ball2[1] == terminal5[1] + 10 && ball2[0] == terminal5[0])
     || (ball2[1] == terminal6[1] + 10 && ball2[0] == terminal6[0])){
       ball2collided = false;
       radius2 = 0;
       ball2[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball2[0] == lowerBorder && noLowerPockets){
       ball2collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball3collided == true){
     ball3[1] += speed;
     if((ball3[1] == terminal1[1] + 10 && ball3[0] == terminal1[0])
     || (ball3[1] == terminal2[1] + 10 && ball3[0] == terminal2[0])
     || (ball3[1] == terminal3[1] + 10 && ball3[0] == terminal3[0])
     || (ball3[1] == terminal4[1] + 10 && ball3[0] == terminal4[0])
     || (ball3[1] == terminal5[1] + 10 && ball3[0] == terminal5[0])
     || (ball3[1] == terminal6[1] + 10 && ball3[0] == terminal6[0])){
       ball3collided = false;
       radius3 = 0;
       ball3[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball3[0] == lowerBorder && noLowerPockets){
       ball3collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball4collided == true ){
     ball4[1] += speed;
     if((ball4[1] == terminal1[1] + 10 && ball4[0] == terminal1[0])
     || (ball4[1] == terminal2[1] + 10 && ball4[0] == terminal2[0])
     || (ball4[1] == terminal3[1] + 10 && ball4[0] == terminal3[0])
     || (ball4[1] == terminal4[1] + 10 && ball4[0] == terminal4[0])
     || (ball4[1] == terminal5[1] + 10 && ball4[0] == terminal5[0])
     || (ball4[1] == terminal6[1] + 10 && ball4[0] == terminal6[0])){
       ball4collided = false;
       radius4 = 0;
       ball4[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball4[0] == lowerBorder && noLowerPockets){
       ball4collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball5collided == true ){
     ball5[1] += speed;
     if((ball5[1] == terminal1[1] + 10 && ball5[0] == terminal1[0])
     || (ball5[1] == terminal2[1] + 10 && ball5[0] == terminal2[0])
     || (ball5[1] == terminal3[1] + 10 && ball5[0] == terminal3[0])
     || (ball5[1] == terminal4[1] + 10 && ball5[0] == terminal4[0])
     || (ball5[1] == terminal5[1] + 10 && ball5[0] == terminal5[0])
     || (ball5[1] == terminal6[1] + 10 && ball5[0] == terminal6[0])){
       ball5collided = false;
       radius5 = 0;
       ball5[0] = -100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball5[0] == lowerBorder && noLowerPockets){
       ball5collided = false;
       process = '0';
       collided = false;
     }
  }
  
  if (ball6collided == true ){
     ball6[1] += speed;
     if((ball6[1] == terminal1[1] + 10 && ball6[0] == terminal1[0])
     || (ball6[1] == terminal2[1] + 10 && ball6[0] == terminal2[0])
     || (ball6[1] == terminal3[1] + 10 && ball6[0] == terminal3[0])
     || (ball6[1] == terminal4[1] + 10 && ball6[0] == terminal4[0])
     || (ball6[1] == terminal5[1] + 10 && ball6[0] == terminal5[0])
     || (ball6[1] == terminal6[1] + 10 && ball6[0] == terminal6[0])){
       ball6collided = false;
       radius6 = 0;
       ball6[0] =-100;
       process = '0';
       collided = false;
       remaining--;
     }
     else if(ball6[0] == lowerBorder && noLowerPockets){
       ball6collided = false;
       process = '0';
       collided = false;
     }
  }
     keyCode = 0;
     return;
}
