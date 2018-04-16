module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    }


type Msg
    = Increment
    | Decrement


initialModel : Model
initialModel =
    { count = 0 }



-- EXERCISE: fix the compiler error by dealing with the Decrement message
-- EXERCISE: can you add a "Reset" message and button that sets the count back to 0?


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Click to increment" ]
        , div []
            [ button [ onClick Increment ]
                [ text "Increment" ]
            , button [ onClick Decrement ] [ text "Decrement" ]
            , text (toString model.count)
            ]
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
