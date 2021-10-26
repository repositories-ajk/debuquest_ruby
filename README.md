# DebuQuest -Ruby-

## 実行方法

0. clone 後最初に以下を実行してください

```
bundle install --path vendor/bundle
```

1. アプリ直下で以下を実行

```
bundle exec ruby execution.rb
```

2. 挑戦したい問題番号を入力してください

```
挑戦する問題番号を入力してください！！
1
```

3. 「2」を実行すると、`execution.rb` 内の問題番号に対応したメソッドが実行されます
   例: 問 1 だと `q1メソッド` が実行されます。

4. 各問題の指示通りの挙動になるようにコードを修正してください

※修正対象のファイルは各問題番号に対応するフォルダの範囲内で修正してください。

例: 問 1 を修正する際は `q1フォルダ` 内のみで修正

## 問題

### 問 1

- プログラムが正しく動くようにしてください

### 江原ここから

問 8

#### 問題文

プログラムが正しい値を算出するように修正してください。
但し、execute 内の指定している箇所のコードは変更しないこと

#### 解答

- 変数 number を numbers に変更

- `calc.rb`内の`twice`メソッドの処理を変更
  - `arr * 2` -> `arr.map { |number| number * 2}` のように map を使った処理に変更することで正しい値が算出される

#### 解説

エラーを rescue で拾うようにして、エラー文を読んで回答することよりも binding.pry を使ってどの処理でエラーしているのか確認する練習に良いように構成してみました。
また配列についての問題だったため、map 処理の使い方を理解していないと回答できないようにも設定しています。

問 9

#### 問題文

ランダムに設定された 3 つの数値に対して、

- 3 つの数値が全て同じになった場合「大当たり！」
- 3 つの数値のうち 2 つの数値が同じになった場合「惜しい！」
- 全ての数値が違う場合「残念！ハズレ！」

と出力されるスロットマシーンのようなアプリがあります。
このコードは現状の状態では上記のような動作条件を満たしておりません。
正しく動作するようにコードを修正してください。

#### 解答

- 23 行目 numbers.sumple -> nunbers.sample へ変更
- `self.check_numbers` メソッドの条件分岐の値と、`self.count_same_numbers`メソッドの条件分岐の値にズレがあるため、適切な結果が返ってこないようにしています。（大当たりが一生出ません）規程を満たすためにはどちらかのメソッドの 0 〜 3 の値を正しく修正して、適切な表示が返ってくるように修正する必要があります。

#### 解説

配列に関しては sample メソッドの役割を調べる程度の難易度にしていますが、条件分岐を少し細かく設定したので、初見では処理を追いながらでなければ解けないように設定しています。
問 8 同様にエラーは rescue で拾うようにしています。

### 江原ここまで

### 問 10

- ユーザー ID が表示されうように修正してください

### 問 10 回答

13 行目、19 行目の変数定義箇所に@を追記

```
base_info → @base_info
detail_info → @detail_info
```

# 内藤
```rb
require "pry"

def output_value(array)
  # -------- 編集可 --------
  if araay
    araay.each do |v|
      puts v
    end
  else
    puts "配列が空です"
  end
  # -------- ここまで --------
end

# -------- 以下編集不可 --------
animals = ["dog", "cat"]
output_value(animals)

empty_array = []
output_value(empty_array)
# -------- ここまで --------
```

## 問題
- 次のプログラムを実行した際、以下の実行結果になるように修正してください。

```zsh
dog
cat
配列が空です
```
### 条件
- **編集可**の部分以外は修正を行わないこと
- if~else の条件分岐は行うこと

## 解答
- araay → array にタイポを修正
- 空配列に対する条件判定の誤りを修正

```rb
require "pry"

def output_value(array)
  # -------- 編集可 --------
  if array.empty?
    puts "配列が空です"
  else
    array.each do |v|
      puts v
    end
  end
  # -------- ここまで --------
end

# -------- 以下編集不可 --------
animals = ["dog", "cat"]
output_value(animals)

empty_array = []
output_value(empty_array)
# -------- ここまで --------
```
## 解説
Ruby の真偽値は nil, false は偽。
それ以外は全て真となります。
(言語によって真偽値の条件が異なるので注意)

空配列については真 (true) の判定となる為、空配列か判定する `empty?` メソッドを使うと便利です。
(Rails の場合は `present?`, `blank?` メソッドが追加で用意されている）

```rb
# Rails の場合
if array.present?
   array.each do |v|
      puts v
   end
else
   puts "配列が空です"
end

# 以下でも間違いではないが、あまり見ない
if array == []
   puts "配列が空です"
   ...
end
```
## 参考
- [nil?, empty?, blank?, present?, exists?の違いと使いどころ](https://nishinatoshiharu.com/rails-boolean-methods/)
- [Ruby の真偽値](https://scrapbox.io/masuyama13/Ruby_%E3%81%AE%E7%9C%9F%E5%81%BD%E5%80%A4)
