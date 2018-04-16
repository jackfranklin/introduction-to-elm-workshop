module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Fruit =
    ( String, String )



-- EXERCISE: update the type here to use our Fruit type alias


fruits :
    { apple : ( String, String )
    , banana : ( String, String )
    , grape : ( String, String )
    }
fruits =
    { apple = ( "apple", "apples" )
    , banana = ( "banana", "bananas" )
    , grape = ( "grape", "grapes" )
    }



-- EXERCISE: rewrite pluralize here as we did in the slides to take a Fruit
-- and add a type annotation


pluralize singular plural number =
    if number == 1 then
        singular
    else
        plural


main =
    div [ class "content" ]
        [ h1 [] [ text "Lots of fruits" ]

        -- EXERCISE: update the code here to call pluralize correctly once
        -- you have rewritten it
        , text (pluralize (Tuple.first fruits.banana) (Tuple.second fruits.banana) 5)
        , hr [] []
        , text (pluralize (Tuple.first fruits.apple) (Tuple.second fruits.apple) 5)
        , hr [] []
        , text (pluralize (Tuple.first fruits.grape) (Tuple.second fruits.grape) 1)
        ]
