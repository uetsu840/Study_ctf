# CPAW CTF

## 便利ツール
### 画像関連
- exif確認君
    - [exif確認君](http://exif-check.org/)
- [モールス信号復号](https://morse.ariafloat.com/en/)



## 各問題
### Q24.[Web]Baby's SQLi - Stage 2-
- SQLインジェクション。
  ユーザ名がわかっていて、パスワードフィールドを無効化すればいいので、
  ユーザ名には`porisuteru'--` とやる。
  パスワードがコメントアウトされる。
- 毎回 stage1 からいくのが面倒なのでURLメモっとく。
    https://ctf.spica.bz/baby_sql/stage2_7b20a808e61c8573461cf92b1fe63b3f/index.php

### Q26 [PPC]Remainder theorem
- 単にループを回したら終わりだった。それでいいんか?

### Q29 [Crypto] Common World
- 公開鍵暗号
    - 暗号文と、公開鍵が与えられるので復号しろという問題。
    - 同じ平文を共通のN, 別の e で暗号化したものが与えられているので、
      Common Modulus Attack で復号することができる。
- gmpy
    - GNU Multi Precision Library
      多倍長整数など任意の精度の算術ライブラリ
    - gmpy は GMPのpython用ラッパ
- このサイトを参考にしたけど、gmpy はなくてもいけた…
    - [ソースコード](https://gist.github.com/horoama/688c94fe629a321284c2b4706c75be98)
    - [説明](http://elliptic-shiho.hatenablog.com/entry/2015/12/14/043745)
- 拡張ユークリッドの互除法
    - [拡張ユークリッドの互除法 〜 一次不定方程式 ax + by = c の解き方 〜](https://qiita.com/drken/items/b97ff231e43bce50199a)
    - 一次不定方程式の解法<br>
    [一次不定方程式ax+by=cの整数解](https://mathtrain.jp/axbyc)

