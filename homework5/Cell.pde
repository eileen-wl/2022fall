class Cell {

  float x, y;
  float w;

  float state;  //细胞的当前状态
  float previous;  //细胞的之前状态

  Cell(int x_, int y_, int w_) {
    x = x_;
    y = y_;
    w = w_;
    
    state = random(1);  //初始状态为随机
    //println(state);
    previous = state;  //之前状态设为细胞初始状态
  }
  
  void savePrevious() {
    previous = state;   
  }

  void newState(float s) {
    state = s;
  }

  void display() {
   
    if (previous == 0 && state > 0)
    {
      fill(87, 197, 56);
    }//如果之前状态是死，现在细胞复活了(幼年期)，显示绿色
   
    else if (previous > 0 && state == 0)
    {
      fill(0);  
    }//如果之前状态为活着，现在细胞状态为死亡，那么填充黑色
    else if(state >= 0.5)
    {
      fill(114, 35, 24);   
    }//细胞处于衰老状态，填充棕色
    else fill(200);//细胞previous和state状态都为死亡
    noStroke();
    ellipse(x + w/2, y + w/2, w, w);
  }
}
