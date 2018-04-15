module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


pluralize singular plural number =
    if number == 1 then
        singular
    else
        plural


main =
    -- EXERCISE: can you add a heading to this page?
    div [ class "content" ]
        [ text (pluralize "apple" "apples" 5)
        ]
