module Deku.DOM.Elt.AnimateMotion where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data AnimateMotion_

animateMotion
  :: forall lock payload
   . Event (Attribute AnimateMotion_)
  -> Array (Domable lock payload)
  -> Domable lock payload
animateMotion attributes kids = Domable
  ( Element'
      ( elementify "animateMotion" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

animateMotion_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
animateMotion_ = animateMotion empty