// sound files
SoundFile hit;
SoundFile fall;
SoundFile levelCompleted;
SoundFile gameCompleted;

// array of strings for reading the text file which contains the level value
String[] levelStr;
int level;

// character describes the current process of the entire game
// 0 = no current process and the player can move the white ball
char process = '0';

// the borders of the table
int leftBorder = 160;
int rightBorder = 440;
int upperBorder = 155;
int lowerBorder = 645;

// array of the ball (instances of the class Ball)
Ball[] balls = new Ball[7];

// pockets positions
int terminal1[] = new int [2];
int terminal2[] = new int [2];
int terminal3[] = new int [2];
int terminal4[] = new int [2];
int terminal5[] = new int [2];
int terminal6[] = new int [2];
int terminal7[] = new int [2];

// the radius of the terminals
int radius = 34;

// the speed of balls moving
float speed = 5;

// tracks if the white ball is collided with another ball or not 
boolean collided = false;

// tracks which ball is collided with the white ball
int i = 0;

// remaining balls in the level
// when it is = 0 the level is completed
int remaining;

// detects if the player lost the game (fell the white ball in a pocket)
// we use it to show the (game lost) layer
boolean lostGame = false;

PImage table;

// random variable to generate a random table each level depending on its value
float randomTable;
// to track the last random table choosen so that it will not be choosen in the next level
float lastRandomTable;

PImage background;

// random variable to generate a random background each level depending on its value
float randomBackground;
// to track the last random background choosen so that it will not be choosen in the next level
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

// to increase the level just one time after clearing the level
boolean levelIncreased = false;

// to play the gameCompeleted sound just one time after compeleting the last level
boolean gameCompletedSound = false;

// to detect if the game is finised or not (the last level has been passed)
boolean gameFinished = false;

// to detect if the player starts the game when he already finished it
boolean startWithComplete = false;

// to detect if the player closed the start with complete layer (clicked on yes or on no)
boolean startWithCompleteClosed = false;
PImage gameFinishedPic;
PImage levelFinishedPic;

// to detect if the player is at the mainmenu or not
boolean mainmenu = true;

// to detect whether or the reset confirmation layer is on or off
boolean resetConfirmation = false;

boolean levelStarted = false;

// to detect whether or the instructions layer is on or off
boolean showInstructions = false;

PImage mainmenuPic;
PImage instructions; // the exclamation mark (!)
PImage arrowKeys;
