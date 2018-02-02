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

void setup () {
  //設定
  size(800, 400);
  background(50);
  noStroke();
  //1マスの大きさ
  r = 20;
  r_half = r / 2;
  //ウィンドウサイズと1マスの大きさからドッドの数を割り出す
  numX = width / r;
  numY = height / r;
  //インスタンス
  blocks = new Blocks[numX][numY];
  nums = new int[numY][numX];
  //ドットの大きさ
  diameter = r - 2;
  diameter_half = diameter / 2;
  //クリック範囲の最大値
  max_dist = dist(0, 0, diameter_half, diameter_half);
  //各ドットのインスタンス作成
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j] = new Blocks(i * r + r_half, j * r + r_half);
    }
  }
}

void draw () {
  //各ドッドを描画
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j].display();
    }
  }
}

void mouseClicked () {
  for (int i = 0; i < numX; i ++) {
    for (int j = 0; j < numY; j ++) {
      blocks[i][j].change();
    }
  }
}

void keyPressed () {
  //スペースキーが押されたとき
  if (key == ' ') {
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
  }
}