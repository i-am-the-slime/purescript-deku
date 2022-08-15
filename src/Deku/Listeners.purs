module Deku.Listeners
  ( slider
  , numeric
  , click
  , click_
  , keyUp
  , keyDown
  , keyPress
  , textInput
  , injectElement
  , injectElementT
  ) where

import Prelude

import Control.Alt (alt)
import Control.Monad.ST.Class (class MonadST)
import Data.Foldable (for_)
import Deku.Attribute (class Attr, Attribute, Cb, attr, cb, (:=))
import Deku.Core (class Korok)
import Deku.DOM as D
import Effect (Effect)
import Effect.Aff (launchAff_, delay, Milliseconds(..))
import Effect.Class (liftEffect)
import FRP.Event (AnEvent)
import Web.DOM (Element)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value, valueAsNumber)
import Web.UIEvent.KeyboardEvent (KeyboardEvent, fromEvent)

click
  :: forall event cb element
   . Functor event
  => Attr element D.OnClick cb
  => event cb
  -> event (Attribute element)
click = map (attr D.OnClick)

click_
  :: forall m event cb element
   . Functor event
  => Monoid m
  => Attr element D.OnClick cb
  => event (m -> cb)
  -> event (Attribute element)
click_ = map (attr D.OnClick <<< (_ $ mempty))

slider
  :: forall s m
   . MonadST s m
  => AnEvent m (Number -> Effect Unit)
  -> AnEvent m (Attribute D.Input_)
slider = alt (pure $ D.Xtype := "range") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

numeric
  :: forall s m
   . MonadST s m
  => AnEvent m (Number -> Effect Unit)
  -> AnEvent m (Attribute D.Input_)
numeric = alt (pure $ D.Xtype := "number") <<< map
  ( \push ->
      D.OnInput := cb \e -> for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> push)
  )

textInput
  :: forall s m e
   . MonadST s m
  => AnEvent m (String -> Effect Unit)
  -> AnEvent m (Attribute e)
textInput = map \push -> D.OnInput := cb \e -> for_
  (target e >>= fromEventTarget)
  (value >=> push)

keyEvent'
  :: forall f59 a62 e64 b66
   . Functor f59
  => Attr e64 a62 Cb
  => a62
  -> f59 (KeyboardEvent -> Effect b66)
  -> f59 (Attribute e64)
keyEvent' listener = map \f -> listener := cb \e -> for_ (fromEvent e) f

keyUp
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyUp = keyEvent' D.OnKeyup

keyDown
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyDown = keyEvent' D.OnKeydown

keyPress
  :: forall s m eleemnt
   . MonadST s m
  => AnEvent m (KeyboardEvent -> Effect Unit)
  -> AnEvent m (Attribute eleemnt)
keyPress = keyEvent' D.OnKeypress

injectElement
  :: forall e s m
   . Korok s m
  => Attr e D.Self (Element -> Effect Unit)
  => (Element -> Effect Unit)
  -> AnEvent m (Attribute e)
injectElement f = pure
  (D.Self := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))

injectElementT
  :: forall e te s m
   . Korok s m
  => Attr e D.SelfT (te -> Effect Unit)
  => (te -> Effect Unit)
  -> AnEvent m (Attribute e)
injectElementT f = pure
  (D.SelfT := \s -> launchAff_ (delay (Milliseconds 0.0) *> liftEffect (f s)))