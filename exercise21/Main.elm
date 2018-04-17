module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)
import Json.Decode as JD
import Http


type alias Person =
    { name : String
    , publicRepoCount : Int
    }


type alias Model =
    { person : Maybe Person
    }


type Msg
    = FetchPerson
    | GotPerson (Result Http.Error Person)


nameDecoder : JD.Decoder String
nameDecoder =
    JD.field "name" JD.string


repoCountDecoder : JD.Decoder Int
repoCountDecoder =
    JD.field "public_repos" JD.int


personDecoder : JD.Decoder Person
personDecoder =
    JD.map2 Person nameDecoder repoCountDecoder


initialModel : Model
initialModel =
    { person = Nothing
    }


fetchPerson : Cmd Msg
fetchPerson =
    let
        url =
            "http://github-proxy-api.herokuapp.com/users/jackfranklin"

        -- EXERCISE: create a request here by calling Http.get with the right arguments
        -- request = ...
    in
        --  EXERCISE: use Http.send here to take the request you just created and send it to the Elm runtime.
        -- Http.send ...
        Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchPerson ->
            ( model, fetchPerson )

        GotPerson (Ok person) ->
            ( { model | person = Just person }, Cmd.none )

        GotPerson (Err text) ->
            let
                _ =
                    Debug.log "Got decoding error" text
            in
                ( model, Cmd.none )


viewPerson : Maybe Person -> Html Msg
viewPerson maybePerson =
    case maybePerson of
        Just person ->
            text ("You have parsed the person!" ++ (toString person))

        Nothing ->
            text "No person fetched"


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "Roll the dice" ]
        , div []
            [ button [ type_ "button", onClick FetchPerson ]
                [ text "Parse the person" ]
            , viewPerson model.person
            ]
        ]


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
