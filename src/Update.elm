module Update exposing (init, subs, update)

import Data exposing (nextQuestion)
import Model exposing (..)
import Random exposing (Seed, initialSeed)
import Task exposing (Task, perform)
import Time exposing (now, posixToMillis)


init : () -> ( Model, Cmd Msg )
init model =
    ( Model Nothing Nothing 0 False False False, Cmd.none )


subs : Model -> Sub Msg
subs model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseWelcomeScreen ->
            ( model, Task.perform StartApp Time.now )

        NextQuestion ->
            ( { model
                | question = nextQuestion model.question
                , showHint1 = False
                , showHint2 = False
                , showPortmanteau = False
              }
            , Cmd.none
            )

        StartApp time ->
            ( { model
                | startTime = Just time
                , randomSeed = Just (initialSeed (posixToMillis time))
              }
            , Cmd.none
            )

        ToggleHint1 ->
            ( { model
                | showHint1 = not model.showHint1
              }
            , Cmd.none
            )

        ToggleHint2 ->
            ( { model
                | showHint2 = not model.showHint2
              }
            , Cmd.none
            )

        TogglePortmanteau ->
            ( { model
                | showPortmanteau = not model.showPortmanteau
              }
            , Cmd.none
            )
