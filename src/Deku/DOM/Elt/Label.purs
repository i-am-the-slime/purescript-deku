module Deku.DOM.Elt.Label where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Label_

label
  :: forall lock payload
   . Event (Attribute Label_)
  -> Array (Domable lock payload)
  -> Domable lock payload
label attributes kids = Domable
  ( Element'
      ( DC.elementify "label" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

label_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
label_ = label empty

label__
  :: forall lock payload
   . String
  -> Domable lock payload
label__ t = label_ [ DC.text_ t ]
