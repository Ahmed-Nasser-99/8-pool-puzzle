void reset(){
  levelStr[0] = "1";
  saveStrings("./data/level.txt",levelStr);
  level = int(levelStr[0]);
  
  // to prevent rendering them after resetting the game
  for(int j = 1; j < 7; j++){
    balls[j].x = -100;
    balls[j].y = -100;
  }
  terminal1[0] = 0;
  terminal1[1] = 0;
  terminal2[0] = 0;
  terminal2[1] = 0;
  terminal3[0] = 0;
  terminal3[1] = 0;
  terminal4[0] = 0;
  terminal4[1] = 0;
  terminal5[0] = 0;
  terminal5[1] = 0;
  terminal6[0] = 0;
  terminal6[1] = 0;
  terminal7[0] = 0;
  terminal7[1] = 0;
}
