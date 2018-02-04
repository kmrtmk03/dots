class Buttons {
  
  float x;
  float y;
  float bw;
  float bh;
  color bC;
  String bt;
  PVector clickPos;
  
  //Buttons(x座標, y座標, 幅, 高さ, 色, テキスト)
  Buttons (float xpos, float ypos, float bWidth, float bHeight, color bColor, String bText) {    
    x = xpos;
    y = ypos;
    bw = bWidth;
    bh = bHeight;
    bC = bColor;
    bt = bText;
  }
  
  //表示させる
  void display () {
    //座布団
    noStroke();
    fill(bC);
    rect(x, y, bw, bh);
    //文字
    font = createFont("Arial",18);
    textFont(font);
    textSize(14);
    textAlign(CENTER, CENTER);
    textLeading(bh);
    fill(0);
    text(bt, x + bw / 2, y + bh / 2 - 2);
  }
  
  //クリックされたときに発火
  void action () {
    //クリックされた位置を取得
    clickPos = new PVector(mouseX, mouseY);
    //クリックされた位置がボタン内のとき、発火
    if (clickPos.x > x && clickPos.x < x + bw && clickPos.y > y && clickPos.y < y + bh) {      
      switch (bt) {
        //jgp保存
        case "Save jpg":
          print("save jpg");
          //出力
          save("sample.jpg");
          break;
        //txt保存
        case "Save txt":
          print("save txt");
          //出力用のファイルを準備
          output = createWriter("sample.txt");
          for (int i = 0; i < numX; i ++) {
            for (int j = 0; j < numY; j ++) {
              //各ドッドの中心ピクセルの色情報を取得
              float getPix= get(i * r + r_half, j * r + r_half);
              if (getPix == whiteColor) {
                //白の場合1を代入
                nums[j][i] = 1;
              } else if (getPix == blackColor) {
                //黒の場合0を代入
                nums[j][i] = 0;
              } 
            }
          }
          //配列をString型に変換したあと、書き込んで出力
          String outputNum = Arrays.deepToString(nums);
          output.println(outputNum);   
          output.flush();
          output.close();          
          break;
      }
    }
  }
  
  //押されているときに発火
  void pressed () {
    if (mousePressed) {
      clickPos = new PVector(mouseX, mouseY);
      if (clickPos.x > x && clickPos.x < x + bw && clickPos.y > y && clickPos.y < y + bh) {
        bC = color(100, 100, 100);
      }
    } else {
      bC = color(255, 255, 255);
    }
  }
  
}