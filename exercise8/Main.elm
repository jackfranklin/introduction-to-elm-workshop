module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)


type alias Fruit =
    { singular : String
    , plural : String
    , number : Int
    }


type alias Model =
    { fruits : List Fruit
    }


fruits : List Fruit
fruits =
    [ { singular = "apple", plural = "apples", number = 4 }
    , { singular = "banana", plural = "bananas", number = 1 }
    ]


initialModel : Model
initialModel =
    { fruits = fruits }


pluralize : Fruit -> String
pluralize { singular, plural, number } =
    if number == 1 then
        singular
    else
        plural


update : a -> Model -> Model
update msg model =
    model


renderFruit : Fruit -> Html a
renderFruit fruit =
    text (pluralize fruit)


view : Model -> Html a
view model =
    -- EXERCISE: update this function so it renders the fruit using pluralize
    div
        [ class "content" ]
        [ h1 [] [ text "Lots of fruits" ]
        , div [] (List.map renderFruit [])
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
