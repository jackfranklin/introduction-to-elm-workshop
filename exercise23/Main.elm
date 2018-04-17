module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)
import Json.Decode as JD
import Json.Decode.Pipeline as JP


personJson : String
personJson =
    """
{ "name": "Jack", "age": 25 }
"""


type alias Person =
    { name : String
    , age : Int
    }


type alias Model =
    { person : Maybe (Result String Person)
    }


type Msg
    = ParsePerson



-- EXERCISE: implement this decoder using the pipeline decoding library


personDecoder : JD.Decoder Person
personDecoder =
    JD.fail "Can you write this using pipelines?"


initialModel : Model
initialModel =
    { person = Nothing
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ParsePerson ->
            let
                resultOfParsing =
                    JD.decodeString personDecoder personJson
            in
                ( { model | person = Just resultOfParsing }, Cmd.none )


viewPerson : Maybe (Result String Person) -> Html Msg
viewPerson maybePerson =
    case maybePerson of
        Nothing ->
            text "You have not parsed the person data yet"

        Just result ->
            case result of
                Ok person ->
                    text ("You have parsed the person!" ++ (toString person))

                Err errText ->
                    text ("There was an error: " ++ errText)


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Parse the person" ]
        , div []
            [ button [ type_ "button", onClick ParsePerson ]
                [ text "Parse the person" ]
            , viewPerson model.person
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
