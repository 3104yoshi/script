 * XML文書の構造 [1]
    - 概要 : 木構造と包含関係を組み合わせた構造

    - ノードの種類 (3つ)
        - 要素ノード : タグ (Tag)
        - 属性ノード : 属性 (Attribute)
        - テキストノード : 開始タグと終了タグで囲まれたテキスト (Text)

    - ノード同士の関係 (2つ)
        - 親子関係 : 要素ノードと要素ノード，または要素ノードとテキストノード
        - 包含関係 : 要素ノードと属性ノード

 * DOMツリーの構成要素 [2]
    - DOMでは、文書の構成要素を木のノードとして扱う。
    - 主なノードは以下の4種類 (他にもいくつかある)。全てノードクラスに含まれる
        - Document : 文書全体を表すノード (rootノード)。子ノードは1つだけ
        - Element: 要素を表すノード。0個以上の子ノードを持つ
        - Text : テキストを表すノード。子ノードなし
        - Attr : 要素の属性 (Attribute) を表すノード。"XML文書の構造"の項でも述べた通り、要素の子ノードではない。

 * 子ノードの取得に使用するメソッド (4つ)
    - node.getChildNodes() : あるノードの子ノードを一括で取得する
        - 戻り値の型 : NodeList or null

    - node.getFirstChild() : あるノードの先頭の子ノードを取得する
        - 戻り値の型 : Node or null

    - node.getLastChild() : あるノードの末尾の子ノードを取得する
        - 戻り値の型 : Node or null

    - node.getNextSibling() : あるノードの次に位置する兄弟ノードを取得する
        - 戻り値の型 : Node or null

 * 属性 (Attribute) を取得する手順 [3]
    1. node.getAttributes()により、あるノードの属性を一括で取得する (戻り値の型 : NamedNodeMap or null)
    1. namedNodeMapをイテレートして、属性を1つづつ取り出す (戻り値の型 : String)
``` java
Document document2 = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(filePath);
		// rootの取得
        Node rootNode = (Node) (document2.getDocumentElement());
        // 
        Node titleNode = rootNode.getFirstChild();
        while (titleNode != null) {
        	System.out.println(titleNode.getAttributes().item(0).getNodeValue());
```

 * 

 * 参考
    - [1] http://itdoc.hitachi.co.jp/manuals/3020/30203N8400/EN840106.HTM
    - [2] https://www.mlab.im.dendai.ac.jp/~yamada/web/xml/dom/
    - [3] https://www.techscore.com/tech/Java/JavaSE/DOM/3-3/