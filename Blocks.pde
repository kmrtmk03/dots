class Blocks {
  
  float x;
  float y;
  float c;
  color getColor;
  
  Blocks (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    c = 0;
  }
  
  void display () {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }
  
  void change () {
    //クリックされた箇所とドットの距離
    dist = dist(x, y, mouseX, mouseY);
    //クリックされた箇所の色情報を取得
    getColor = get(mouseX, mouseY);
    if (dist < max_dist) {
      //白だと黒にする
      if (getColor == whiteColor) {
        c = 0;
      //黒だと白にする
      } else if (getColor == blackColor) {
        c = 255;
      }
    }
  }
  
  
}