module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Markdown
import Keyboard exposing (..)
import Time exposing (Time, second)


import Books.ElmerAndTheDragon -- プレゼンテーションの中身
import Books.CppWay1z -- プレゼンテーションの中身

main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

init : (Model, Cmd Msg)
init =
    ( { books = [ { title = "エルマーのぼうけん", pages = Books.ElmerAndTheDragon.pages }
                , { title = "クララ外伝Z"       , pages = Books.CppWay1z.pages }
                ]
      , pages = []
      , pageNum = -1
      , stopWatch = { finishTime = 0,  currentTime = 0 }
      }
    , Cmd.none
    )


------------------------------------------------------------
-- MODEL
------------------------------------------------------------

type alias Model =
    { books : List Book
    , pages : List String
    , pageNum : Int
    , stopWatch : StopWatch
    }

type alias Book =
    { title : String
    , pages : List String
    }
    

type alias StopWatch =
    { finishTime : Time
    , currentTime : Time
    }


------------------------------------------------------------
-- UPDATE
------------------------------------------------------------

type Msg
    = OpenBook (List String)
    | Next
    | Prev
    | Tick Time
    | KeyDown Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        OpenBook pages ->
            ( let sw = model.stopWatch in
              { model | pages = pages, pageNum = 0, stopWatch ={sw|finishTime= sw.currentTime + 15 * Time.minute}}
            , Cmd.none
            )
        Next ->
            ( { model | pageNum = model.pageNum + 1 }
            , Cmd.none
            )
        Prev ->
            ( { model | pageNum = model.pageNum - 1 }
            , Cmd.none
            )
        Tick time ->
            ( let sw = model.stopWatch in { model | stopWatch = {sw| currentTime = time} }
            , Cmd.none
            )
        KeyDown code ->
            case code of
                37 -> ( { model | pageNum = model.pageNum - 1 }, Cmd.none ) -- '←'
                39 -> ( { model | pageNum = model.pageNum + 1 }, Cmd.none ) -- '→'
                _  -> ( model, Cmd.none )


------------------------------------------------------------
-- VIEW
------------------------------------------------------------

view : Model -> Html Msg
view model =
    div [ class "root" ]
        [ div [ class "presentation"]
              [ case model.pages !! model.pageNum of
                    Nothing -> bookshelf model
                    Just md -> Markdown.toHtmlWith markdownOptions [class "md"] md
              , div [ class "footer" ] [ text <| showPageNum model
                                       , text <| showStopWatch model.stopWatch
                                       ]
              ]
        , div [ class "controll" ]
              [ div [class "ctrl", onClick Prev] []
              , div [style [("width","100%")] ] []
              , div [class "ctrl", onClick Next] []
              ]
        ]

bookshelf : Model -> Html Msg
bookshelf model =
    div [ class "bookshelf" ] 
        [ h1 [] [ text "おしながき" ]
        , ul []
            (List.map (λ book -> li [] [ a [onClick (OpenBook book.pages)] [ text book.title ] ] ) model.books)
        ]

showPageNum : Model -> String
showPageNum model =
    if model.pageNum < 0 then ""
    else (model.pageNum + 1 |> toString) ++ "/" ++ (List.length model.pages |> toString)

showStopWatch : StopWatch -> String
showStopWatch sw =
    let reast = sw.finishTime - sw.currentTime in
    if reast > 0 then
        let
            m = Time.inMinutes reast |> round
            s = rem (Time.inSeconds reast |> round) 60
        in
            "あと" ++ (toString m) ++ ":" ++ if s < 10 then "0" ++ (toString s) else toString s
    else
        "Timeover"

------------------------------------------------------------
-- SUBSCRIPTIONS
------------------------------------------------------------

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Time.every second Tick
              , Keyboard.downs KeyDown
              ]


------------------------------------------------------------
-- Tools
------------------------------------------------------------

(!!) : List a -> Int ->  Maybe a
(!!) xs n  =
    if n < 0 then Nothing else
    case List.drop n xs of
        []      -> Nothing
        y :: ys -> Just y


-- Markdown

markdownOptions: Markdown.Options
markdownOptions =
  { githubFlavored = Just { tables = True, breaks = True }
  , defaultHighlighting = Nothing
  , sanitize = False
  , smartypants = False
  }


