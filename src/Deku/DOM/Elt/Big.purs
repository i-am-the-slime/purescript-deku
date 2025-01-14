module Deku.DOM.Elt.Big where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Big_

big
  :: forall lock payload
   . Event (Attribute Big_)
  -> Array (Domable lock payload)
  -> Domable lock payload
big attributes kids = Domable
  ( Element'
      ( DC.elementify "big" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

big_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
big_ = big empty

big__
  :: forall lock payload
   . String
  -> Domable lock payload
big__ t = big_ [ DC.text_ t ]
