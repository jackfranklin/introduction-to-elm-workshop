module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value, placeholder)
import Html.Events exposing (onClick, onInput, onSubmit)


type alias Fruit =
    { name : String, count : Int }


type alias Model =
    { fruits : List Fruit
    , userFruitNameInput : String
    , userFruitCountInput : String
    , fruitSorting : FruitSorting
    }


type FruitSorting
    = CountAsc
    | CountDesc


type Msg
    = StoreNewFruit
    | SortFruit FruitSorting
    | UserFruitNameInput String
    | UserFruitCountInput String


initialModel : Model
initialModel =
    { fruits = [ { name = "Apple", count = 5 }, { name = "Banana", count = 4 } ]
    , userFruitNameInput = ""
    , userFruitCountInput = "0"
    , fruitSorting = CountAsc
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserFruitNameInput newValue ->
            ({ model | userFruitNameInput = newValue })

        UserFruitCountInput newValue ->
            ({ model | userFruitCountInput = newValue })

        StoreNewFruit ->
            let
                newCount =
                    String.toInt model.userFruitCountInput |> Result.withDefault 0

                newFruit =
                    { name = model.userFruitNameInput, count = newCount }
            in
                { model
                    | fruits = newFruit :: model.fruits
                    , userFruitNameInput = ""
                    , userFruitCountInput = "0"
                }

        SortFruit sortType ->
            { model | fruitSorting = sortType }


renderFruit : Fruit -> Html Msg
renderFruit fruit =
    li []
        [ text <| "Fruit: " ++ fruit.name
        , text <| ", Count: " ++ toString (fruit.count)
        ]


renderFruits : List Fruit -> FruitSorting -> Html Msg
renderFruits fruits fruitSorting =
    -- EXERCISE: can you take fruitSorting into account here
    -- and order the fruits in the proper order based on the value
    -- of fruitSorting
    ul [] (List.map renderFruit fruits)


view : Model -> Html Msg
view model =
    div
        [ class "content" ]
        [ h1 [] [ text "FruitCounterApp" ]
        , div [ class "sorting" ]
            [ button [ onClick (SortFruit CountAsc) ] [ text "Count Asc" ]
            , button [ onClick (SortFruit CountDesc) ] [ text "Count Desc" ]
            ]
        , renderFruits model.fruits model.fruitSorting
        , form [ onSubmit StoreNewFruit ]
            [ button [ type_ "submit" ]
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
