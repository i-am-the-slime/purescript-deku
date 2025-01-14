module Deku.DOM.Elt.Tt where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tt_

tt
  :: forall lock payload
   . Event (Attribute Tt_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tt attributes kids = Domable
  ( Element'
      ( DC.elementify "tt" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tt_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tt_ = tt empty

tt__
  :: forall lock payload
   . String
  -> Domable lock payload
tt__ t = tt_ [ DC.text_ t ]
