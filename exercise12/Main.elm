module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { count : Int
    , userInput : String
    }


type Msg
    = Increment
    | NewUserIncrementInput String


initialModel : Model
initialModel =
    { count = 0, userInput = "0" }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            -- EXERCISE: make this so it increments by what the user has input
            -- ensuring that you deal with String.toInt and the fact that it
            -- could fail
            { model | count = model.count + 1 }

        NewUserIncrementInput newValue ->
            { model | userInput = newValue }


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Amazing counter" ]
        , div []
            [ button [ onClick Increment ]
                [ text "Increment" ]
            , input
                [ type_ "number"
                , onInput NewUserIncrementInput
                , value model.userInput
                ]
                []
            , text (toString model.count)
            ]
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
