module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    }


type Msg
    = Increment
    | IncrementBy Int
    | Decrement


initialModel : Model
initialModel =
    { count = 0 }



-- EXERCISE: can you add DecrementBy ?
-- EXERCISE: now we have IncrementBy and DecrementBy, we don't need Increment and Decrement
-- can you update the code to use just IncrementBy and DecrementBy?


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        IncrementBy x ->
            { model | count = model.count + x }


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Click to increment" ]
        , div []
            [ button [ onClick Increment ]
                [ text "Increment" ]
            , button [ onClick Decrement ] [ text "Decrement" ]
            , button [ onClick (IncrementBy 5) ] [ text "Increment by 5" ]
            , text (toString model.count)
            ]
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
