module Deku.DOM.Elt.Polyline where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Polyline_

polyline
  :: forall lock payload
   . Event (Attribute Polyline_)
  -> Array (Domable lock payload)
  -> Domable lock payload
polyline attributes kids = Domable
  ( Element'
      ( DC.elementify "polyline" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

polyline_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
polyline_ = polyline empty

polyline__
  :: forall lock payload
   . String
  -> Domable lock payload
polyline__ t = polyline_ [ DC.text_ t ]
