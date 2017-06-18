module App exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Events exposing (onClick)



{- MODEL
-}
type alias Model =
    Int

init : ( Model, Cmd Msg )
init =
     ( 0, Cmd.none )



{- MESSAGES
 note how the Increment message requires an integer
-}
type Msg
    = Increment Int
    | Decrement Int


{- VIEW
 in the view we trigger the message "Increment" with a payload "2"
-}
view : Model -> Html Msg
view model =
    div []
        [ button [ onClick (Increment 1) ] [ text "+" ]
          , text (toString model)
          , button [ onClick (Decrement 1) ] [ text "-" ]    
        ]

{- UPDATE
 the payload is extracted using the pattern matching:

 Increment 2 = Increment howMuch

Wow !
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
       case msg of
           Increment howMuch ->
               ( model + howMuch, Cmd.none)
           Decrement howMuch ->
               ( model - howMuch, Cmd.none)                   

{- SUBSCRIPTIONS
 * subscriptions listen for external inputs to the app
 * external inputs examples:
    - mouse movement
    - keyboard events
-}
subscriptions : Model -> Sub Msg
subscriptions model =
              Sub.none

{- MAIN
 -}
main : Program Never Model Msg
main =
     program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
