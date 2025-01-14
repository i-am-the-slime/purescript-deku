module Deku.DOM.Elt.Meter where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Meter_

meter
  :: forall lock payload
   . Event (Attribute Meter_)
  -> Array (Domable lock payload)
  -> Domable lock payload
meter attributes kids = Domable
  ( Element'
      ( DC.elementify "meter" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

meter_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
meter_ = meter empty

meter__
  :: forall lock payload
   . String
  -> Domable lock payload
meter__ t = meter_ [ DC.text_ t ]
