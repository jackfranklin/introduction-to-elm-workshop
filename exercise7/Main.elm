module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Fruit =
    { singular : String
    , plural : String
    , number : Int
    }


fruits : List Fruit
fruits =
    [ { singular = "apple", plural = "apples", number = 4 }
    , { singular = "banana", plural = "bananas", number = 1 }
    ]


pluralize : Fruit -> String
pluralize { singular, plural, number } =
    if number == 1 then
        singular
    else
        plural


renderFruit : Fruit -> Html a
renderFruit fruit =
    -- EXERCISE: update this function so it renders the fruit using pluralize
    text ""


main =
    div [ class "content" ]
        [ h1 [] [ text "Lots of fruits" ]
        , div [] (List.map renderFruit fruits)
        ]
