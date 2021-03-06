module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


-- EXERCISE: add type annotations to pluralize
-- and fix the compiler error that you get when you run this app


pluralize singular plural number =
    if number == 1 then
        singular
    else
        plural


main =
    div [ class "content" ]
        [ h1 [] [ text "best workshop ever" ]
        , text (pluralize "apple" "apples" "woops")
        ]
