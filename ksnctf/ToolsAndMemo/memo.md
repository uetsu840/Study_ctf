#ksnctf

write up です。ネタバレはいってます。

## 便利ツール

- ELFヘッダの解析用コマンド
    - readelf -r  Relocation Table<br>
	    リンクされているLibcの関数がわかる。
    - readelf -h  elf Header
	- readelf -S  Section Header Table
	- readelf -l  Program Header Table

- バイナリダンプ
    - objdump -D [filename]

- ツール群
	- Web IDE<br>
		https://ideone.com/

	- 数の帝国(素因数分解)<br>
		https://ja.numberempire.com/numberfactorizer.php


## 問題メモ
        
### Q14 John

- ユーザ名とbase64っぽい文字列が並んでる。
    - linux の /etc/shadow のようだ。
      一番下の列が、$SHA512IsStrong$DictionaryIsHere.http//ksnctf.sweetduet.info/q/14/dicti0nary_8Th64ikELWEsZFrf.txt:15491:0:99999:7:::
      なので、指定されたファイルにアクセスするとDictionaryがダウンロードできる。
    - `curl http://ksnctf.sweetduet.info/q/14/dicti0nary_8Th64ikELWEsZFrf.txt > dictionary.txt`<br>
    : 足すのを忘れないよう。

- 辞書攻撃しろということらしい。
    - ユーザ名:$6$(salt)$(password)... の構成になってる。
    - salt を単語の前につけて base64 encode してHitしたものを探せばいいのかな。
    - と思ったがうまくいかず。末尾の == は要らないとか。

- crypt モジュールを使うと一発でパスワード文字列が出てくる。
    - がなぜかとっても重くてこれも断念。
- John the ripper を使うと一発。
    - `john --wordlist=dictionary.txt shadow.txt` <br>
      サイトによっては、dictionary==dictionary.txt と書いてあり= が1個余計なことに注意。
    - `john --show passwd_shadow` <br>

### Q28 LowTechCipher

- zipファイルひとつ。
    - zipファイルを解凍すると2個のpngが出てくる。
      とりあえず重ねると、"The last sha is hidden in the zip" と掛かれている。
      上半分はただのごみ。

- zipファイルのフォーマット
    -  <a href = "https://ja.wikipedia.org/wiki/ZIP_(%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%95%E3%82%A9%E3%83%BC%E3%83%9E%E3%83%83%E3%83%88)">wikipedia</a>
    - 末尾にある「セントラルディレクトリ」にファイル情報が格納されている。
      ファイルの実体は先頭から。<br>
      先頭からは解釈できない構造らしい。

- バイナリで眺める。
    - セントラルディレクトリには各ファイルの zip ファイル先頭からのオフセット、ファイル名などんが
        格納されている。
    - エントリが2個あり解凍されたファイルと対応する。
        ひとつは 0x00017418、もうひとつは 0x0002E134。
        オフセットをながめるとそれぞれ .png ファイルのフォーマットになっている。
    - ファイルの先頭付近は png ファイルのフォーマットなのだが、このエントリがない。

- あと1個を取り出す。
    - セントラルディレクトリを書き換えてオフセットを 0x00000000 にしてみたが、
        7-zipは解凍してくれなかった。
    - 単にバイナリを切り出せばいいので、python でソースを書いて切り出した。
        取り出したら、そりゃ重ねますよねー。
    - <img src = "../Q28_LowTechCipher/secret/answer.gif"></img>


    
        
