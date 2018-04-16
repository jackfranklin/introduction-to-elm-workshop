module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- EXERCISE: add type annotations for fruits and pluralize


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


pluralize singular plural number =
    if number == 1 then
        singular
    else
        plural


main =
    div [ class "content" ]
        [ h1 [] [ text "Lots of fruits" ]
        , text (pluralize (Tuple.first fruits.banana) (Tuple.second fruits.banana) 5)
        , hr [] []
        , text (pluralize (Tuple.first fruits.apple) (Tuple.second fruits.apple) 5)
        , hr [] []
        , text (pluralize (Tuple.first fruits.grape) (Tuple.second fruits.grape) 1)
        ]
