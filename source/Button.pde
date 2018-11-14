class Button {
  int x;
  int y;
  int w;
  int h;
  
  Button(int tempX, int tempY, int tempW, int tempH) {
    this.x = tempX;
    this.y = tempY;
    this.w = tempW;
    this.h = tempH;
  }
  
  void update(){
    fill(100);
    strokeWeight(1);
    rect(this.x, this.y, this.w, this.h);
  }
  
  public Boolean check(){
     if(mouseX >= this.x && mouseX <= this.x+this.w && mouseY >= this.y && mouseY <= this.y+this.h){
       return true;
     } else {
        return false; 
     }
  }
}
