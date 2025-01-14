module Deku.DOM.Elt.FePointLight where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FePointLight_

fePointLight
  :: forall lock payload
   . Event (Attribute FePointLight_)
  -> Array (Domable lock payload)
  -> Domable lock payload
fePointLight attributes kids = Domable
  ( Element'
      ( DC.elementify "fePointLight" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

fePointLight_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
fePointLight_ = fePointLight empty

fePointLight__
  :: forall lock payload
   . String
  -> Domable lock payload
fePointLight__ t = fePointLight_ [ DC.text_ t ]
