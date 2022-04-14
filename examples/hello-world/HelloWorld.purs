module Deku.Example.HelloWorld where

import Prelude

import Control.Plus (empty)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (deku, flatten)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, create, filterMap, keepLatest, mapAccum, subscribe)
import FRP.Event.Class (bang)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)
scene
  :: (Boolean -> Effect Unit)
  -> Event Boolean
  -> Element Event (FFIDOMSnapshot -> Effect Unit)
scene push event =
  flatten
    [ D.div empty [ C.text (bang "Stops after 3 clicks") ]
    , C.text (event <#> if _ then "click " else "kcilc ")
    , D.button
        ( counter event
            # filterMap
              (\(Tuple x y) -> if y < 4 then Just x else Nothing)
            # map
              ( \e ->
                  oneOfMap bang
                    [ D.Style := "background-color: rgb(160,234,203);"
                    , D.OnClick := cb (const $ push (not e))
                    ]

              )
            # keepLatest
        )
        [ C.text_ "me" ]
    ]

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push true