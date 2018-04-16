module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model =
    { count : Int
    }


initialModel : Model
initialModel =
    { count = 0 }



-- EXERCISE: can you add another button that decrements the count by 1?


update : String -> Model -> Model
update msg model =
    if msg == "INCREMENT" then
        { model | count = model.count + 1 }
    else
        model


view : Model -> Html String
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Click to increment" ]
        , div []
            [ button [ onClick "INCREMENT" ]
                [ text "Increment" ]
            , text (toString model.count)
            ]
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
