
int[][] board = new int[4][4]; //[col][row]

void setup() {
  
  size(400, 400);

  addNewSpots(2);

}

void addNewSpots(int num) {
    int startingSpots = 0;
    while (startingSpots < num) {
    int x = int(random(4)); 
    int y = int(random(4)); 
    if (board[x][y] == 0) {
      if (random(1) < 0.5) {
        board[x][y] = 2;
      } else {
        board[x][y] = 4;
      }
        
     startingSpots++;
    }
  }
}

void swipeVert(int dir) {
  
  //int[][] hold = new int[4][4];
  
  int startr;
  int endr;
  int pt;
  boolean moved = false;
  
  if (dir > 0) {
    startr = 0;
    endr = 3;
    pt = 0;
  }else{
    startr = 3;
    endr = 0;
    pt = 3;
  }
 
  println("dir: " + dir + " start: " + startr + " end: " + endr + " put: " + pt);
  
  //board[pt][pt] = 10;
 
  for (int i = 0; i < 4; i++) {                      //column loop
    if(dir > 0){                                     //up direction
      for (int j = 0; j < 4; j++) {                  //row loop
        if (board[i][j] < 1) {                       //current spot empty
          if (j < 3) {                               //not at last spot
            board[i][pt] = board[i][j+1];            //move next spot to current
            board[i][j+1] = 0;                       //blank next spot
            if(board[i][pt] > 0){                    //if current spot now not empty meaning we moved a value
              moved = true;                          //set moved flag
              pt++;
            } else {                                 //current spot still empty, move again
              
            }
          }
        }else{                                       //current spot not empty
          if (j < 3) {
            if (board[i][j] == board[i][j+1]) {
              board[i][j] = board[i][j] * 2;
              board[i][j + 1] = 0;
              println("double up");
            }
          }
          pt++;
        }
      }
      pt = 0;
    }else{
      for (int j = 3; j > 0; j--) {
        if (board[i][j] < 1) {
          if(j > 0) {
            board[i][pt] = board[i][j-1];
            board[i][j-1] = 0;
            if(board[i][pt] > 0){
              moved = true;
              pt--;
            }
          }
        }else{
          if (j > 0) {
            if (board[i][j] == board[i][j - 1]) {
              board[i][j] = board[i][j] * 2;
              board[i][j - 1] = 0;
              println("double down");
            }
          }
          pt--;
        }
      }
      pt = 3;
    }
  }
  
  if (moved) {
    println("moved");
    addNewSpots(1);
  }
  
  draw();
  
}

void swipeHorz(int dir) {
  
}

void keyPressed() {
  switch (keyCode) {
    case UP:  
      swipeVert(1);
      break;
    case DOWN:  
      swipeVert(-1);
      break;
    case RIGHT:  
      swipeHorz(1);
      break;
    case LEFT:  
      swipeHorz(-1);
      break;
  }
}

void draw() {
  background(255);
  strokeWeight(4);
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      noFill();
      float x = i * 100;
      float y = j * 100;
      stroke(0);
      rect(x, y, 100, 100);
      fill(0);
      //if (board[i][j] > 0) {  
        textAlign(CENTER);
        textSize(48);
        text(board[i][j], x + 50, y + 70);
      //}
    }
  }
}