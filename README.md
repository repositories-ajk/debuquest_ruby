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



# hashに関する問題 （木村作成）

- プログラムが正しく動くようにしてください
- 実行後ユーザー ID が出力されるように修正してください

## -------- 以下問題コード ----------　

```ruby
require './base.rb'

# ユーザー情報
username = "木村"
userid = "123abc"
password = "pass123"
country = "japan"
age = "30"

# ユーザー基本情報格納
  username: username,
  userid: userid,
  password: password
}

# ユーザー詳細情報格納
userinfo_detail = {
  country: country,
  age: age
}

# ユーザー情報統合
userinfo = userinfo_base.merge(userinfo_detail)

response = userinfo[:useid]

puts response
```

## --------- 回答 ----------　

ユーザー情報統合の[:userid]タイポ修正

```ruby
✗ response = userinfo[:useid]
↓
◯ response = userinfo[:userid]
```
