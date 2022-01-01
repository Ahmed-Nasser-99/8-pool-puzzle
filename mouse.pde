// all the stuff of the mouse
void mouseReleased() {
  // if we are in the mainmenu
  if(mainmenu == true){
    // the user clicked on the reset button while the showInstructions is false
    if (mouseY < 50 && mouseX > width - 100 && showInstructions == false) {
        resetConfirmation = true;
    }
    
    // if the instructions layer is on and the player pressed at any position
    // close the instructions layer and return
    if ( showInstructions) {
        showInstructions = false;
        return;
    }
    
    // user clicked on the instructions button
    if (mouseY > height - 50 && mouseX < 50) {
        showInstructions = true;
    }
    
    // if the reset confirmation layer is on
    if(resetConfirmation == true ){
      // if pressed yes
      if ( mouseX > 100 && mouseX < 200 && mouseY > 500 && mouseY < 550) {
        reset();
        // hide the reset confirmation layer
        resetConfirmation = false;
        return;
      }
      // if the player pressed no
      if ( mouseX > 400 && mouseX < 500 && mouseY > 500 && mouseY < 550 ) {
        // hide the reset confirmation layer
        resetConfirmation = false;
        return;
      }
    }
    
    // if the start with complete layer is on
    if(startWithComplete == true){
      // if pressed yes
      if ( mouseX > 100 && mouseX < 200 && mouseY > 500 && mouseY < 550 && mainmenu == true) {
        
        reset();
        // hide the start with completes layer
        startWithComplete = false;
        return;
      }
      if ( mouseX > 400 && mouseX < 500 && mouseY > 500 && mouseY < 550) {
        startWithComplete = false;
        startWithCompleteClosed = true;
        return;
      } 
    }
    
    // if there are no layers shown (just mainmenu)
    if (showInstructions == false && resetConfirmation == false && startWithComplete == false ) {
        mainmenu = false;
        startLevel(true);
      }
  }
  
  // we are NOT in the mainmenu
  else{
    // pressed on retry and there are no remaining ball, didn't lose
    // the level yet or didn't finish the game
    if (mouseY < 50 && mouseX > width - 100 && remaining != 0 && lostGame == false && gameFinished == false) {
      startLevel(false);
    }
    
    // pressed on the next level button and there are no remaining balls and didn't complete the game 
    if (mouseY > 600 && mouseY < 670 && mouseX > width / 2 - 180 && mouseX < width / 2 - 180 + 360 && remaining == 0 && gameFinished == false) {
      startLevel(true);

    }
    
    // pressed retry after losing the level (the white ball fell into a pocket)
    if (mouseY > 500 && mouseY < 570 && mouseX > width / 2 - 180 && mouseX < width / 2 - 180 + 360 && lostGame && gameFinished == false) {
      startLevel(false);
    }
    
    // pressed return
    if (mouseY > height - 50 && mouseX > width - 100 && lostGame == false && remaining != 0 && gameFinished == false && mainmenu == false) {
      mainmenu = true;
    }
  }
}
