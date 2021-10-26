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

### 問 0

- Q. プログラムが正しく動くようにしてください

例

```
好きな数字を入力してください
1
もう一度数字を入力してください
5
足し算します
6
```

- 回答

```
require './base.rb'

module Q0
  class Method < Base
    def self.execute
      puts "好きな数字を入力してください"
      num_1 = gets.chomp.to_i

      puts "もう一度数字を入力してください"
      num_2 = gets.chomp.to_i

      puts "足し算します"

      sum = (num_1 + num_2)

      puts sum
    end
  end
end

```

### 問 1

- Q. プログラムが正しく動くようにしてください

例

```
お名前を入力してください
あじー
あじーさん、こんにちわ！！
```

- 回答

```
require './base.rb'

module Q1
  class Method < Base
    def self.execute
      puts "お名前を入力してください"
      name = set_name

      return puts "文字列で入力してください" unless get_string?(name)

      disp_name(name)
    end

    def self.disp_name(name)
      puts "#{name}さん、こんにちわ！！"
    end
    private_class_method :disp_name

    def self.set_name
      name = gets.chomp

      name
    end
    private_class_method :set_name

    def self.get_string?(target)
      target.is_a?(String)
    end
    private_class_method :get_string?
  end
end

```

### 問 4

- Q1. 郵便番号は「ハイフンあり」「ハイフンなし」どちらも入力出来るように修正してください

```
◯ 100-0001
◯ 1000001
```

- 回答

`zip_client.rb`

```
def self.validate_zipcode(value)
  code_regex = /^[0-9]{3}-?[0-9]{4}$/

  value =~ code_regex
end
```

- Q2. 今のままプログラムを動かすと `uninitialized constant Q4::BaseApiClient::Faraday (NameError)` が発生します。このエラーを解消してください。

- 回答

`base_api_client.rb`

```
require "faraday_middleware"

module Q4
  module BaseApiClient
    private

    def self.get_connection(url, params = nil)
      conn = Faraday.new(url: url, params: params) do |f|
        f.request :json
        f.request :retry
        f.response :follow_redirects
        f.response :json
      end

      res = conn.get
    end
  end
en
```

- Q3. プログラムが次のように動くように修正してください。

例:1

```
郵便番号を入力してください
1000001

入力された郵便番号の住所は
東京都千代田区千代田 です
```

例:2

```
郵便番号を入力してください
000-0000

入力された郵便番号の住所は
不明な住所 です
```

- 回答

```
def self.get_full_address(zipcode)
  return raise Validation Error unless validate_zipcode(zipcode)

  params = { zipcode: zipcode }
  res = call(params)

  result = if !res.body['data'].nil?
             res.body["data"]["fulladdress"]
           else
             '不明な住所'
           end

  result
end

```

- 最終的なコード

`base_api_client.rb`

```
require "faraday_middleware"

module Q4
  module BaseApiClient
    private

    def self.get_connection(url, params = nil)
      conn = Faraday.new(url: url, params: params) do |f|
        f.request :json
        f.request :retry
        f.response :follow_redirects
        f.response :json
      end

      res = conn.get
    end
  end
end
```

`zip_client.rb`

```
require './q4/base_api_client.rb'

module Q4
  module ZipClient
    BASE_URL = 'https://api.zipaddress.net/'

    def self.get_full_address(zipcode)
      return raise Validation Error unless validate_zipcode(zipcode)

      params = { zipcode: zipcode }
      res = call(params)

      result = if !res.body['data'].nil?
                 res.body["data"]["fullAddress"]
               else
                 '不明な住所'
               end

      result
    end

    def self.call(params = nil)
      BaseApiClient.get_connection(BASE_URL, params)
    end
    private_class_method :call

    def self.validate_zipcode(value)
      code_regex = /^[0-9]{3}-?[0-9]{4}$/

      value =~ code_regex
    end
  end
end
```

### 問 5

- Q. プログラムが正しく動くように実装してください

挙動

```
〜管理ユーザー作成〜
名前: 管理ユーザー
権限: 管理者
--------------------
〜一般ユーザー作成〜
名前: 一般ユーザー
権限: 一般
--------------------
〜管理ユーザーによるユーザー作成〜
名前: ユーザー1
権限: 一般
--------------------
〜一般ユーザーによるユーザー作成〜
※権限がありません※
--------------------
〜一般ユーザーによりユーザー1の権限を変更〜
※権限がありません※
--------------------
名前: ユーザー1
権限: 一般
--------------------
〜管理ユーザーにより一般ユーザーの権限を変更〜
名前: 一般ユーザー
権限: 管理者
--------------------
〜管理ユーザーにより一般ユーザーの権限を変更(2回目)〜
既に管理者です
名前: 一般ユーザー
権限: 管理者
--------------------
```

- 回答

```
require './base.rb'

module Q4
  class User < Base
    ROLE = { admin: '管理者', general: '一般' }
    attr_reader :name, :role

    def initialize(name:, role:)
      @name = name
      @role = role
    end

    def create_user(name:, role:)
      if admmin?
        User.new(name: name, role: role)
      else
        puts '※権限がありません※'
        puts '--------------------'
      end
    end

    def change_admin(user)
      if admmin?
        return puts '既に管理者です' if user.admmin?
        user.role = 'admin'
      else
        puts '※権限がありません※'
        puts '--------------------'
      end
    end

    def admmin?
      role == 'admin'
    end

    def disp_data
      puts "名前: #{name}"
      puts "権限: #{ROLE[role.to_sym]}"
      puts '--------------------'
    end

    protected

    def role=(role)
      @role = role
    end
  end
end
```

### 問 6

- Q1. メソッドの追加やオーバーライドをせずに、以下の表示になるよう修正してください
- Q2. 「◯ 曜日」はご自身が実装されている日を想定して、正しく割引されるよう修正してください

※メニュー番号が正しく入力されていないときにエラーするのは、そのままで大丈夫です。

```
◯曜日は全品100円引き！
--------------
1. 焼き鳥 100円(700kcal)
2. モツ煮込み 200円(600kcal)
3. ビール 400円(500mL)
4. レモンサワー 280円(400mL)
--------------
メニューの番号を選択してください
3
選択されたメニュー: ビール
個数を入力してください(3つ以上頼むと100円引き！)
5
お会計は1800円です
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
