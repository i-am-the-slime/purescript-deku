module Deku.DOM.Elt.Frame where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Frame_

frame
  :: forall lock payload
   . Event (Attribute Frame_)
  -> Array (Domable lock payload)
  -> Domable lock payload
frame attributes kids = Domable
  ( Element'
      ( DC.elementify "frame" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

frame_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
frame_ = frame empty

frame__
  :: forall lock payload
   . String
  -> Domable lock payload
frame__ t = frame_ [ DC.text_ t ]
