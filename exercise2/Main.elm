module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


pluralize singular plural number =
    if number == 1 then
        singular
    else
        plural


main =
    div [ class "content" ]
        [ text (pluralize "apple" "apples" 5)
        ]
