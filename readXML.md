# XML
 * xmlとは
   - 文書やデータの意味や構造を記述するためのマークアップ言語
 * XML文書の構造 [1]
    - 概要 : 木構造と包含関係を組み合わせた構造

    - ノードの種類 (3つ)
        - 要素ノード : タグ (Tag)
        - 属性ノード : 属性 (Attribute)
        - テキストノード : 開始タグと終了タグで囲まれたテキスト (Text)

    - ノード同士の関係 (2つ)
        - 親子関係 : 要素ノードと要素ノード，または要素ノードとテキストノード
        - 包含関係 : 要素ノードと属性ノード

# DOM (Document Object Model )
* DOMとは
     - HTML文書やXML文書（あるいはより単純なマークアップされた文章など）をオブジェクトの木構造モデルで表現することで、ドキュメントをプログラムから操作・利用することを可能にする仕組み
* DOMツリーの構成要素 [2]
    - DOMでは、文書の構成要素を木のノードとして扱う。
    - 主なノードは以下の4種類 (他にもいくつかある)。全てノードクラスに含まれる
        - Document : 文書全体を表すノード (rootノード)。子ノードは1つだけ
        - Element: 要素を表すノード。0個以上の子ノードを持つ
        - Text : テキストを表すノード。子ノードなし
        - Attr : 要素の属性 (Attribute) を表すノード。"XML文書の構造"の項でも述べた通り、要素の子ノードではない。

# JavaにおけるDOMオブジェクトの扱い方の例 (サンプル付き)
##### 子ノードの取得に使用するメソッド (4つ)
 * node.getChildNodes() : あるノードの子ノードを一括で取得する
     - 戻り値の型 : NodeList or null

 * node.getFirstChild() : あるノードの先頭の子ノードを取得する
     - 戻り値の型 : Node or null

 * node.getLastChild() : あるノードの末尾の子ノードを取得する
     - 戻り値の型 : Node or null

 * node.getNextSibling() : あるノードの次に位置する兄弟ノードを取得する
     - 戻り値の型 : Node or null

###### getFirstChild()とgetNextSibling()を組み合わせたパターン

``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement());
Node childNode = rootNode.getFirstChild();
while (childNode != null) {
	// 取得したchildNodeに関する、何らかの操作
				:
				:
	
	// 次の子ノードを取得
	childNode = childNode.getNextSibling();
}
```
###### getChildNodes()を使うパターン

``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement();
NodeList childNodeList = rootNode.getChildNodes();
for (int i = 0; i < childNodeList.getLength(); i++) {
	// i番目の子ノードを取得する
	Node currentChildNodes = childNodeList.item(i);
	// 取得したchildNodeに関する、何らかの操作
				:
				:
}
```

##### タグ (Tag) の名前を取得する手順
 * node.getNodeName()メソッドにより、あるノードのタグを取得する
  
``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement();
Node childNode = rootNode.getFirstChild();
System.out.println(titleNode.getNodeName()); // KirbysDreamLand
```

##### テキスト (Text) の内容を取得する手順 (2通り)
 * 1つ目
     1. テキストノードに対して、getNodeValue()メソッドを用いる
 * 2つ目
     1. テキストノードを親ノードに対して、getTextContent()メソッドを用いる
 
``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement();
Node childNode = rootNode.getFirstChild();
System.out.println(childNode.getFirstChild().getNodeValue()); // Kirby
System.out.println(childNode.getTextContent()); // Kirby
```

##### 属性 (Attribute) の属性値を取得する手順 (2通り) [3]
 * 1つ目
     1. node.getAttributes()により、あるノードの属性を一括で取得する (戻り値の型 : NamedNodeMap or null)
     1. namedNodeMapをイテレートして、属性を1つづつ取り出す
    
``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement();
Node childNode = rootNode.getFirstChild();
// 属性を一括で取得
NamedNodeMap namedNodeMap = childNode.getAttributes();
for (int i = 0; i < namedNodeMap.getLength(); i++) {
    System.out.println(namedNodeMap.item(i).getNodeValue()); // i=0:HAL Laboratory, Inc. i=1:1992/04/27
} 
```
 * 2つ目
     1. element.getAttribute(tagName)により、ある要素について、指定した属性 (tagName) の属性値を取得する

``` java
// rootノードを取得する
Document document = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
// document直下のrootノードを取得する
Element rootNode = document.getDocumentElement();
Node childNode = rootNode.getFirstChild();
// 属性値を取得 (getAttributeメソッドを使用できるのは、elementインタフェースを継承したオブジェクトのみ。そのためキャストしている)
System.out.println(((Element) childNode).getAttribute("release")); //1992/04/27
```
 * 参考
    - [1] http://itdoc.hitachi.co.jp/manuals/3020/30203N8400/EN840106.HTM
    - [2] https://www.mlab.im.dendai.ac.jp/~yamada/web/xml/dom/
    - [3] https://www.techscore.com/tech/Java/JavaSE/DOM/3-3/  
 * xml in sample code
 
```xml
<nintendo>
<KirbysDreamLand developer="HAL Laboratory, Inc." release="1992/04/27">Kirby</KirbysDreamLand>
<pokemon developer="GAME FREAK Inc." release="1996/02/27">picachu</pokemon>
</nintendo>
```