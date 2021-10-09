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

後々並べ替えるとのことですが、ひとまず q2 と仮定して問題を作成しています

```rb:q2/method.rb
require './base.rb'
require './q2/target_array.rb'
require './q2/calc.rb'

module Q2
  class Method < Base
    class << self

      def continue
        @key = gets.chomp
      end

      def execute
        puts "プログラムが正しい値を算出するように修正してください"
        puts "但し、execute 内の処理は変更しないこと"
        puts "プログラムを開始する場合、「y」キーを入力後「ENTER」キーを入力してください"

        continue
        return puts "最初からやり直してください" unless @key == "y"

        array = TargetArray.numbers

        if Calc.twice(array) == [4, 10, 20, 60]
          puts "おめでとう！正解です！"
        else
          raise
        end
      rescue
        puts "残念！不正解！ binding.pry を使いながらどの処理に問題があるか、確認しましょう！"
      end
    end
  end
end
```

```rb:q2/calc.rb
require './base.rb'

module Q2
  class Calc < Base
    class << self
      def twice(arr)
        arr * 2
      end
    end
  end
end
```

```rb:q2/target_array.rb
require './base.rb'

module Q2
  class TargetArray < Base
    class << self
      def number
        [2, 5, 10, 30]
      end
    end
  end
end
```

#### 解答

- `target_array.rb`内のメソッド名を `number` -> `numbers` へ変更
- `calc.rb`内の`twice`メソッドの処理を変更
  - `arr * 2` -> `arr.map { |number| number * 2}` のように map を使った処理に変更することで正しい値が算出される

#### 解説

ファイルを 3 ファイルに分けました。
エラーを rescue で拾うようにして、エラー文を読んで回答することよりも binding.pry を使ってどの処理でエラーしているのか確認する練習に良いように構成してみました。
また配列についての問題だったため、map 処理の使い方を理解していないと回答できないようにも設定しています。

### 江原ここまで
