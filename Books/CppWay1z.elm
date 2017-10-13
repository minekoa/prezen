module Books.CppWay1z  exposing (..)

pages : List String
pages = [
  """
# ク○○ラ外伝 3
"""


   , """
# C++ はネタ言語じゃない

いままで、クララの発表でさんざんおもしろ枠を確保してきたのですが、
それは、C++ の本当の姿ではありません。

今回強調したいのは、

<span style="font-size: 2em">C++ はとても美しくわかりやすい言語</span>

だということ

"""


   , """
# うつくしい

美しさとはなにか?

それは、<span style="font-size:5em">対称性</span>
"""


   ,"""
# わかりやすい

わかりやすさとはなにか？

それも、<span style="font-size:8em">対称性</span>
"""


   ,"""
# C++17 それは、美のリファクタリング

* 対称性は美しい
    * それを求めて、巨大な粒子加速器を作ってしまうほど..
* 対称性があれば、既存のルールをもとに新しいルールの構文や意味、振る舞いを類推することができる
    * これはしばしば <span style="font-size:2em">直感的</span> と呼ばれる
    * 「直感的」≒「わかりやすい」

しかし、長い拡張の歴史や時代的背景から美しくなりきれていないのも事実..

**C++17** はそこにメスをいれます。

"""


   , """
# C++17 それは、美のリファクタリング

C++17が目指すもの、

それは、

さらなる<span style="font-size:5em">美しさ</span>と

<span style="font-size:5em">わかりやすさ</span>

の追求。まずは ..
"""


   , """
<span style="font-size:8em">制御構文の対称性をとりもどす</span>
"""


   , """
# 制御構文の対称性をとりもどす

C++は手続きプログラミング言語なので、言語のプリミティブな構造は、構造化定理の 3要素、 **順次** **分岐** **反復** に基づいています。

そのを実現する構文、あなたはいままで不自然にに思ったことがないでしょうか？

```
if ( foo < 42 ) {
    ...
}
```

```
for ( foo = 0 ; foo < 42 ; foo++ ) {
    ...
}
```
"""


   ,"""
# 制御構文の対称性をとりもどす

あれれ？構造が違うよ？

```
for ( int foo = 0 ; foo < 42 ; foo++ ) {
//       ↑            ↑        ↑
//    初期化式    ;  条件式  ; 加算式
```

```
if ( foo < 42 ) {
//       ↑
//     条件式
```
"""


   ,"""
# 制御構文の対称性をとりもどす

<span style="font-size:8em">美しくない。</span>

```
for ( int foo = 0 ; foo < 42 ; foo++ ) {
//       ↑            ↑        ↑
//    初期化式    ;  条件式  ; 加算式
```

```
if ( foo < 42 ) {
//       ↑
//     条件式
```
"""


   ,"""
# 制御構文の対称性をとりもどす

<span style="font-size:8em">美しくした。</span>

```
for ( int foo = 0 ; foo < 42 ; foo++ ) {
//       ↑            ↑        ↑
//    初期化式    ;  条件式  ; 加算式
```

```
if ( int foo = 0 ; foo < 42 ) {
//      ↑            ↑
//   初期化式    ;  条件式
```
"""


   ,"""
# if文の初期化式

for文が `for (初期化式; 条件式; 加算式)` になっているのと同様に、if文も、条件式の前準備としての初期化式を`if (初期化式; 条件式)` のように書けるようになりました

## 何が嬉しいか

* 美しい
* 初期化式で定義した変数のスコープは、for文とおなじように if文の中に閉じられます

```
if ( int foo = 0 ; foo < 42 ) {
    cout << foo << endl;
}

cout << foo << endl;  // これはコンパイルエラー
```
"""


   ,"""   
# if文の初期化式       

たとえばこんな感じ。

```
R_STATUS pickAndGo (Position pos1, Positoin pos2, Position pos3) {

    if (auto stat = move(pos1); stat != R_SUCCESS ) { return stat; }
    if (auto stat = move(pos2); stat != R_SUCCESS ) { return stat; }
    if (auto stat = hand_on() ; stat != R_SUCCESS ) { return stat; }
    if (auto stat = move(pos1); stat != R_SUCCESS ) { return stat; }
    if (auto stat = move(pos3); stat != R_SUCCESS ) { return stat; }

    return R_SUCCESS;
}
```

こういうのを書きたかった時、stat の使い回しをしがちだったが、そこが改善されるよね。

"""


   ,"""
# switch だって忘れていませんよ

C++ は対称性を忘れないので、もちろん switch だって忘れない

```
switch ( Foo foo{arg}; auto s = foo.status() ) {
    case OK:
        foo.execProc();
        break;

    case Warn:
        log("WARN: use default arg");
        foo.execDefaultProc();
        break;

    case Err:
        log("ERROR: abort proc ");
        break;
    }
    // foo と s はここで破棄される
}
```
"""


   ,"""
# while は？

**while文？**

<span style="font-size:5em">そんなものはしらない</span>

<span stle="font-size:0.8em">(初期化式、条件式つけたら、それ、なていう for文？、というはなし）</span>
"""


   ,"""
<span style="font-size:8em">評価タイミングに対する対称性</span>
"""


   ,"""
# 評価タイミング

C++ の評価タイミング

* プリプロセス
* コンパイル
* 実行

それぞれのタイミングで、条件分岐を (`if`) ができるか考えてみよう

"""


   ,"""
# 評価タイミングとif
<table>
<tr><th style="height: 1.5em">プリプロセス時 if </th><td> `#if` </td></tr>
<tr><th style="height: 1.5em">コンパイル 時if   </th><td>       </td></tr>
<tr><th style="height: 1.5em">実行時 if         </th><td> `if`  </td></tr>
</table>

<span style="font-size:8em">美しくない。</span>
"""

   ,"""
# 評価タイミングとif
<table>
<tr><th style="height: 1.5em">プリプロセス時 if </th><td> `#if`          </td></tr>
<tr><th style="height: 1.5em">コンパイル 時if   </th><td> `if constexpr` </td></tr>
<tr><th style="height: 1.5em">実行時 if         </th><td> `if`            </td></tr>
</table>

<span style="font-size:8em">美しくした。</span>
"""

   ,"""
# if constexpr 文 とは？

```
if constexpr (condition) {
   ...
} else {
   ...
}
```

* D の `static if` のようであると説明される (D はよくわからないので、よくわからない）
* conditionはコンパイル時にコンテキスト依存のbool型への変換が起こる式。
* プリプロセス時if文と異なり、if constexpr文は条件付きコンパイルをすることはできない


if constexpr は、

* スコープをつくる
* 文である

ので、結構使い勝手が悪い。（例えばconditionに応じて型の違う変数を作り分けるとかはできない）

ようするに文の実体化を切り分ける機能と言える。
"""


   ,"""
# if constexpr 文の落とし穴

正確にif constexpr は、条件付き実体化抑制といえる。

（・・・時間切れ・・・）

"""   
   
   ,"""
<span style="font-size:8em">ちょっと知っておきたい変更</span>
"""
   ,"""
# ちょっと知っておきたい変更

## 構造化束縛

```
tuple<int, string> f(); // こういう関数があったとき

auto [a, b] = f(); // こういうことが出来る。 a は int, b は string になる
```

注意: [] は配列を意味しないよ！
（例によって腐臭がする文法..ゲフンゲフン）

```
int ar[] = {3, 1, 4};
auto [a, b, c] = ar;    // 配列の分解 ※要素数が一致しない場合はコンパイルエラー!
```

```
struct Rect { int top; int left; int width; int height; };
Rect f();

auto [t, l, w, h] = f(); // public で非static なメンバを持つオブジェクトの分解
```
"""

   ,"""
# ちょっと知っておきたい変更

## lambda 式の this

C++ の lambda式は、環境変数のキャプチャーモードが指定できる（というかGCないので指定する必要がある）

```
[=] () {}   // コピーキャプチャー
[&] () {}   // 参照キャプチャー
```

しかし、lambda 式で、メンバ変数をコピーキャプチャーしたつもりでも、じつは this の参照キャプチャーになっていたりする。

```
HogeClass::get_callback_fun() {
    return [=foo]() { return foo + 1; }  // foo がメンバ変数の場合、キャプチャーされるのはthis の参照であり、すごく危険
}
```

また
```
[this] () {}  // thisポインターのコピー ...orz
[=this] () {} // これもthisポインターのコピー ......orz
```

これを回避するために C++11 ではジェネリックラムダなんかが追加されたけど、C++17ではさらなる抜本てきな改革に踏み切った
"""


   ,"""
# ちょっと知っておきたい変更 - lambda 式の this

this のコピーキャプチャーが追加されました

```
[*this] () {}
```

キャプチャーモードで使ってなかった `*` を使った **Good アイデア！**
(実体参照演算子だと思えば.. まぁ)

## 注意点

ちなみに、this をコピーすると const になるため、非 const メンバ関数を呼ぶことが出来ないのに注意してください。

回避策として lambda に mutable をつける方法がある

```
[*this] () mutable { non_const_method(); }
```

この場合、元のオブジェクトに副作用が及ぶのだが(！) 、当然 破棄されているとしぬので注意。
"""


   ,"""
# ちょっと知っておきたい変更

## 関数の型に例外仕様が含まれるようにする

`noexcept` が `const` のようになりました。

```
void f() noexcept;
void g();

void(*pf_n)() noexcept = f;   // OK
void(*pf_e)()          = f;   // OK, noexcept -> 非noexcept は変換可能
void(*pg_e)()          = g;   // OK
void(*pg_n)() noexcept = g;   // NG (コンパイルエラー)
```
"""


   ,"""
<span style="font-size:8em">どうでもいい機能</span>
"""


   , """
# どうでもいい機能

## UTF-8文字リテラル

これまでは、UTF-8 **文字列** リテラルはあった。今回文字もできるようになった

```
char a = u8'A';
```

でもこれはだめ。

```
char a = u8'あ'; // NG
```

なぜなら char じゃないから (UTF-8 で3byte必要になる)。Uつまり ASCII の範囲しかつかえない。

ooO(全然使えない子に思える)


## 16進数浮動小数リテラル

```
std::cout << 0xABCp-3f << std::endl; // 343.5
```

ooO(うれしさがあまりわからない)
"""


   ,"""
# どうでもいい機能

## 名前空間のネスト

```
namepsace A {
    namespace B {
        namespace C {
            // ...
        }
    }
}
```

が

```
namespace A::B::C {
// ...
}
```

と書ける
"""

   ,"""
# まとめ

* さすがにネタ切れでした。
* C++ の 構文の隙間を針の先ほども逃さずみつけ、すかさずそこに突っ込む姿勢には感動します

<img src="tts.png" />

"""

   , """
<span style="font-size:8em">ご清聴、ありがとうございました</span>
"""
   ]
