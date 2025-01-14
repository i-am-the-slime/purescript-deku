module Deku.DOM.Elt.Basefont where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Basefont_

basefont
  :: forall lock payload
   . Event (Attribute Basefont_)
  -> Array (Domable lock payload)
  -> Domable lock payload
basefont attributes kids = Domable
  ( Element'
      ( DC.elementify "basefont" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

basefont_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
basefont_ = basefont empty

basefont__
  :: forall lock payload
   . String
  -> Domable lock payload
basefont__ t = basefont_ [ DC.text_ t ]
