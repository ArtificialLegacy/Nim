int w = 500;
int h = 500;

void settings() {
  size(w, h);
}

Button start = new Button(w/2-25, h/2, 50, 50);

Button up1 = new Button(20, 250, 40, 40);
Button up2 = new Button(80, 250, 40, 40);
Button up3 = new Button(140, 250, 40, 40);

Button quit = new Button(w-60, h-60, 40, 40);

Button easy = new Button(20, 450, 40, 40);
Button hard = new Button(80, 450, 40, 40);

String menu = "main";

Boolean diff = true;

int aiTime = -1;

int coll = 0;

int lastMove = 0;

String winr;

void setup() {
  background(100);
}

void draw() {
  clear();
  background(100);
  if(menu == "main"){
    textSize(100);
    text("Nim", width/2-100, 100);
    textSize(20);
    start.update();
    fill(0);
    text("Start", w/2-25+4, h/2+33);
    if(!diff){
      text("Hard Mode", 18, 445);
    } else {
       text("Easy Mode", 20, 445); 
    }
    easy.update();
    hard.update();
    fill(0);
    textSize(13);
    text("Easy", 25,  475);
    text("Hard", 85, 475);
  } else if(menu == "game"){
    game();
  } else if(menu == "end"){
    end();
  }
}

int finalLoc;

void end(){
  fill(0);
  if(winr == "player"){
    textSize(50);
    text("Player Wins!!!", 120, 200);
  } else {
    textSize(50);
    text("AI Wins!!!", 150, 200);
  }
  textSize(13);
  start.update();
  fill(0);
  text("Restart", w/2-25+4, h/2+33);
}

void game(){
  for(int i = 1; i < 13; i++){
    fill(0);
    ellipse(20 * i, 150, 15, 15);
    finalLoc = i;
  }
  fill(112, 6, 6);
  ellipse(20 * (finalLoc), 150, 15, 15);
  strokeWeight(0);
  fill(100);
  rect(20, 75, 200, 50);
  strokeWeight(1);
  fill(100);
  rect(275, 20, 208, 165);
  strokeWeight(0);
  fill(0);
  textSize(13);
  text("Nim - a game where you try to", 280, 40);
  text(" collect the last coin.", 280, 60);
  text("- You can only collect 1, 2, or 3", 280, 100);
  text("  coins per a turn.", 280, 120);
  text("- After your turn an AI takes", 280, 160);
  text(" a turn.", 280, 180);
  textSize(23);
  if(aiTime == -1){
    text("Player's turn", 50, 110);
  } else {
    text("AI's turn", 50, 110); 
  }
  up1.update();
  up2.update();
  up3.update();
  fill(0);
  textSize(13);
  text("+1", 30, 275);
  text("+2", 90, 275);
  text("+3", 150, 275);
  quit.update();
  fill(0);
  text("Quit", w-53, h-35);
  for(int i = 0; i<coll; i++){
     fill(100, 0, 0);
     textSize(23);
     text("X", 20*(i+1)-5, 156);
  }
  aiMove();
}

void turn(int tempC, String tempTurn){
   coll += tempC;
   lastMove = tempC;
   if(coll >= 12){
     menu = "end";
     winr = tempTurn;
     coll = 0;
     lastMove = 0;
   }
}

void aiMove(){
  if(aiTime > 0){
    aiTime--;
  }
  if(aiTime == 1){
    if(diff){
      turn(floor(random(1, 4)), "ai");
    } else {
      turn(4-lastMove, "ai");
    }
    aiTime = -1;
  }
}

void mouseClicked(){
  if(menu == "main"){
    if(start.check()){
      menu = "game";
    }
    if(easy.check()){
       diff = true; 
    }
    if(hard.check()){
       diff = false; 
    }
  } else if(menu == "game"){
     if(quit.check()){
       winr = "ai";
       menu = "end";
       coll = 0;
       lastMove = 0;
     }
     if(up1.check()){
       if(aiTime == -1){
         turn(1, "player");
         if(menu == "game"){
           aiTime = floor(random(10, 20));
         }
       }
     }
     if(up2.check()){
       if(aiTime == -1){
         turn(2, "player");
         if(menu == "game"){
           aiTime = floor(random(10, 20));
         }
       }
     }
     if(up3.check()){
        if(aiTime == -1){
         turn(3, "player");
         if(menu == "game"){
           aiTime = floor(random(10, 20));
         }
        }
     }
  } else if(menu == "end"){
     if(start.check()){
        menu = "main"; 
     }
  }
}
