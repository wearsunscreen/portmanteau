module Main exposing (main)

import Browser exposing (document)
import Model exposing (Model, Msg)
import Update exposing (subs, update)
import View exposing (view)



{- To do
   - unit tests
-}


main : Program () Model Msg
main =
    Browser.document
        { init = Update.init
        , update = Update.update
        , view = View.view
        , subscriptions = Update.subs
        }
