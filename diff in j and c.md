 ### 1
 * ファイルの名前
    - クラス名と揃える
 * 定数
    - const → final
 * データ型
    - bool型
    - string型
 ### 2
 * エスケープシーケンス
    - \ 
 * 文字列の連結
    - +で結合可能
 * 表示
    - %による変換の指定が不要
    - 改行あり：System.out.printIn();
    - 改行なし：System.out.print();
 * 最大値、最小値
    - Mathクラスのmax, minメソッド  ex) max(5, 10)
 ### 3
 * 文字列の比較
    - stringクラス equalsメソッド  ex) str.equals("ooishi") // strが"ooishi"と等しいかを比較
 * 短絡評価
    - 複数条件式あるとき、条件が途中で確定したら、その後の条件式を評価しない
 ### 4
 * 配列の宣言
    - 型[] 名　　ex) int[] array;
 * 配列の要素の作成
    - array = new int[5];
 * 宣言～要素の作成
    - int[] array = new int[5];
 * 宣言～代入
    - int[] array = {0, 1, 2, 3, 4}
 * 拡張for文
    - for (型名 要素名 : 配列名)  ex) for (int value : array) {.....}
 * ガベージコレクション
    - 神
 ### 5
 * メソッド
    - 関数に近い
    - mainメソッドから動く
 * オーバーロード
    - 引数の個数、あるいは型が異なれば、同名の関数を定義可能
 * 戻り値に配列を指定可能
 * 引数で配列を指定
    - 参照渡しなので気をつける
 * コマンドライン引数
    - public static void main(String[] args) {......}
 ### 6
 * 複数クラス
    - 別のクラスのメソッドはクラス名.メソッド名()で呼び出せる　ex)Calculation.add(a, b);
 * 実行
    - コンパイル後、クラス名を指定して起動 
 * パッケージ
    - クラスをまとめる
    - パッケージ名.クラス名.メソッド名()で呼び出せる　ex)Calcpackage.Calculation.add(a, b);
    - import文で省略可能
 * クラスパスとパッケージ階層
    - パッケージ階層に対応したディレクトリの配置が実行時に必要
 * API
    - 標準で搭載されているクラス 
