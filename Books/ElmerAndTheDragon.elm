module Books.ElmerAndTheDragon exposing (..)

pages : List String 
pages = [
    """
# プログラミング言語Elm へのご招待
"""


   , """
# Elm とは?

Elm は、ブラウザアプリケーションを生成するためのDSL + アプリケーションフレームワーク

* AltJS の一つ

<img src="altjss.png" />

* JS のエコシステムなぞ知らぬ！既存のJSプログラマになぞ媚びぬ！後方互換性？なにそれ、おいしいの？ ――という漢の言語
   * FRP をあっさり捨ててみたり
* しかし、いろいろな フレームワークから 参考にされまくっているナウイやつでもある
    * まだ 0.18 なのに
    * Smalltalk のようだ
"""


   , """
# Elm の特徴

```
Elm 
   =  関数プログラミング言語
   ∧ 強い静的型付け
   ∧ ビルトイン VirtualDOM
   ∧ ビルトイン Application Framework
```
(ちなみに文法は Haskellライク）

## すなわち..

Elmにすれば、<span style="font-size:2em;">こんなにうれしい</span>

* これひとつで全部入り！
   * 組み合わせ ∨ 環境構築地獄に落ちない！
* モダンな関数プログラミングの機能と構文が使える！
* ビルドが通れば実行時エラーが絶対に出ない！
   * 全JSプログラマが<span style="font-size:2em;">泣いた！</span>
"""


   ,"""
# Elm の特徴 - 関数プログラミング言語

Elm の（関数プログラミング言語としての）位置づけは、
だいたいこんな感じ。

```
Immutability
Pure Functionas
Pattern Matching
--------------------------^ elm
Type Classes
Monad
--------------------------^ haskell
Dependent Types
Proof
```

汎用言語を求めずに、DSL として必要な最低限なラインはここだ！という判断で、 **スマートな体型を維持**

（バージョンが進むにつれて、「これいらないよね」となると、どんどん削除されていく...。
だから後方互換は...(T△T)
"""

   ,"""
# Elm の特徴 - 全部入り!

|              |React                |Elm  |
|--------------|---------------------|-----|
|Virtual DOM   |React                |OK!  |
|Data Flow     |Redux + middlewares  |OK!  |
|Immutablility |Imutable.js          |OK!  |
|Statyc Types  |Flow or TypeScript   |OK!  |
|Compile       |Babel                |OK!  |

全部 Elm だけでOKです。

<div style="text-align:center"><img src="mouzenbu.jpg" /></div>

（そもそも、他のJSライブラリと組み合わせても、型の安全が崩壊するだけ...)
"""


   ,"""
<span style="font-size:5em"> Elm の 言語仕様 </span>
"""


   ,"""
# Elm の言語仕様

* Haskell ライク
* じゃあ、Haskell との差分がわかればOKだよね？
"""

   ,"""
# Haskell から見た Elm

## だいじなちがい(R.Bird 先生的に)

* 正格評価

> つまり, 正格評価のもとでは, 効率の点からプログラムの定義は, 多くの場合, 明示的再帰を用いたものにならざるをえないということである. そうなると, 単純な標準関数から定義を組み立てることができなくなり, 部品となる関数が持つ法則を適用するという方法では論証ができないことになる.
(TFwH 2.10 章末ノートより)
"""


   ,"""
# Haskell から見た Elm

## ないす な しんたっくす

* 型注釈は `:` ,  cons `::` でちょうど逆 <span style="font-size:0.8em; color:#999;">ooO(よく使う方を短くしよう！）</span>

* 代数的データ型は `type`構文、型の別名（レコード）は `type arieas` 構文 <span style="font-size:0.8em; color:#999;">ooO(data キーワードはわかりにくいよね..)</span>

* `$` は `<|` , その逆は `|>` 

* 関数合成は `>>` または `<<`

* らむだは `\\` だけじゃなく、`λ` とも書ける <span style="font-size:0.8em; color:#999;">ooO(アスキーにこだわって可読性を落とすことないよね)</span>
"""


   , """
# Haskell から見た Elm

## いろいろたりない

* do記法がない、型クラスがない、モナドがない
* where 構文がない（letでがんばれ！）
* 関数を並べるタイプのパターンマッチ構文がない (case of でがんばれ！）
* List の `head` と `tail` は Maybe を返す（だって、正格評価だもん）
* List 内包表記がない
"""


   , """
# 型クラスはないけれど...

`number`, `comparable`, `appendable` という多相な型が内部にあったりする

* number .. Int Float
* comparable .. String, Char, Int, Float, Time, taple
* appendable .. List String

```
(+)  : number -> number -> number
(<)  : comparable -> comparable -> comparable
(++) : appendable -> appendable -> appendable
```
"""

   ,"""
<span style="font-size:5em"> Elm の アプリケーションフレームワーク</span>
"""

   ,"""
# The Elm Architecture

Elm は immutable で、副作用をおおむね持たない言語なので、
状態を持ったアプリケーションをつくるには The Elm Architecture を必要とします。

The Elm Architecture は、状態遷移モデル でアプリケーションをつくるフレームワーク
（KML でおなじみですね！)
"""


  , """
# The Elm Architecture のオーバービュー

2つの型と4つの関数を定義します

## 型

* Model .. アプリケーションの状態
* Msg   .. アプリケーションで発生するすべてのイベントの直和

## 関数

* `init : (Model, Cmd Msg)` .. モデルを初期化
* `update : Model -> (Model, Cmd Msg)` .. イベントを受けてモデルを更新
* `view: Model -> Html Msg` .. モデルをHTMLにレンダリング
* `subscriptions : Model -> Sub Msg` ..外部とのやり取り(ex. AJAX, ポーリング)
"""


   ,"""
<span style="font-size:5em">実際に作ってみよう！</span>
"""

   ,"""
# module, import

実は、このプレゼンアプリはElmでちゃちゃっとでっち上げてます。
このコードを読んでみよう

```
module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Markdown

import Books.ElmerAndTheDragon -- プレゼンテーションの中身
```

* `module` で モジュール宣言
* import で 必要なモジュールをインポートします
    * `exposing (foo, bar, buz)` でこのモジュールに名前を取り込み
    * 取り込まなくても `ModuleName.foo` で参照できます
    * `exposing (..)` で全部取り込み
"""


   , """
# main 関数と Html.program
```
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
```

main は Elm のエントリーポイントです。main 関数の型は 画面を表現する Svg型やHtml型か、Program型 のいずれかなっています。
Html型などは静的な画面になります。いわゆるアプリケーションを作る場合、Program型をつくります。


The Elm Architecture には、非同期について考慮しない純粋な状態遷移モデルである `Html.beginnerProgram` と、
非同期を取り扱うことが出来る `Html.program` があります。違いは以下の２つ

* `update`関数 の型が `Msg -> Model -> Model` か `Msg -> Model -> (Model, Cmd Msg)`
* `subscriptons : subscriptions : Model -> Sub Msg` の有無

note: JavaScript 側から Elm の初期値を渡せる、`Html.programWithFlags` というのもあります。
"""


   ,"""
# Model, init
```
type alias Model =
    { pages : List String
    , pageNum : Int
    }
```

```
init : (Model, Cmd Msg)
init =
    ( { pages = Books.ElmerAndTheDragon.pages
      , pageNum = 0}
    , Cmd.none
    )
```

作るアプリケーションの状態の定義(Model)と、初期化関数(init)を定義します。

init は、モデルだけでなく、`Model` と `Cmd Msg` のタプルを返す必要があります。
非同期な作業を何もしない場合は、`Cmd.none` を返しておきましょう。

"""


   , """
# Msg

```
type Msg
    = Next
    | Prev
```
Msg （メッセージ）は、アプリケーションで起こりうるすべてのイベントの直和型です。

今回の例では使っていませんが、Msg にはたとえば、

```
type Msg = InputFullName (List String)
         | InputEMail String
         | Accept
```

のようなかんじでペイロードを持たせることが出来ます。
"""


   , """
# update, Cmd

```
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Next ->
            ( { model | pageNum = model.pageNum + 1 }
            , Cmd.none
            )
        Prev ->
            ( { model | pageNum = model.pageNum - 1 }
            , Cmd.none
            )
```

update 関数はMsgに対するcase式として実装します。
Msgと現在のModelを受け取って、新しいModelを生成し、それと非同期コマンドのタプルを返すように実装します。

Cmd はコマンド..外に出す命令という意味です。たとえば、画面ボタンのクリックをトリガーに、Http で REST リクエストを送ったり、JavaScript側に要求を送ったりする場合に使います。
Cmdの実行結果はMsg型になって アプリケーションに帰ってくるので、Cmd 型をつくる関数は、Msg型のデータコンストラクタを取るようになっています。
"""


   ,"""
# view
```
view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ div [ class "presentation"]
              [ case model.pages !! model.pageNum of
                    Nothing -> div [class "md"] [text ""]
                    Just md -> Markdown.toHtmlWith markdownOptions [class "md"] md
              , div [ class "footer" ] [ text <| toString model.pageNum ]
              ]
        , div [ class "controll" ]
              [ div [class "ctrl", onClick Prev] []
              , div [style [("width","100%")] ] []
              , div [class "ctrl", onClick Next] []
              ]
        ]
```

view は、Model を受け取り HTML を生成する関数です。update関数により Model が更新されると、
view により新しい HTMLを生成します

クリックや入力などのイベントを受けて Msg を発するため、Html Msg 型になっています。
"""

   ,"""
# subscriptions と おまけ

```
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
```

Subは外から非同期にやってくるイベントを表します。WebSockets や、マウス・キーボードイベント、時間割り込みなどです。

"""

   ,"""
# (ヘルパー関数)

```
(!!) : List a -> Int ->  Maybe a
(!!) xs n  =
    if n < 0 then Nothing else
    case List.drop n xs of
        []      -> Nothing
        y :: ys -> Just y

markdownOptions: Markdown.Options
markdownOptions =
  { githubFlavored = Just { tables = True, breaks = True }
  , defaultHighlighting = Nothing
  , sanitize = False
  , smartypants = False
  }
```

実は `!!` ないので... (T△T)
<span style="font-size:0.8em">(KSLのリストサポートにインデックスアクセスなんていらなかったんだよ！)</span>

"""


   , """
# まとめ

* Elm は関数プログラミングの入門に最適！
    * モナドも型クラスもないんだよ！
* ブラウザアプリを作るのは本当に楽
    * 実行時エラーがでない有り難み
    * 実行時エラーがでない有り難み
    * 実行時エラーがでない有り難み
* 結論: Elm はいいぞ！
"""
{--
   ,"""
<span style="font-size:3em">Appendex</span>
"""

   ,"""
# JavaScript 世界とのやり取り

|     Elm        | JavaScript  |
|----------------|-------------|
| Bool           | Bool        |
| String         | String      |
| Int Float      | Number      |
| List           | array       |
| Arrays         | array       |
| Tuples         | array       |
| Records        | object      |
| Maybe (Nothing)| null        |
| Maybe (Just 42)| 42          |

"""
--}
   ,"""
       <span style="font-size:8em;">ご清聴ありがとうございました</span>
"""
   ]
