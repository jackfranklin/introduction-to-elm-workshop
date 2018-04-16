module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Fruit =
    ( String, String, Int )



-- EXERCISE: add another fruit or two to the list


fruits : List Fruit
fruits =
    [ ( "apple", "apples", 2 ), ( "banana", "bananas", 1 ) ]


pluralize : Fruit -> String
pluralize ( singular, plural, number ) =
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
