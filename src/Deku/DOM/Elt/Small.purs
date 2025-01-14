module Deku.DOM.Elt.Small where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Small_

small
  :: forall lock payload
   . Event (Attribute Small_)
  -> Array (Domable lock payload)
  -> Domable lock payload
small attributes kids = Domable
  ( Element'
      ( DC.elementify "small" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

small_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
small_ = small empty

small__
  :: forall lock payload
   . String
  -> Domable lock payload
small__ t = small_ [ DC.text_ t ]
