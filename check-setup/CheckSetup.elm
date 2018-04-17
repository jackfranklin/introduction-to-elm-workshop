module Main exposing (..)

{-| THIS FILE IS NOT PART OF THE WORKSHOP! It is only to verify that you
have everything set up properly.
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode exposing (Decoder)


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , update = update
        , init = ( initialModel, searchFeed )
        , subscriptions = \_ -> Sub.none
        }


initialModel : Model
initialModel =
    { status = "Verifying setup..."
    }


type alias Model =
    { status : String }


searchFeed : Cmd Msg
searchFeed =
    let
        url =
            "http://github-proxy-api.herokuapp.com/users/jackfranklin"
    in
    Http.get url (Json.Decode.succeed ())
        |> Http.send Response


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ header [] [ h1 [] [ text "Elm Workshop" ] ]
        , div
            [ style
                [ ( "font-size", "48px" )
                , ( "text-align", "center" )
                , ( "padding", "48px" )
                ]
            ]
            [ text model.status ]
        ]


type Msg
    = Response (Result Http.Error ())


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Response (Ok ()) ->
            ( { status = "You're all set!" }, Cmd.none )

        Response (Err err) ->
            let
                status =
                    case err of
                        Http.Timeout ->
                            "Timed out trying to contact GitHub. Check your Internet connection?"

                        Http.NetworkError ->
                            "Network error. Check your Internet connection?"

                        Http.BadUrl url ->
                            "Invalid test URL: " ++ url

                        Http.BadPayload msg _ ->
                            "Something is misconfigured: " ++ msg

                        Http.BadStatus { status } ->
                            "GitHub's Search API returned an error: "
                                ++ toString status.code
                                ++ " "
                                ++ status.message
            in
            ( { status = status }, Cmd.none )
