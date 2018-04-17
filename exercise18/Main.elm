module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)
import Random


type alias Model =
    { latestNumber : Int
    }


type Msg
    = NewRandomNumber Int
    | RollDice


initialModel : Model
initialModel =
    { latestNumber = 0
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RollDice ->
            ( model, Cmd.none )

        NewRandomNumber x ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Roll the dice" ]
        , div []
            [ button [ type_ "button", onClick RollDice ]
                [ text "Roll" ]
            , text (toString model.latestNumber)
            ]
        ]


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
