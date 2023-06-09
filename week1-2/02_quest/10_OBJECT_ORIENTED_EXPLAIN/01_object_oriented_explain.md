## オブジェクト指向とは何か
1. オブジェクト指向の目的  
- ソフトウェアの保守や再利用をしやすくする  
対象とするシステムの個々の部品（オブジェクト）に強く着目し、独立性を高めることで下記を実現する  
・部品の修正が発生した時の影響範囲を最小限にし保守性を高める  
・部品を他システムで再利用する

2. カプセル化  
- クラス（オブジェクトの設計図）をカプセルのように隠蔽すること  
設計図をカプセル化することで他の設計図からの変更を制限でき、オブジェクトの独立性を高めることができる  
*クラスとは：共通の性質を有する集合、部類、種類であり、オブジェクトを生成するための設計図

3. 継承  
- 類似するクラス（集合）の共通点と相違点を整理する仕組み  
スーパークラス（全体集合）で定義した共通の性質を、サブクラス（部分集合）で使用することができる  
サブクラスにはサブクラス独自の定義を追加することが可能  
*集合論のスーパーセット、サブセットに由来  

4. ポリモーフィズム  
- 類似するクラス（集合）に対する命令を共通化する仕組み  
サブクラス毎に異なる動作をする定義が存在した時に
共通の命令をするだけで、サブクラス独自の動作をさせることができる

5. 単一責任の原則  
- 1つのクラス（集合）は1つの役割のみを果たすように設計すべきであるいう原則  
この原則に従うことでクラスの役割が明確になり、オブジェクトの独立性を高めることができる  
