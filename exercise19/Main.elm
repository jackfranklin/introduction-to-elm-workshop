module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)
import Random


type alias Model =
    { latestNumber : Maybe Int
    }


type Msg
    = NewRandomNumber Int
    | RollDice


initialModel : Model
initialModel =
    { latestNumber = Nothing
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RollDice ->
            ( model, Random.generate NewRandomNumber (Random.int 1 6) )

        NewRandomNumber x ->
            -- EXERCISE: put the new random number into the latestNumber in the model, remembering that it needs to be a Maybe Int type
            ( model, Cmd.none )


viewNumber : Maybe Int -> Html Msg
viewNumber latestNumber =
    -- EXERCISE: output the actual number here, if we have one
    -- or just a blank string if we don't
    text "put the number here, or blank if it's Nothing"


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Roll the dice" ]
        , div []
            [ button [ type_ "button", onClick RollDice ]
                [ text "Roll" ]
            , viewNumber model.latestNumber
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
