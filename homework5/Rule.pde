class GOL {

  int w = 8;
  int columns, rows;

  Cell[][] board;

  GOL() {
    columns = width/w;
    rows = height/w;
    board = new Cell[columns][rows];

    init();
  }

  //给每个二维细胞随机状态
  void init() {
    for (int i =0;i < columns;i++) {
      for (int j =0;j < rows;j++) {
        board[i][j] = new Cell(i*w, j*w, w);
      }
    }
  }

  // 创造新的二维细胞
  void generate() {

    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].savePrevious();
      }
    }

    // 遍历每个细胞，以便计算活着的邻居数量
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        // 计算所有邻居状态相加，计算活着的邻居数量
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {

              float n = board[(x+i+columns)%columns][(y+j+rows)%rows].previous;
              if(n > 0){
                neighbors ++;
              }
               //使用之前的状态统计邻居活着的数量
          }
        }
        // 减去自身细胞
        if(board[x][y].previous > 0){
          neighbors --;
        
        }

        
        if ((board[x][y].state > 0) && (neighbors <  2))
        {
          board[x][y].newState(0);
        }
        /*else if ((board[x][y].state > 0) && (neighbors >  7))
        {
          board[x][y].newState(0);
        }*/
        else if ((board[x][y].state > 0) && (board[x][y].state >= 0.5))
        {
          board[x][y].newState(0);
        }
        //变死亡条件：中心细胞活着，邻居细胞活着少于2个细胞；达到衰老期
        else if ((board[x][y].state == 0) && (neighbors == 2))
        {
          board[x][y].newState(random(0, 0.5));
        }
        
        //复活条件：中心细胞死亡，邻居细胞活着等于2个细胞（复活之后细胞处于幼年期）
        else if((board[x][y].state > 0) && (board[x][y].state < 0.5))
        {
          board[x][y].newState(random(0.5, 1));
        }
        //衰老条件：中心细胞活着，状态小于0.5
        
        
        
      }
    }
  }


  void display() {
    for ( int i = 0; i < columns; i++) {
      for ( int j = 0; j < rows; j++) {
        board[i][j].display();
        //println(board[i][j].state);
      }
    }
  }
}
