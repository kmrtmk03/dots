//Javaのクラス読み込み
import java.util.Arrays;

//ドット描画の変数
Blocks[][] blocks;
int numX;
int numY;
int r;
int r_half;
float diameter;
float diameter_half;
float dist;
float max_dist;
color whiteColor = color(255, 255, 255);
color blackColor = color(0, 0, 0);

//ファイル書き出しの変数
PrintWriter output;
int[][] nums;

//ボタンの設定
PFont font;
color buttonColor = color(255, 255, 255);
Buttons buttonJpg;
Buttons buttonTxt;


void setup () {
  
  //全体の設定
  size(1280, 720);
  background(50);
  noStroke();
  
  //1マスの大きさ
  r = 10;
  r_half = r / 2;
  //ウィンドウサイズと1マスの大きさからドッドの数を割り出す
  numX = width / r;
  numY = (height - 40) / r;
  //ドットの大きさ
  diameter = r - 2;
  diameter_half = diameter / 2;
  //クリック範囲の最大値
  max_dist = dist(0, 0, diameter_half, diameter_half);
  
  //配列の個数
  blocks = new Blocks[numX][numY];
  nums = new int[numY][numX];
  
  //各ドットのインスタンス作成
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j] = new Blocks(i * r + r_half, j * r + r_half);
    }
  }
  //SaveButtonのインスタンス作成
  buttonTxt = new Buttons(20, height - 30, 120, 20, buttonColor, "Save txt");
  buttonJpg = new Buttons(150, height - 30, 120, 20, buttonColor, "Save jpg");
  
}


void draw () {
  
  //各ドッドを描画
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j].display();
    }
  }
  
  //各buttonを描画
  buttonTxt.display();
  buttonJpg.display();
  //ボタンが押されているときの色変更
  buttonTxt.pressed();
  buttonJpg.pressed();  
  
}

void mouseClicked () {
  
  //各ドットの色変更
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j].change();
    }
  }
  
  //保存
  buttonTxt.action();
  buttonJpg.action();
  
}