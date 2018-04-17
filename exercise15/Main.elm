module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput)


type alias Fruit =
    { name : String, count : Int }


type alias Model =
    { fruits : List Fruit
    , userFruitNameInput : String
    , userFruitCountInput : String
    }


type Msg
    = StoreNewFruit
    | UserFruitNameInput String
    | UserFruitCountInput String


initialModel : Model
initialModel =
    { fruits = [ { name = "Apple", count = 5 }, { name = "Banana", count = 4 } ]
    , userFruitNameInput = ""
    , userFruitCountInput = "0"
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserFruitNameInput newValue ->
            ({ model | userFruitNameInput = newValue })

        UserFruitCountInput newValue ->
            ({ model | userFruitCountInput = newValue })

        StoreNewFruit ->
            -- EXERCISE: can you make this add a fruit to the fruits list?
            -- you will need to parse the userFruitCountInput to an integer
            -- and then create a new fruit to add to model.fruits
            model


renderFruit : Fruit -> Html Msg
renderFruit fruit =
    li []
        [ text <| "Fruit: " ++ fruit.name
        , text <| ", Count: " ++ toString (fruit.count)
        ]


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "FruitCounterApp" ]
        , ul [] (List.map renderFruit model.fruits)
        , form []
            [ button [ onClick StoreNewFruit ]
                [ text "Save Fruit" ]
            , input
                [ type_ "number"
                , onInput UserFruitCountInput
                , value model.userFruitCountInput
                ]
                []
            , input
                [ type_ "text"
                , onInput UserFruitNameInput
                , value model.userFruitNameInput
                , placeholder "pineapple"
                ]
                []
            ]
        ]


main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
