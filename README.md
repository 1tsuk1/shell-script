
# exp.sh

- 指定したコマンドを上から順番に実行するスクリプト
- `-P 数値`の「数値」を変更することで、同時に実行する最大のコマンド数を指定できる
  - `-P 2`: 同時に2つまでコマンドを実行する

## 実行方法

```
nohup sh example_exp.sh &
```

## 仕組み

1. `perl -pe s/`  で「改行（\n）」を「Null」に置換した文字列を取得
    - 「s/パターン/置換文字列/」のような形式で表記
        
        [Perl：正規表現を用いた文字列の検索・置換](https://www.bold.ne.jp/engineer-club/perl-regular-expression#_s)
        
2. xargsで、
    - -0・・・「NUll」で分割
    - -n・・・引数を1つのみ受け取る（スクリプト文字列なので1つで十分）
    - -P・・・実行するプロセス数。これで「最大でいくつのプロセスを回すか」を設定できる
    - -I・・・分割した文字列（1行ごとのコマンド）を1つずつ次に渡す
        
        ```jsx
        #例①
        echo -e "AAA BBB\nCCC\nDDD" |xargs -I{} echo {} is {}
        （出力）
        AAA BBB is AAA BBB
        CCC is CCC
        DDD is DDD
        
        #例②
        echo -e "AAA BBB\nCCC\nDDD" |xargs echo {} is {}
        （出力）
        {} is {} AAA BBB CCC DDD
        ```
3. sh -c で、文字列を元にコマンドを実行