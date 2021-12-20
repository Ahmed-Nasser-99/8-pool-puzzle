int ballX = 500;
int ballY = 500;

char process = '0';

int ball1[] = new int[2];
int ball2[] = new int[2];
int ball3[] = new int[2];
int ball4[] = new int[2];

int trminal1[] = new int [2];
int trminal2[] = new int [2];
int trminal3[] = new int [2];
int trminal4[] = new int [2];

int radius = 50;

int positions[] = new int[8];
float speed = 10;

boolean collided = false;
boolean ball1collided = false;
boolean ball2collided = false;
boolean ball3collided = false;
boolean ball4collided = false;




void setup(){
  size(1200, 800);
  
  ball1[0] = 400;
  ball1[1] = 500;
  
  ball2[0] = 600;
  ball2[1] = 500;
  
  trminal1[0] = 100;
  trminal1[1] = 500;
}

void draw(){
  noStroke();
  background(200);
  
  positions[0] = ball1[0];
  positions[1] = ball1[1];
  positions[2] = ball2[0];
  positions[3] = ball2[1];
  positions[4] = ball3[0];
  positions[5] = ball3[1];
  
  if ((keyPressed && (key == CODED))) { // If it’s a coded key
    if (keyCode == LEFT && process == '0') { // If it’s the left arrow
      process = 'l';
    } 
    else if (keyCode == RIGHT && process == '0') { // If it’s the right arrow
      process = 'r';
    }
  }
  
  if(process == 'l'){
    moveLeft();
  }
  else if(process == 'r'){
    moveRight();
  }
  
  
  fill(0);
  circle(trminal1[0],trminal1[1],radius);
  
  fill(255, 0,0);
  circle(ballX,ballY,radius);
  fill(255);
  circle(ball1[0],ball1[1],radius);
  circle(ball2[0],ball2[1],radius);
  
  
  
  collided = false;
  keyPressed = false;
  
}

void moveLeft(){
  if(process == 'l' && ball1collided == false){
       ballX -= speed;
       if(ballX == ball1[0] + radius){
         ball1collided = true;
       };
     }
  if (ball1collided == true ){
       ball1[0] -= speed;
       if(ball1[0] == 100){
         ball1collided = false;
         process = '0';
       }
  }
     keyCode = 0;
     return;
}

void moveRight(){
  if(process == 'r' && ball2collided == false){
       ballX += speed;
       if(ballX == ball2[0] - radius){
         ball2collided = true;
       };
     }
  if (ball2collided == true ){
       ball2[0] += speed;
       if(ball2[0] == 1100){
         ball2collided = false;
         process = '0';
       }
  }
   keyCode = 0;
   return;
}
