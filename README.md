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
