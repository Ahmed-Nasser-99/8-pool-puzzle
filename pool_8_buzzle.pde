/*
  A "To Do List" In The Final Project:
  1) Levels (about 10 levels)
  2) Good Tutorials In The First 3 levels
  3) Retry Button
  4) Sound Effects
  5) MEMES <3
  6) Improve Visualizations
  7) Spliting The Code
*/

int ballX = 350;
int ballY = 500;

char process = '0';

int leftBorder = 150;
int rightBorder = 450;
int upperBorder = 150;
int lowerBorder = 650;

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

int radius = 25;
int radius1 = 25;
int radius2 = 25;
int radius3 = 25;
int radius4 = 25;
int radius5 = 25;
int radius6 = 25;

int positions[] = new int[8];
float speed = 5;

boolean collided = false;
boolean ball1collided = false;
boolean ball2collided = false;
boolean ball3collided = false;
boolean ball4collided = false;
boolean ball5collided = false;
boolean ball6collided = false;

PImage table;
float randomTable;

void setup(){
  size(600, 800);
  
  ball1[0] = 200;
  ball1[1] = 500;
  
  ball2[0] = 400;
  ball2[1] = 500;
  
  ball3[0] = 225;
  ball3[1] = 225;
  
  ball4[0] = 375;
  ball4[1] = 200;
  
  terminal1[0] = 130;
  terminal1[1] = 500;
  
  terminal2[0] = 470;
  terminal2[1] = 500;
  
  terminal3[0] = 130;
  terminal3[1] = 225;
  
  terminal4[0] = 375;
  terminal4[1] = 120;
  
  terminal5[0] = 225;
  terminal5[1] = 120;

  
  randomTable = int(random(4));
  if(randomTable == 0)
    table = loadImage("red-table.png");
  if(randomTable == 1)
    table = loadImage("green-table.png");
  if(randomTable == 2)
    table = loadImage("blue-table.png");
  if(randomTable == 3)
    table = loadImage("cyan-table.png");
  
  
}

void draw(){  
  noStroke();
  background(200);
  fill(0);
  textSize(18);
  text("Use The Arrwo Keys To Move The White Ball In Straight Lines",50, 10, 500, 100);
  text("The Goal Is To Put All The Red Balls In The Pockets",50, 70, 500, 100);
  text("PSSST: If You Get Stuck Please Rerun The Game (We Will Make A Retry Button In The Final Project)", 50, 720, 500, 100);
  
  if ((keyPressed && (key == CODED))) { // If it’s a coded key
    if (keyCode == LEFT && process == '0' && ballX != leftBorder) { // If it’s the left arrow
      process = 'l';
    } 
    else if (keyCode == RIGHT && process == '0' && ballX != rightBorder) { // If it’s the right arrow
      process = 'r';
    }
    else if (keyCode == UP && process == '0'  && ballY != upperBorder) { // If it’s the right arrow
      process = 'u';
    }
    else if (keyCode == DOWN && process == '0'  && ballY != lowerBorder) { // If it’s the right arrow
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
       || (ballX == terminal2[0]  && ballY == terminal1[1])
       || (ballX == terminal3[0]  && ballY == terminal1[1])
       || (ballX == terminal4[0]  && ballY == terminal1[1])
       || (ballX == terminal5[0]  && ballY == terminal1[1])
       || (ballX == terminal6[0]  && ballY == terminal1[1])){
         exit();
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
       println("AH");
       ball2collided = false;
       radius2 = 0;
       ball2[0] = -100;
       process = '0';
       collided = false;
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
       || (ballX == terminal2[0]  && ballY == terminal1[1])
       || (ballX == terminal3[0]  && ballY == terminal1[1])
       || (ballX == terminal4[0]  && ballY == terminal1[1])
       || (ballX == terminal5[0]  && ballY == terminal1[1])
       || (ballX == terminal6[0]  && ballY == terminal1[1])){
         exit();
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
       || (ballX == terminal2[0]  && ballY == terminal1[1])
       || (ballX == terminal3[0]  && ballY == terminal1[1])
       || (ballX == terminal4[0]  && ballY == terminal1[1])
       || (ballX == terminal5[0]  && ballY == terminal1[1])
       || (ballX == terminal6[0]  && ballY == terminal1[1])){
         exit();
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
       || (ballX == terminal2[0]  && ballY == terminal1[1])
       || (ballX == terminal3[0]  && ballY == terminal1[1])
       || (ballX == terminal4[0]  && ballY == terminal1[1])
       || (ballX == terminal5[0]  && ballY == terminal1[1])
       || (ballX == terminal6[0]  && ballY == terminal1[1])){
         exit();
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
