# ArrayListの初期化方法
#### ArrayListのコンストラクタにリスト、setを指定する

``` java
	String[] array = {"a", "b", "c"};
	List<String> list1 = new ArrayList<>(Arrays.asList(array));
	Set<String> set = new HashSet<>(list1);
	List<String> list2 = new ArrayList<>(set);
```
#### ストリームを使う
``` java
	List<String> list3 = Stream.of(array).collect(Collectors.toList());
```

#### やってはいけない初期化法
``` java
	List<String> list4 = Arrays.asList(array);
```
 * この方法の問題点
    - Arrays.asList(array)で生成したArrayListは固定長のリストになっており、要素数の変更ができない(addメソッドやremoveメソッドが使用不可)
    - ArraysのasListメソッドで生成されるArrayListは、Arraysクラス内でインナークラスとして定義されている。
    - そのため、Listインターフェースを継承したクラスArrayListとは名前が同じだけで全くの別物である。
