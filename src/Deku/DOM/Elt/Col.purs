module Deku.DOM.Elt.Col where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Col_

col
  :: forall lock payload
   . Event (Attribute Col_)
  -> Array (Domable lock payload)
  -> Domable lock payload
col attributes kids = Domable
  ( Element'
      ( DC.elementify "col" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

col_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
col_ = col empty

col__
  :: forall lock payload
   . String
  -> Domable lock payload
col__ t = col_ [ DC.text_ t ]
